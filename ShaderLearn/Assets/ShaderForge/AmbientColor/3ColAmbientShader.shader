// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33413,y:32421,varname:node_3138,prsc:2|emission-1502-OUT;n:type:ShaderForge.SFN_NormalVector,id:2396,x:31616,y:32786,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:133,x:31807,y:32786,varname:node_133,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-2396-OUT;n:type:ShaderForge.SFN_Max,id:895,x:32044,y:32786,varname:node_895,prsc:2|A-133-OUT,B-5893-OUT;n:type:ShaderForge.SFN_Vector1,id:5893,x:31789,y:32947,varname:node_5893,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:6933,x:32044,y:32911,varname:node_6933,prsc:2|A-133-OUT,B-5655-OUT;n:type:ShaderForge.SFN_Vector1,id:5655,x:31778,y:33065,varname:node_5655,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:4734,x:32235,y:33012,varname:node_4734,prsc:2|A-6933-OUT,B-5893-OUT;n:type:ShaderForge.SFN_Subtract,id:4278,x:32291,y:32807,varname:node_4278,prsc:2|A-179-OUT,B-895-OUT;n:type:ShaderForge.SFN_Vector1,id:179,x:32091,y:32736,varname:node_179,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:4971,x:32519,y:32841,varname:node_4971,prsc:2|A-4278-OUT,B-4734-OUT;n:type:ShaderForge.SFN_Color,id:295,x:32140,y:32272,ptovrint:False,ptlb:Env_up,ptin:_Env_up,varname:node_295,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:822,x:32140,y:32434,ptovrint:False,ptlb:Env_side,ptin:_Env_side,varname:node_822,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:1,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:5976,x:32140,y:32593,ptovrint:False,ptlb:Env_down,ptin:_Env_down,varname:node_5976,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:1358,x:32507,y:32407,varname:node_1358,prsc:2|A-295-RGB,B-895-OUT;n:type:ShaderForge.SFN_Multiply,id:8525,x:32507,y:32539,varname:node_8525,prsc:2|A-822-RGB,B-4971-OUT;n:type:ShaderForge.SFN_Multiply,id:2770,x:32507,y:32660,varname:node_2770,prsc:2|A-5976-RGB,B-4734-OUT;n:type:ShaderForge.SFN_Add,id:2110,x:32744,y:32457,varname:node_2110,prsc:2|A-1358-OUT,B-8525-OUT;n:type:ShaderForge.SFN_Add,id:8588,x:32938,y:32613,varname:node_8588,prsc:2|A-2110-OUT,B-2770-OUT;n:type:ShaderForge.SFN_Multiply,id:1502,x:33191,y:32437,varname:node_1502,prsc:2|A-7556-RGB,B-8588-OUT;n:type:ShaderForge.SFN_Tex2d,id:7556,x:32913,y:32299,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_7556,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;proporder:295-822-5976-7556;pass:END;sub:END;*/

Shader "Shader Forge/3ColAmbientShader" {
    Properties {
        _Env_up ("Env_up", Color) = (1,0.5,0.5,1)
        _Env_side ("Env_side", Color) = (0.5,1,0.5,1)
        _Env_down ("Env_down", Color) = (0.5,0.5,1,1)
        _Texture ("Texture", 2D) = "white" {}
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Env_up)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Env_side)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Env_down)
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
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float4 _Env_up_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Env_up );
                float node_133 = i.normalDir.g;
                float node_5893 = 0.0;
                float node_895 = max(node_133,node_5893);
                float4 _Env_side_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Env_side );
                float node_4734 = max((node_133*(-1.0)),node_5893);
                float4 _Env_down_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Env_down );
                float3 emissive = (_Texture_var.rgb*(((_Env_up_var.rgb*node_895)+(_Env_side_var.rgb*((1.0-node_895)-node_4734)))+(_Env_down_var.rgb*node_4734)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
