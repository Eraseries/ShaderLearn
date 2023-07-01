Shader "Counst/polarcoordshader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Opacity ("透明度", Range(0, 1)) = 0.5
        [HDR]_Color ("", Color) = (1.0,1.0,1.0,1.0)
    }
    SubShader
    {
        Tags { 
            "Queue"="Transparent"
            "RenderType"="Transparent" 
            "ForceNoShadowCasting"="True"
            "IgnoreProjector"="True"
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
            uniform half3 _Color;
            //输入结构
            struct VertexInput {               
                float4 vertex : POSITION;               
                float2 uv : TEXCOORD0;
                float4 color : COLOR;//顶点色
            };
            //输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float4 color : COLOR;                   
            };

           VertexOutput vert (VertexInput v) {
            VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.color = v.color;
                return o;
            }
            //输出结构>>>像素
            half4 frag (VertexOutput i) : COLOR
            {
                // sample the texture
                i.uv -= 0.5;
                float theta = atan2(i.uv.y, i.uv.x);
                theta = theta / 3.1415926 * 0.5 + 0.5;
                float r = length(i.uv) + frac(_Time.x * 3);
                i.uv = float2(theta, r);

                half4 col = tex2D(_MainTex, i.uv);
                half3 finalRGB = (1-col.rgb) * _Color;
                half opacity = (1-col.r) * _Opacity * i.color.r;
                return half4(finalRGB * opacity, opacity);
            }
            ENDCG
        }
    }
}
