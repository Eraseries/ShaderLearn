Shader "Counst/BlendMode"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
       [Enum(UnityEngine.Rendering.BlendMode)]
       _BlendSrc ("混合源乘子", int) = 0
       [Enum(UnityEngine.Rendering.BlendMode)]
       _BlendDst ("混合目标乘子", int) = 0 
       [Enum(UnityEngine.Rendering.BlendOp)]
       _BlendOp  ("混合运算符", int) = 0
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
            BlendOp [_BlendOp]
            Blend [_BlendDst] [_BlendSrc]
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog
            #pragma multi_compile_fwdbase_fullshadows
            #include "UnityCG.cginc"

            //输入参数
            uniform sampler2D _MainTex;
            uniform float4 _MainTex_ST;
            
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
                
                return col;
            }
            ENDCG
        }
    }
}
