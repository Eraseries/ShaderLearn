Shader "Counst/Rotationshader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Opacity ("透明度", Range(0, 1)) = 0.5
        _RotateRange ("旋转角度范围", Range(0.0, 90.0)) = 10.0
        _RotatSpeed ("旋转角速度", Range(0.0, 3.0)) = 1.0
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
            uniform half _RotateRange;
            uniform half _RotatSpeed;
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
            //声明常量
            #define TWO_PI 6.283185
            //顶点位移函数
            void Rotation (inout float3 vertex)
            {
                float angleY = _RotateRange * sin(frac(_Time.z * _RotatSpeed) * TWO_PI);
                float radY = radians(angleY);//角度转换成弧度
                float sinY, cosY = 0;
                sincos(radY, sinY, cosY);
                vertex.xz = float2(
                    vertex.x * cosY - vertex.z * sinY,
                    vertex.x * sinY + vertex.z * cosY
                );
            }

           VertexOutput vert (VertexInput v) {
            VertexOutput o = (VertexOutput)0;
                Rotation(v.vertex.xyz);
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
    }
}
