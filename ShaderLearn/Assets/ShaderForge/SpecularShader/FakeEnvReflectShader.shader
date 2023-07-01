// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33131,y:32753,varname:node_3138,prsc:2|emission-8614-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32866,y:33322,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_LightVector,id:6722,x:31694,y:32686,varname:node_6722,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:877,x:31694,y:32834,varname:node_877,prsc:2;n:type:ShaderForge.SFN_Dot,id:419,x:31918,y:32751,varname:node_419,prsc:2,dt:0|A-6722-OUT,B-877-OUT;n:type:ShaderForge.SFN_RemapRange,id:9765,x:32125,y:32751,varname:node_9765,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-419-OUT;n:type:ShaderForge.SFN_Append,id:2746,x:32324,y:32751,varname:node_2746,prsc:2|A-9765-OUT,B-3034-OUT;n:type:ShaderForge.SFN_Slider,id:3034,x:31982,y:32950,ptovrint:False,ptlb:RampType,ptin:_RampType,varname:node_3034,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3304348,max:1;n:type:ShaderForge.SFN_Tex2d,id:7036,x:32527,y:32751,ptovrint:False,ptlb:RampTex,ptin:_RampTex,varname:node_7036,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-2746-OUT;n:type:ShaderForge.SFN_Multiply,id:2053,x:32759,y:32751,varname:node_2053,prsc:2|A-7036-RGB,B-2073-OUT;n:type:ShaderForge.SFN_Slider,id:2073,x:32400,y:32941,ptovrint:False,ptlb:EnviReflect,ptin:_EnviReflect,varname:node_2073,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.373913,max:1;n:type:ShaderForge.SFN_Max,id:4387,x:32491,y:33059,varname:node_4387,prsc:2|A-419-OUT,B-1404-OUT;n:type:ShaderForge.SFN_Vector1,id:1404,x:32238,y:33158,varname:node_1404,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:9654,x:32746,y:33059,varname:node_9654,prsc:2|VAL-4387-OUT,EXP-1147-OUT;n:type:ShaderForge.SFN_Slider,id:1147,x:32396,y:33247,ptovrint:False,ptlb:SpecularRange,ptin:_SpecularRange,varname:node_1147,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:26.53913,max:90;n:type:ShaderForge.SFN_Add,id:8614,x:32967,y:32858,varname:node_8614,prsc:2|A-2053-OUT,B-9654-OUT;proporder:7241-3034-7036-2073-1147;pass:END;sub:END;*/

Shader "Shader Forge/FakeEnvReflectShader" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3921569,0.7843137,1)
        _RampType ("RampType", Range(0, 1)) = 0.3304348
        _RampTex ("RampTex", 2D) = "white" {}
        _EnviReflect ("EnviReflect", Range(0, 1)) = 0.373913
        _SpecularRange ("SpecularRange", Range(1, 90)) = 26.53913
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
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _RampType)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnviReflect)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularRange)
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
                float node_419 = dot(lightDirection,viewReflectDirection);
                float _RampType_var = UNITY_ACCESS_INSTANCED_PROP( Props, _RampType );
                float2 node_2746 = float2((node_419*0.5+0.5),_RampType_var);
                float4 _RampTex_var = tex2D(_RampTex,TRANSFORM_TEX(node_2746, _RampTex));
                float _EnviReflect_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnviReflect );
                float _SpecularRange_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularRange );
                float3 emissive = ((_RampTex_var.rgb*_EnviReflect_var)+pow(max(node_419,0.0),_SpecularRange_var));
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
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _RampType)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnviReflect)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularRange)
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
