Shader "counst/WaterShader" {
    Properties {
        _MainTex ("颜色贴图", 2D) = "white" {}
        _WarpTex ("扰动图", 2D) = "gray" {}
        _Speed ("X:流速x Y: 流速y", vector) = (1.0, 1.0, 0.5, 1.0)
        _Warp1Params ("X: 大小 Y: 流速x Z: 流速y W: 强度", vector) = (1.0, 1.0, 0.5, 1.0)
        _Warp2Params ("X: 大小 Y: 流速x Z: 流速y W: 强度", vector) = (2.0, 0.5, 0.5, 1.0)
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
            
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _WarpTex;
            uniform half2 _Speed;
            uniform float4 _Warp1Params;
            uniform float4 _Warp2Params;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
        
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;               
                o.pos = UnityObjectToClipPos( v.vertex );
                o.uv0 = TRANSFORM_TEX(v.uv * frac(_Time.x * _Speed), _MainTex);
                o.uv0 = o.uv0 + frac(_Time.x * _Warp1Params.yz * 1.4);
                o.uv1 = v.uv * _Warp1Params.x - frac(_Time.x * _Warp1Params.yz);
                o.uv2 = v.uv * _Warp2Params.x - frac(_Time.x * _Warp2Params.yz);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                half3 var_Warp1 = tex2D(_WarpTex, i.uv1).rgb;
                half3 var_Warp2 = tex2D(_WarpTex, i.uv2).rgb;
                //扰动混合
                half2 warp = (var_Warp1.xy - 0.5) * _Warp1Params.w * 
                             (var_Warp2.xy - 0.5) * _Warp2Params.w;
                //扰动UV
                float2 warpUV = i.uv0 * warp;
                //采样MainTex
                half4 var_MainTex = tex2D(_MainTex, warpUV);
                //FinalRGB
                half wave = var_Warp1.z * _Warp1Params.w +
                            var_Warp2.z * _Warp2Params.w;
                half3 finalRGB = var_MainTex.rgb * lerp(wave, 1.0, 0.8);
                //Return
                return float4(finalRGB,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
