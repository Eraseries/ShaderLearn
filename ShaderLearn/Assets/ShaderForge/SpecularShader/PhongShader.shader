// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34023,y:32403,varname:node_3138,prsc:2|emission-1925-OUT;n:type:ShaderForge.SFN_LightVector,id:6812,x:32009,y:32630,varname:node_6812,prsc:2;n:type:ShaderForge.SFN_Vector1,id:7097,x:31971,y:32789,varname:node_7097,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:6225,x:32192,y:32703,varname:node_6225,prsc:2|A-6812-OUT,B-7097-OUT;n:type:ShaderForge.SFN_NormalVector,id:7622,x:32223,y:32869,prsc:2,pt:False;n:type:ShaderForge.SFN_ViewVector,id:8526,x:32441,y:32930,varname:node_8526,prsc:2;n:type:ShaderForge.SFN_Dot,id:465,x:32645,y:32782,varname:node_465,prsc:2,dt:0|A-2387-OUT,B-3050-OUT;n:type:ShaderForge.SFN_Max,id:9903,x:32828,y:32833,varname:node_9903,prsc:2|A-465-OUT,B-221-OUT;n:type:ShaderForge.SFN_Vector1,id:221,x:32624,y:32964,varname:node_221,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:5823,x:33159,y:32859,varname:node_5823,prsc:2|VAL-9903-OUT,EXP-6583-OUT;n:type:ShaderForge.SFN_Slider,id:6583,x:32671,y:33057,ptovrint:False,ptlb:HighLightRange,ptin:_HighLightRange,varname:node_6583,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:26.13913,max:60;n:type:ShaderForge.SFN_Reflect,id:5334,x:32424,y:32770,varname:node_5334,prsc:2|A-6225-OUT,B-7622-OUT;n:type:ShaderForge.SFN_LightVector,id:4928,x:32996,y:32415,varname:node_4928,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:6105,x:32996,y:32563,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:3964,x:33211,y:32455,varname:node_3964,prsc:2,dt:0|A-4928-OUT,B-6105-OUT;n:type:ShaderForge.SFN_RemapRange,id:6238,x:33374,y:32455,varname:node_6238,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-3964-OUT;n:type:ShaderForge.SFN_Add,id:4896,x:33554,y:32546,varname:node_4896,prsc:2|A-6238-OUT,B-2412-OUT;n:type:ShaderForge.SFN_Color,id:6711,x:33606,y:32753,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_6711,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:1925,x:33780,y:32598,varname:node_1925,prsc:2|A-4896-OUT,B-6711-RGB;n:type:ShaderForge.SFN_Color,id:2219,x:33159,y:32694,ptovrint:False,ptlb:HighColor,ptin:_HighColor,varname:node_2219,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2412,x:33406,y:32728,varname:node_2412,prsc:2|A-2219-RGB,B-5823-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:2387,x:32266,y:32517,varname:node_2387,prsc:2;n:type:ShaderForge.SFN_LightVector,id:3050,x:32556,y:32519,varname:node_3050,prsc:2;proporder:6583-6711-2219;pass:END;sub:END;*/

Shader "Shader Forge/PhongShader" {
    Properties {
        _HighLightRange ("HighLightRange", Range(1, 60)) = 26.13913
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _HighColor ("HighColor", Color) = (0.5,0.5,0.5,1)
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _HighLightRange)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighColor)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float4 _HighColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighColor );
                float _HighLightRange_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighLightRange );
                float4 _Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Color );
                float3 emissive = (((dot(lightDirection,i.normalDir)*0.5+0.5)+(_HighColor_var.rgb*pow(max(dot(viewReflectDirection,lightDirection),0.0),_HighLightRange_var)))*_Color_var.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _HighLightRange)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighColor)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
