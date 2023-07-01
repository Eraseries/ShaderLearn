// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:0,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32819,y:31863,varname:node_3138,prsc:2|emission-2662-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32378,y:32744,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6980392,c2:0.2752147,c3:0.1019608,c4:1;n:type:ShaderForge.SFN_TexCoord,id:7817,x:31966,y:32941,varname:node_7817,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:8381,x:32764,y:32383,ptovrint:False,ptlb:node_8381,ptin:_node_8381,varname:node_8381,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False|UVIN-173-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:888,x:32337,y:32971,ptovrint:False,ptlb:node_888,ptin:_node_888,varname:node_888,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_Vector4Property,id:194,x:31657,y:32570,ptovrint:False,ptlb:LightDir,ptin:_LightDir,varname:node_194,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:1,v3:0,v4:0;n:type:ShaderForge.SFN_Normalize,id:8596,x:31833,y:32570,varname:node_8596,prsc:2|IN-194-XYZ;n:type:ShaderForge.SFN_NormalVector,id:7165,x:31765,y:32732,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:8270,x:32052,y:32625,varname:node_8270,prsc:2,dt:0|A-1163-OUT,B-7165-OUT;n:type:ShaderForge.SFN_Clamp01,id:532,x:32180,y:32264,varname:node_532,prsc:2|IN-2940-OUT;n:type:ShaderForge.SFN_RemapRange,id:2793,x:32324,y:32318,varname:node_2793,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-2940-OUT;n:type:ShaderForge.SFN_LightVector,id:9573,x:31733,y:32245,varname:node_9573,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:2936,x:31733,y:32378,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:2940,x:31944,y:32264,varname:node_2940,prsc:2,dt:0|A-9573-OUT,B-2936-OUT;n:type:ShaderForge.SFN_OneMinus,id:1163,x:31902,y:32452,varname:node_1163,prsc:2|IN-9573-OUT;n:type:ShaderForge.SFN_Multiply,id:1713,x:32447,y:32491,varname:node_1713,prsc:2|A-3433-RGB,B-8147-OUT;n:type:ShaderForge.SFN_Blend,id:8991,x:32782,y:32639,varname:node_8991,prsc:2,blmd:6,clmp:True|SRC-2793-OUT,DST-4889-OUT;n:type:ShaderForge.SFN_AmbientLight,id:3433,x:32094,y:32465,varname:node_3433,prsc:2;n:type:ShaderForge.SFN_Slider,id:8147,x:32120,y:32591,ptovrint:False,ptlb:Light_strength,ptin:_Light_strength,varname:node_8147,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7478261,max:1;n:type:ShaderForge.SFN_Multiply,id:4889,x:32611,y:32567,varname:node_4889,prsc:2|A-1713-OUT,B-7241-RGB;n:type:ShaderForge.SFN_Append,id:173,x:32594,y:32353,varname:node_173,prsc:2|A-2793-OUT,B-8147-OUT;n:type:ShaderForge.SFN_Vector4Property,id:3009,x:31944,y:32125,ptovrint:False,ptlb:node_3009,ptin:_node_3009,varname:node_3009,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5,v2:0.6,v3:0.1,v4:0;n:type:ShaderForge.SFN_Step,id:2662,x:32180,y:32151,varname:node_2662,prsc:2|A-3009-XYZ,B-2940-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:3684,x:31775,y:31926,ptovrint:False,ptlb:node_3684,ptin:_node_3684,varname:node_3684,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8021,x:32031,y:31785,varname:node_8021,prsc:2,ntxv:0,isnm:False|UVIN-7962-UVOUT,TEX-3684-TEX;n:type:ShaderForge.SFN_TexCoord,id:7962,x:31546,y:31747,varname:node_7962,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:9432,x:32373,y:31888,varname:node_9432,prsc:2;proporder:7241-194-8147-8381-3009;pass:END;sub:END;*/

Shader "Shader Forge/TestCodeShader" {
    Properties {
        _Color ("Color", Color) = (0.6980392,0.2752147,0.1019608,1)
        _LightDir ("LightDir", Vector) = (0,1,0,0)
        _Light_strength ("Light_strength", Range(0, 1)) = 0.7478261
        _node_8381 ("node_8381", 2D) = "black" {}
        _node_3009 ("node_3009", Vector) = (0.5,0.6,0.1,0)
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
                UNITY_DEFINE_INSTANCED_PROP( float4, _node_3009)
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
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float4 _node_3009_var = UNITY_ACCESS_INSTANCED_PROP( Props, _node_3009 );
                float node_2940 = dot(lightDirection,i.normalDir);
                float3 emissive = step(_node_3009_var.rgb,node_2940);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
