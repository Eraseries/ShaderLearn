Shader "Counst/CubeMapCodeShader" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _CubeMap ("CubeMap", Cube) = "_Skybox" {}
        _MipMap ("MipMap", Range(0, 7)) = 1
        _Fresnel ("Fresnel", Range(0, 5)) = 1
        _EnvIntensity ("EnvIntensity", Range(0, 2)) = 2
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            
            uniform sampler2D _NormalMap;
            uniform samplerCUBE _CubeMap;
            uniform float _Fresnel;
            uniform float _EnvIntensity;
            uniform float _MipMap;

            struct VertexInput {
                //UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 uv0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float4 posWS : TEXCOORD1;
                float3 nDirWS : TEXCOORD2;
                float3 tDirWS : TEXCOORD3;
                float3 bDirWS : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.uv = v.uv0;
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = normalize(UnityObjectToWorldNormal(v.normal));
                o.tDirWS = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
              
                float3 var_Normalmap = UnpackNormal(tex2D(_NormalMap, i.uv));
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDir = normalize(mul(var_Normalmap, TBN));
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float3 vRDir = normalize(reflect(-vDir, nDir));
                
////// Lighting:                
                float fren = dot(nDir, vDir);
                float frensnel = pow((1 - fren), _Fresnel);
                float3 cubemap = texCUBElod(_CubeMap, float4(vRDir, _MipMap));
////// Emissive:
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);
                float diff = dot(nDir, lDir);
                float diffuse = max(0.0, diff);
                float3 EnvSpec = cubemap * frensnel * _EnvIntensity;
                float3 finalColor = diffuse + EnvSpec;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}