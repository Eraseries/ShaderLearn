Shader "Counst/ScreenWarpshader"
{
    Properties
    {
        _MainTex    ("RGB: 颜色 A: 透贴", 2D) = "white" {}
        _Opacity    ("透明度", Range(0, 1)) = 0.5
        _WarpMidval ("扰动中间值", Range(0, 1)) = 0.5
        _WarpInt    ("扰动强度", Range(0, 5)) = 1
    }
    SubShader
    {
        Tags { 
            "Queue"="Transparent"
            "RenderType"="Transparent" 
            "ForceNoShadowCasting"="True"
            "IgnoreProjector"="True"
        }
        GrabPass {
            "_BGTex"
        }
        Pass
        {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One OneMinusSrcAlpha
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog
            #pragma multi_compile_fwdbase_fullshadows
            #include "UnityCG.cginc"

            //输入参数
            uniform sampler2D _MainTex;
            uniform float4 _MainTex_ST;
            uniform half _Opacity;
            uniform half _WarpMidval;
            uniform half _WarpInt;
            uniform sampler2D _BGTex;
            //输入结构
            struct VertexInput {               
                float4 vertex : POSITION;               
                float2 uv : TEXCOORD0;
            };
            //输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float4 grapPos : TEXCOORD1;                  
            };

           VertexOutput vert (VertexInput v) {
            VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.grapPos = ComputeGrabScreenPos(o.pos);
                return o;
            }
            //输出结构>>>像素
            half4 frag (VertexOutput i) : COLOR
            {
                // sample the texture
                half4 col = tex2D(_MainTex, i.uv);
                i.grapPos.xy += (col.r - _WarpMidval) * _WarpInt * _Opacity;
                half3 var_BGTex = tex2Dproj(_BGTex, i.grapPos).rgb;

                half3 finalRGB = col.rgb * var_BGTex;
                half opacity = col.a;
                return half4(finalRGB * opacity, opacity);
            }
            ENDCG
        }
    }
}
