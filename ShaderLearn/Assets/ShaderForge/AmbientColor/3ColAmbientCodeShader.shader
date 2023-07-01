Shader "Counst/3ColAmbientCodeShader" {
    Properties {
        _upColor ("EnvUp", Color) = (0.7843138,0.3921569,0.07843137,1)
        _sideColor ("EnvSide", Color) = (0.07843138,0.921569,0.07843137,1)
        _downColor ("EnvDown", Color) = (0.07843138,0.3921569,0.7843137,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            
            uniform float3 _upColor;
            uniform float3 _sideColor;
            uniform float3 _downColor;
            uniform sampler2D _Occlusion;
            uniform float _SpecularPow;
            
            struct VertexInput {
                
                float4 vertex : POSITION;
                float4 normal : NORMAL;
                float2 uv0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 posCS : SV_POSITION;
                float3 nDirWS : TEXCOORD0;
                float2 uv : TEXCOORD1;
                
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                
                o.posCS = UnityObjectToClipPos( v.vertex );
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.uv = v.uv0;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
              
////// Lighting:
                float3 nDir = i.nDirWS;
                float Maskup = max(0.0, nDir.g);
                float Maskdown = max(0.0, -nDir.g);
                float Maskside = 1.0 - Maskup - Maskdown;
                float3 EnvCol = _upColor * Maskup + _downColor * Maskdown + _sideColor * Maskside;

                float3 Ao = tex2D(_Occlusion, i.uv);
                float3 finalColor = EnvCol * Ao;
                //Phong光照模型
                //float3 reflectDir = normalize(reflect(lDir * (-1.0), nDir));
                //float Spec = pow(max(dot(reflectDir,vDir), 0.0), _SpecularPow);

                //BlingPhong光照模型
                //float3 hDir = normalize(vDir + lDir);
                //float Spec = pow(max(dot(nDir, hDir), 0.0), _SpecularPow);
////// Emissive:
         
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}