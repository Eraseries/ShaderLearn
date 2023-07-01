Shader "Counst/TestCodeShaderLambert" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3921569,0.7843137,1)
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
            //#pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            //UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
            //UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                //UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float4 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float3 normalDir : TEXCOORD0;
                //UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                //UNITY_SETUP_INSTANCE_ID( v );
                //UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.pos = UnityObjectToClipPos( v.vertex );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
               // UNITY_SETUP_INSTANCE_ID( i );
////// Lighting:
                float3 nDir = i.normalDir;
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);
                float diff = dot(nDir, lDir);
                float diffuse = max(0.0, diff);
////// Emissive:
                float4 _Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Color );
                float3 emissive = _Color_var.rgb;
                float3 finalColor = emissive * diffuse;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}