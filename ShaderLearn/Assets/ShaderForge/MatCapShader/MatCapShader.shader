// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33288,y:32621,varname:node_3138,prsc:2|emission-5749-OUT;n:type:ShaderForge.SFN_Tex2d,id:7160,x:31624,y:32874,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_7160,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:1478,x:31784,y:32874,varname:node_1478,prsc:2,tffrom:2,tfto:0|IN-7160-RGB;n:type:ShaderForge.SFN_Transform,id:7381,x:31955,y:32747,varname:node_7381,prsc:2,tffrom:0,tfto:3|IN-1478-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:766,x:32126,y:32747,varname:node_766,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-7381-XYZ;n:type:ShaderForge.SFN_Vector1,id:8881,x:32126,y:32931,varname:node_8881,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:4145,x:32311,y:32747,varname:node_4145,prsc:2|A-766-OUT,B-8881-OUT;n:type:ShaderForge.SFN_Tex2d,id:5459,x:32653,y:32746,ptovrint:False,ptlb:MatCap,ptin:_MatCap,varname:node_5459,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:1,isnm:False|UVIN-1056-OUT;n:type:ShaderForge.SFN_Multiply,id:4151,x:32832,y:32776,varname:node_4151,prsc:2|A-5459-RGB,B-9238-OUT;n:type:ShaderForge.SFN_Fresnel,id:9238,x:32460,y:33038,varname:node_9238,prsc:2|NRM-1478-XYZ,EXP-3855-OUT;n:type:ShaderForge.SFN_Slider,id:3855,x:32102,y:33124,ptovrint:False,ptlb:FresnelPower,ptin:_FresnelPower,varname:node_3855,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.608696,max:10;n:type:ShaderForge.SFN_Multiply,id:5749,x:33063,y:32832,varname:node_5749,prsc:2|A-4151-OUT,B-3515-OUT;n:type:ShaderForge.SFN_Slider,id:3515,x:32696,y:33005,ptovrint:False,ptlb:EnvReflectInt,ptin:_EnvReflectInt,varname:node_3515,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.626087,max:2;n:type:ShaderForge.SFN_Add,id:1056,x:32482,y:32746,varname:node_1056,prsc:2|A-4145-OUT,B-8881-OUT;proporder:7160-5459-3855-3515;pass:END;sub:END;*/

Shader "Shader Forge/MatCapShader" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _MatCap ("MatCap", 2D) = "gray" {}
        _FresnelPower ("FresnelPower", Range(0, 10)) = 3.608696
        _EnvReflectInt ("EnvReflectInt", Range(0, 2)) = 1.626087
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
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform sampler2D _MatCap; uniform float4 _MatCap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPower)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvReflectInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 node_1478 = mul( _NormalMap_var.rgb, tangentTransform ).xyz;
                float node_8881 = 0.5;
                float2 node_1056 = ((mul( UNITY_MATRIX_V, float4(node_1478.rgb,0) ).xyz.rgb.rg*node_8881)+node_8881);
                float4 _MatCap_var = tex2D(_MatCap,TRANSFORM_TEX(node_1056, _MatCap));
                float _FresnelPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPower );
                float _EnvReflectInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvReflectInt );
                float3 emissive = ((_MatCap_var.rgb*pow(1.0-max(0,dot(node_1478.rgb, viewDirection)),_FresnelPower_var))*_EnvReflectInt_var);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
