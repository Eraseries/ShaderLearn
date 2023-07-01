Shader "Counst/PhongCodeShader" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3921569,0.7843137,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            
            uniform float3 _Color;
            uniform float _SpecularPow;
            
            struct VertexInput {
                
                float4 vertex : POSITION;
                float4 normal : NORMAL;
            };
            struct VertexOutput {
                float4 posCS : SV_POSITION;
                float3 posWS : TEXCOORD0;
                float3 nDirWS : TEXCOORD1;
                
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                
                o.posCS = UnityObjectToClipPos( v.vertex );
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
              
////// Lighting:
                float3 nDir = i.nDirWS;
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);
                float diff = dot(nDir, lDir);
                float diffuse = diff * 0.5 + 0.5;
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                
                //Phong光照模型
                float3 reflectDir = normalize(reflect(lDir * (-1.0), nDir));
                float Spec = pow(max(dot(reflectDir,vDir), 0.0), _SpecularPow);

                //BlingPhong光照模型
                //float3 hDir = normalize(vDir + lDir);
                //float Spec = pow(max(dot(nDir, hDir), 0.0), _SpecularPow);
////// Emissive:
                float3 emissive = _Color.rgb;
                float3 finalColor = emissive * diffuse + Spec;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}