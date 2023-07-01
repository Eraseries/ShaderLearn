Shader "Counst/CustomLightingShader" {
    Properties {
        [Header(Texture)][Space(50)]
        _MainTex    ("BaseColor", 2D) = "white" {}
        _SpecTex    ("Specular", 2D) = "gray" {}
        _EnvTex     ("EnvirmentColor", 2D) = "black" {}
        [Normal] _NormalMap  ("NormalMap", 2D) = "bump" {}
        _CubeMap    ("CubeMap", Cube) = "_Skybox" {}
        _RimTex     ("RimMask", 2D) = "black" {}
        [Header(diffuse)]
        [HDR] _MainCol    ("Diffuse", Color) = (0.5, 0.5, 0.5, 0.5)
        _EnvUpCol   ("EnvirmentTopColor", Color) = (0.5, 0.0, 0.0, 0.0)
        _EnvSideCol ("EnvirmentSideColor", Color) = (0.0, 0.5, 0.0, 0.0)
        [Gamma] _EnvDownCol ("EnvirmentDownColor", Color) = (0.0, 0.0, 0.5, 0.0)
        _EnvDifInt  ("EnvirmentdiffuseIntensity", Range(0, 2)) = 0.2
        [Header(specular)]
        [PowerSlider(2)] _SpecPow    ("SpecularPower", Range(0, 90)) = 20
        _EnvSpecInt ("EnvirmentspecularIntensity", Range(0, 2)) = 0.2
        _MipMap     ("MipMap", Range(1, 7)) = 1
        _Fresnel    ("Fresnel", Range(0, 5)) = 1
        _RimInt     ("RimIntensity", Range(0, 2)) = 0.2
        _RimPow     ("RimPower", Range(1, 30)) = 1
        [Header(Emission)]
        _EmisInt    ("EmissiveIntensity", Range(0, 10)) = 1
        [HDR] _EmisCol    ("EmissiveColor", Color) = (0.5, 0.5, 0.5, 0.5)        
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
           //Unity中调用函数需要用到的头文件 
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            
            //输入材质面板参数
            //Texture
            uniform sampler2D _MainTex;uniform float4 _MainTex_ST;
            uniform sampler2D _SpecTex;
            uniform sampler2D _NormalMap;
            uniform sampler2D _EnvTex;
            uniform sampler2D _RimTex;
            uniform samplerCUBE _CubeMap;
            //Diffuse
            uniform float3 _MainCol;
            uniform float3 _EnvUpCol;
            uniform float3 _EnvSideCol;
            uniform float3 _EnvDownCol;
            uniform float3 _EmisCol;
            uniform float _EnvDifInt;
            //Specular
            uniform float _SpecPow;
            uniform float _Fresnel;
            uniform float _EnvSpecInt;
            uniform float _MipMap;
            uniform float _RimInt;
            uniform float _RimPow;
            //Emission
            uniform float _EmisInt;

            //输入结构获取模型顶点，法线，uv等数据
            struct VertexInput {                
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 uv0 : TEXCOORD0;
            };
            //输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float4 posWS : TEXCOORD1;
                float3 nDirWS : TEXCOORD2;
                float3 tDirWS : TEXCOORD3;
                float3 bDirWS : TEXCOORD4;
                LIGHTING_COORDS(5, 6)
            };
            //输入结构>>顶点shader>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.uv = TRANSFORM_TEX(v.uv0, _MainTex);
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = normalize(UnityObjectToWorldNormal(v.normal));
                o.tDirWS = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            //3环境色函数
            float3 ColAmbient (float3 n, float3 uCol, float3 sCol, float3 dCol)
            {
                float uMask = max(0.0, n.g);
                float dMask = max(0.0, -n.g);
                float sMask = 1.0 - uMask - dMask;
                float3 envCol = uCol * uMask + sCol * sMask + dCol * dMask;

                return envCol;
            }
            float4 frag(VertexOutput i) : COLOR {
              
                //准备向量
                float3 var_Normalmap = UnpackNormal(tex2D(_NormalMap, i.uv));
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDir = normalize(mul(var_Normalmap, TBN));
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float3 vRDir = normalize(reflect(-vDir, nDir));
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);
                float3 lRDir = reflect(-lDir, nDir);
////// Lighting:
                //计算点积结果
                float diff = dot(nDir, lDir);
                float spec = dot(lRDir, vDir);
                float fren = dot(nDir, vDir);
                //采样纹理
                float4 var_MainTex = tex2D(_MainTex, i.uv);
                float4 var_RimTex = tex2D(_RimTex, i.uv);
                float4 var_SpecTex = tex2D(_SpecTex, i.uv);
                float4 var_EnvTex = tex2D(_EnvTex, i.uv);                
                float3 cubemap = texCUBElod(_CubeMap, float4(vRDir, lerp(_MipMap, 1.0, var_SpecTex.a))).rgb;
                //光照模型(直接光照部分)
                float3 baseCol = var_MainTex.rgb * _MainCol;
                float diffuse = max(0.0, diff);
                float specCol = var_SpecTex.rgb;
                float specPow = lerp(1, _SpecPow, var_SpecTex);
                float3 RimStrength = lerp(1, _RimInt, var_RimTex);
                float RimPow = pow(RimStrength, _RimPow);
                float phong = pow(max(0.0, spec), specPow);
                float shadow = LIGHT_ATTENUATION(i);
                float3 dirLighting = (baseCol * diffuse + specCol * phong) * _LightColor0 * shadow;
                //光照模型（环境光照部分）
                float3 envCol = ColAmbient(nDir, _EnvUpCol, _EnvSideCol, _EnvDownCol);
                float frensnel = pow((1 - fren), RimPow);
                float occlusion = var_MainTex.a;
                
                float3 envLighting = (baseCol * envCol * _EnvDifInt + cubemap * frensnel * _EnvSpecInt * var_SpecTex.a) * occlusion;
////// Emissive:
                float3 emission = var_EnvTex * _EmisInt * _EmisCol;
                
                //返回结果
                float3 finalColor = envLighting + emission + dirLighting;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}