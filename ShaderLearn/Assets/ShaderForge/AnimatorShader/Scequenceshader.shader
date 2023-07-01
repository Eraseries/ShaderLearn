Shader "Counst/Scequenceshader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Opacity ("透明度", Range(0, 1)) = 0.5
        _Scequence ("序列帧", 2D) = "gray" {}
        _Rownum ("行数", int) = 1
        _Colnum ("列数", int) = 1
        _Speed ("播放速度", Range(0.0, 6.0)) = 0
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
            Name "FORWARD_AB"
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
            //输入结构
            struct VertexInput {               
                float4 vertex : POSITION;               
                float2 uv : TEXCOORD0;
            };
            //输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;                   
            };

           VertexOutput vert (VertexInput v) {
            VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                
                return o;
            }
            //输出结构>>>像素
            half4 frag (VertexOutput i) : COLOR
            {
                // sample the texture
                half4 col = tex2D(_MainTex, i.uv);
                half3 finalRGB = col.rgb;
                half opacity = col.a * _Opacity;
                return half4(finalRGB * opacity, opacity);
            }
            ENDCG
        }
        pass 
        {
            Name "FORWARD_AD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One           //修改混合方式
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog
            #pragma multi_compile_fwdbase_fullshadows
            #include "UnityCG.cginc"

            //输入参数
            uniform sampler2D _Scequence; uniform float4 _Scequence_ST;
            uniform half _Rownum;
            uniform half _Colnum;
            uniform half _Speed;
            //输入结构
            struct VertexInput {               
                float4 vertex : POSITION;               
                float2 uv : TEXCOORD0;
                float3 normal : NORMAL;
            };
            //输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;                   
            };

           VertexOutput vert (VertexInput v) {
            VertexOutput o = (VertexOutput)0;
                v.vertex += v.vertex * 0.02;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _Scequence);
                float id = floor(_Time.z * _Speed);
                float idv = floor(id / _Colnum);
                float idu = id - idv * _Colnum;
                float stepU = 1.0 / _Colnum;
                float stepV = 1.0 / _Rownum;
                float2 initUV = o.uv * float2(stepU, stepV) + float2(0.0, stepV * (_Rownum - 1));
                o.uv = initUV + float2(idu * stepU, -idv * stepV);
                return o;
            }
            //输出结构>>>像素
            half4 frag (VertexOutput i) : COLOR
            {
                // sample the texture
                half4 col = tex2D(_Scequence, i.uv);
                half3 finalRGB = col.rgb;
                half opacity = col.a;
                return half4(finalRGB * opacity, opacity);
            }
            ENDCG
        }
    }
}
