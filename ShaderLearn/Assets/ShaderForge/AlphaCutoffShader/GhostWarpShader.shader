Shader "Counst/GhostWarpshader"
{
    Properties
    {
        _MainTex   ("Texture", 2D) = "white" {}
        _Opacity   ("透明度", Range(0, 1)) = 0.5
        _WrapTex   ("扭曲图", 2D) = "gray" {}
        _WarpInt   ("扭曲强度", Range(0, 5)) = 2
        _NoiseInt  ("噪声强度", Range(0, 5)) = 0.5
        _FlowSpeed ("流动速度", Range(0, 10)) = 2
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
            Blend one OneMinusSrcAlpha           //修改混合方式
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog
            #pragma multi_compile_fwdbase_fullshadows
            #include "UnityCG.cginc"

            //输入参数
            uniform sampler2D _MainTex;
            uniform sampler2D _WarpTex;
            uniform half _NoiseInt;
            uniform half _FlowSpeed;
            uniform float4 _WarpTex_ST;
            uniform float4 _MainTex_ST;
            uniform half _Opacity;
            uniform half _WarpInt;
            //输入结构
            struct VertexInput {               
                float4 vertex : POSITION;               
                float2 uv : TEXCOORD0;
            };
            //输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float2 uv1 : TEXCOORD1;                   
            };

           VertexOutput vert (VertexInput v) {
            VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.uv1 = TRANSFORM_TEX(v.uv, _WarpTex);
                o.uv1.x = o.uv1.x + frac(-_Time.x * _FlowSpeed);
                return o;
            }
            //输出结构>>>像素
            half4 frag (VertexOutput i) : COLOR
            {
                half3 var_WarpTex = tex2D(_WarpTex, i.uv1).rgb;
                float2 uvBias = (var_WarpTex.rg - 0.5) * _WarpInt;
                float2 uv0 = i.uv + uvBias;
                half4 col = tex2D(_MainTex, uv0);

                half3 finalRGB = col.rgb;
                half noise = lerp(1.0, var_WarpTex.b * 2.0, _NoiseInt);
                noise = max(0.0, noise);
                half opacity = col.a * noise * _Opacity;
                return half4(finalRGB * opacity, opacity);
            }
            ENDCG
        }
    }
}
