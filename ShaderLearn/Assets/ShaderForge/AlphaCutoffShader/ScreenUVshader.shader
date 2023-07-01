Shader "Counst/ScreenUVshader"
{
    Properties
    {
        _MainTex   ("RGB: 颜色 A: 透贴", 2D) = "gray" {}
        _Opacity   ("透明度", Range(0, 1)) = 0.5
        _ScreenTex ("屏幕纹理", 2D) = "black"
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
            uniform sampler2D _ScreenTex;
            uniform float4 _ScreenTex_ST;
            //输入结构
            struct VertexInput {               
                float4 vertex : POSITION;               
                float2 uv : TEXCOORD0;
            };
            //输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float2 ScreenUV : TEXCOORD1;                   
            };

           VertexOutput vert (VertexInput v) {
            VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                float3 posVS = UnityObjectToViewPos(v.vertex).xyz;
                float originDist = UnityObjectToViewPos(float3(0.0, 0.0, 0.0)).z;
                o.ScreenUV = posVS.xy / posVS.z;
                o.ScreenUV *= originDist;
                o.ScreenUV = o.ScreenUV * _ScreenTex_ST.xy - frac(_Time.x * _ScreenTex_ST.zw);
                return o;
            }
            //输出结构>>>像素
            half4 frag (VertexOutput i) : COLOR
            {
                // sample the texture
                half4 col = tex2D(_MainTex, i.uv);
                half var_screentex = tex2D(_ScreenTex, i.ScreenUV).r;
                half3 finalRGB = col.rgb;
                half opacity = col.a * _Opacity * var_screentex;
                return half4(finalRGB * opacity, opacity);
            }
            ENDCG
        }
    }
}
