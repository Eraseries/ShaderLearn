Shader "Custom/ReflectionShader"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "white" {}
        _ReflectionTex ("Reflection Texture", 2D) = "white" {}
        _ReflectionStrength ("Reflection Strength", Range(0, 1)) = 0.5
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdbase

            #include "UnityCG.cginc"

            sampler2D _MainTex;
            sampler2D _ReflectionTex;
            float _ReflectionStrength;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                // 反射贴图采样
                fixed4 reflectionColor = tex2D(_ReflectionTex, i.uv);

                // 反转UV坐标（根据需要进行调整）
                float2 reflectedUV = float2(i.uv.x, 1.0 - i.uv.y);

                // 主纹理采样
                fixed4 mainColor = tex2D(_MainTex, reflectedUV);

                // 将反射贴图颜色与主纹理颜色相乘
                fixed4 finalColor = lerp(mainColor, reflectionColor, _ReflectionStrength);

                return finalColor;
            }
            ENDCG
        }
    }

    FallBack "Diffuse"
}
