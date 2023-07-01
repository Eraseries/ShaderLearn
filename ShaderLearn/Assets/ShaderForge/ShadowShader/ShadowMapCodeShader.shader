Shader "Counst/ShadowMapCodeShader" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3921569,0.7843137,1)
        _upColor ("EnvUp", Color) = (0.7843138,0.3921569,0.07843137,1)
        _sideColor ("EnvSide", Color) = (0.07843138,0.921569,0.07843137,1)
        _downColor ("EnvDown", Color) = (0.07843138,0.3921569,0.7843137,1)
        _HighLightColor("SpecColor", Color) = (0.5, 0.5, 0.5, 0.5)
        _LightColor("LightCol", Color) = (1.0, 1.0, 1.0, 1.0)
        _EnvIntersity("EnvStrength", Range(0, 2)) = 0.2 
        _Occlusion ("AOTexture", 2D) = "white" {}
        _SpecularPow ("SpecularRange", Range(1, 90)) = 10
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            
            uniform float3 _Color;
            uniform float3 _upColor;
            uniform float3 _sideColor;
            uniform float3 _downColor;
            uniform float3 _LightColor;
            uniform float _EnvIntersity;
            uniform float3 _HighLightColor;
            uniform sampler2D _Occlusion;
            uniform float _SpecularPow;
            
            struct VertexInput {
                
                float4 vertex : POSITION;
                float4 normal : NORMAL;
                float2 uv0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float4 posWS : TEXCOORD1;
                float3 nDirWS : TEXCOORD2;
                
                LIGHTING_COORDS(3,4)
                
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                
                o.pos = UnityObjectToClipPos( v.vertex );
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.uv = v.uv0;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
              
////// Lighting:
                float3 nDir = i.nDirWS;
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);
                float diff = dot(nDir, lDir);
                float diffuse = diff * 0.5 + 0.5;
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float Maskup = max(0.0, nDir.g);
                float Maskdown = max(0.0, -nDir.g);
                float Maskside = 1.0 - Maskup - Maskdown;
                float3 EnvCol = (_upColor * Maskup + _downColor * Maskdown + _sideColor * Maskside) * _EnvIntersity;
                
                //Phong光照模型
                float3 reflectDir = normalize(reflect(lDir * (-1.0), nDir));
                float Spec = pow(max(dot(reflectDir,vDir), 0.0), _SpecularPow) * _HighLightColor;

                //BlingPhong光照模型
                //float3 hDir = normalize(vDir + lDir);
                //float Spec = pow(max(dot(nDir, hDir), 0.0), _SpecularPow);
////// Emissive:
                float3 Ao = tex2D(_Occlusion, i.uv);
                float3 emissive = (_Color.rgb * diffuse + Spec) * _LightColor.rgb;
                float atten = LIGHT_ATTENUATION(i);
                float3 Shadow = emissive * atten;
                float3 finalColor = Shadow + EnvCol * Ao * _Color.rgb;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}