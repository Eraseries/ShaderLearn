// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33622,y:32674,varname:node_3138,prsc:2|emission-5714-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:7409,x:32601,y:32654,varname:node_7409,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:2588,x:30967,y:32576,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:6379,x:30550,y:32412,varname:node_6379,prsc:2;n:type:ShaderForge.SFN_Dot,id:7781,x:31260,y:32446,varname:node_7781,prsc:2,dt:0|A-6379-OUT,B-2588-OUT;n:type:ShaderForge.SFN_RemapRange,id:4135,x:31636,y:32469,varname:node_4135,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-7781-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:8434,x:30974,y:32927,varname:node_8434,prsc:2;n:type:ShaderForge.SFN_Dot,id:8469,x:31261,y:32838,varname:node_8469,prsc:2,dt:0|A-2588-OUT,B-2884-OUT;n:type:ShaderForge.SFN_Max,id:4928,x:31454,y:32848,varname:node_4928,prsc:2|A-8469-OUT,B-4143-OUT;n:type:ShaderForge.SFN_Vector1,id:4143,x:31195,y:33041,varname:node_4143,prsc:2,v1:0;n:type:ShaderForge.SFN_NormalVector,id:2750,x:31111,y:33314,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:2591,x:31310,y:33314,varname:node_2591,prsc:2,cc1:2,cc2:-1,cc3:-1,cc4:-1|IN-2750-OUT;n:type:ShaderForge.SFN_Multiply,id:7640,x:31537,y:33297,varname:node_7640,prsc:2|A-2591-OUT,B-6085-OUT;n:type:ShaderForge.SFN_Vector1,id:6085,x:31310,y:33500,varname:node_6085,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:5264,x:31749,y:33297,varname:node_5264,prsc:2|A-7640-OUT,B-2200-OUT;n:type:ShaderForge.SFN_Vector1,id:2200,x:31422,y:33611,varname:node_2200,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:3494,x:31622,y:33471,varname:node_3494,prsc:2|A-2591-OUT,B-2200-OUT;n:type:ShaderForge.SFN_Add,id:3766,x:31957,y:33408,varname:node_3766,prsc:2|A-5264-OUT,B-3494-OUT;n:type:ShaderForge.SFN_Vector1,id:1604,x:31936,y:33348,varname:node_1604,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:7633,x:32186,y:33443,varname:node_7633,prsc:2|A-1604-OUT,B-3766-OUT;n:type:ShaderForge.SFN_Color,id:5841,x:32040,y:32904,ptovrint:False,ptlb:upColor,ptin:_upColor,varname:node_5841,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:5870,x:32040,y:33062,ptovrint:False,ptlb:sideColor,ptin:_sideColor,varname:node_5870,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1,c2:0.5,c3:0.1,c4:1;n:type:ShaderForge.SFN_Color,id:1073,x:32040,y:33216,ptovrint:False,ptlb:downColor,ptin:_downColor,varname:node_1073,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:9737,x:32352,y:33034,varname:node_9737,prsc:2|A-5841-RGB,B-3494-OUT;n:type:ShaderForge.SFN_Multiply,id:9284,x:32352,y:33195,varname:node_9284,prsc:2|A-1073-RGB,B-5264-OUT;n:type:ShaderForge.SFN_Add,id:1278,x:32549,y:33102,varname:node_1278,prsc:2|A-9737-OUT,B-9284-OUT;n:type:ShaderForge.SFN_Multiply,id:6520,x:32608,y:33309,varname:node_6520,prsc:2|A-5870-RGB,B-7633-OUT;n:type:ShaderForge.SFN_Add,id:2367,x:32829,y:33196,varname:node_2367,prsc:2|A-1278-OUT,B-6520-OUT;n:type:ShaderForge.SFN_Tex2d,id:6006,x:32939,y:32901,ptovrint:False,ptlb:AOtexture,ptin:_AOtexture,varname:node_6006,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2181,x:33147,y:32996,varname:node_2181,prsc:2|A-6006-RGB,B-3101-OUT;n:type:ShaderForge.SFN_Color,id:1389,x:32340,y:32569,ptovrint:False,ptlb:LightCol,ptin:_LightCol,varname:node_1389,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:8835,x:32106,y:32595,varname:node_8835,prsc:2|A-4861-OUT,B-9222-OUT;n:type:ShaderForge.SFN_Multiply,id:9174,x:32581,y:32836,varname:node_9174,prsc:2|A-1389-RGB,B-8835-OUT;n:type:ShaderForge.SFN_Multiply,id:8090,x:32800,y:32703,varname:node_8090,prsc:2|A-7409-OUT,B-9174-OUT;n:type:ShaderForge.SFN_Add,id:5714,x:33389,y:32851,varname:node_5714,prsc:2|A-8090-OUT,B-2181-OUT;n:type:ShaderForge.SFN_Power,id:1965,x:31670,y:32848,varname:node_1965,prsc:2|VAL-4928-OUT,EXP-3442-OUT;n:type:ShaderForge.SFN_Slider,id:3442,x:31250,y:33152,ptovrint:False,ptlb:HighLight,ptin:_HighLight,varname:node_3442,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:23.1501,max:90;n:type:ShaderForge.SFN_Color,id:5449,x:31636,y:32288,ptovrint:False,ptlb:BaseCol,ptin:_BaseCol,varname:node_5449,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:4861,x:31848,y:32322,varname:node_4861,prsc:2|A-5449-RGB,B-9238-OUT;n:type:ShaderForge.SFN_Max,id:9238,x:31558,y:32617,varname:node_9238,prsc:2|A-7781-OUT,B-4143-OUT;n:type:ShaderForge.SFN_Multiply,id:4120,x:33062,y:33211,varname:node_4120,prsc:2|A-2367-OUT,B-8013-OUT;n:type:ShaderForge.SFN_Slider,id:8013,x:32700,y:33436,ptovrint:False,ptlb:Envstrength,ptin:_Envstrength,varname:node_8013,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5913064,max:2;n:type:ShaderForge.SFN_Multiply,id:3101,x:33244,y:33165,varname:node_3101,prsc:2|A-5449-RGB,B-4120-OUT;n:type:ShaderForge.SFN_ViewVector,id:651,x:30529,y:32599,varname:node_651,prsc:2;n:type:ShaderForge.SFN_Add,id:9325,x:30783,y:32544,varname:node_9325,prsc:2|A-6379-OUT,B-651-OUT;n:type:ShaderForge.SFN_Normalize,id:2884,x:30945,y:32745,varname:node_2884,prsc:2|IN-9325-OUT;n:type:ShaderForge.SFN_Color,id:9556,x:31723,y:32707,ptovrint:False,ptlb:HighLightColor,ptin:_HighLightColor,varname:node_9556,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:9222,x:31891,y:32755,varname:node_9222,prsc:2|A-9556-RGB,B-1965-OUT;proporder:5841-5870-1073-6006-1389-3442-5449-8013-9556;pass:END;sub:END;*/

Shader "Shader Forge/ShadowMapShader" {
    Properties {
        _upColor ("upColor", Color) = (0.5,0,0,1)
        _sideColor ("sideColor", Color) = (0.1,0.5,0.1,1)
        _downColor ("downColor", Color) = (0,0,0,1)
        _AOtexture ("AOtexture", 2D) = "white" {}
        _LightCol ("LightCol", Color) = (1,1,1,1)
        _HighLight ("HighLight", Range(0, 90)) = 23.1501
        _BaseCol ("BaseCol", Color) = (0.5,0.5,0.5,1)
        _Envstrength ("Envstrength", Range(0, 2)) = 0.5913064
        _HighLightColor ("HighLightColor", Color) = (0.5,0.5,0.5,1)
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _AOtexture; uniform float4 _AOtexture_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _upColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _sideColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _downColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _HighLight)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _Envstrength)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighLightColor)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol );
                float4 _BaseCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseCol );
                float node_7781 = dot(lightDirection,i.normalDir);
                float node_4143 = 0.0;
                float4 _HighLightColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighLightColor );
                float _HighLight_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighLight );
                float4 _AOtexture_var = tex2D(_AOtexture,TRANSFORM_TEX(i.uv0, _AOtexture));
                float4 _upColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _upColor );
                float node_2591 = i.normalDir.b;
                float node_2200 = 0.0;
                float node_3494 = max(node_2591,node_2200);
                float4 _downColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _downColor );
                float node_5264 = max((node_2591*(-1.0)),node_2200);
                float4 _sideColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _sideColor );
                float _Envstrength_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Envstrength );
                float3 emissive = ((attenuation*(_LightCol_var.rgb*((_BaseCol_var.rgb*max(node_7781,node_4143))+(_HighLightColor_var.rgb*pow(max(dot(i.normalDir,normalize((lightDirection+viewDirection))),node_4143),_HighLight_var)))))+(_AOtexture_var.rgb*(_BaseCol_var.rgb*((((_upColor_var.rgb*node_3494)+(_downColor_var.rgb*node_5264))+(_sideColor_var.rgb*(1.0-(node_5264+node_3494))))*_Envstrength_var))));
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _AOtexture; uniform float4 _AOtexture_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _upColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _sideColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _downColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _HighLight)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _Envstrength)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighLightColor)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
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
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
