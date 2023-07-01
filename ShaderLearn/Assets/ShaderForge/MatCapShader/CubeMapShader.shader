// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33246,y:32713,varname:node_3138,prsc:2|emission-6357-OUT;n:type:ShaderForge.SFN_ViewVector,id:8082,x:31881,y:32670,varname:node_8082,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3958,x:32104,y:32694,varname:node_3958,prsc:2|A-8082-OUT,B-9558-OUT;n:type:ShaderForge.SFN_Vector1,id:9558,x:31896,y:32801,varname:node_9558,prsc:2,v1:-1;n:type:ShaderForge.SFN_Tex2d,id:3605,x:31812,y:32893,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_3605,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:9545,x:32001,y:32893,varname:node_9545,prsc:2,tffrom:2,tfto:0|IN-3605-RGB;n:type:ShaderForge.SFN_Reflect,id:3335,x:32268,y:32774,varname:node_3335,prsc:2|A-3958-OUT,B-9545-XYZ;n:type:ShaderForge.SFN_Cubemap,id:322,x:32463,y:32802,ptovrint:False,ptlb:CubeMap,ptin:_CubeMap,varname:node_322,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:0|DIR-3335-OUT,MIP-1535-OUT;n:type:ShaderForge.SFN_Slider,id:1535,x:32124,y:32951,ptovrint:False,ptlb:MipMap,ptin:_MipMap,varname:node_1535,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:7;n:type:ShaderForge.SFN_Fresnel,id:745,x:32568,y:32994,varname:node_745,prsc:2|NRM-3605-RGB,EXP-9312-OUT;n:type:ShaderForge.SFN_Slider,id:9312,x:32053,y:33129,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:node_9312,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_Multiply,id:457,x:32725,y:32825,varname:node_457,prsc:2|A-322-RGB,B-745-OUT;n:type:ShaderForge.SFN_Multiply,id:6357,x:32969,y:32874,varname:node_6357,prsc:2|A-457-OUT,B-1094-OUT;n:type:ShaderForge.SFN_Slider,id:1094,x:32628,y:33041,ptovrint:False,ptlb:EnvIntensity,ptin:_EnvIntensity,varname:node_1094,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:2;proporder:3605-322-1535-9312-1094;pass:END;sub:END;*/

Shader "Shader Forge/CubeMapShader" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _CubeMap ("CubeMap", Cube) = "_Skybox" {}
        _MipMap ("MipMap", Range(0, 7)) = 1
        _Fresnel ("Fresnel", Range(0, 5)) = 1
        _EnvIntensity ("EnvIntensity", Range(0, 2)) = 2
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
            uniform samplerCUBE _CubeMap;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _MipMap)
                UNITY_DEFINE_INSTANCED_PROP( float, _Fresnel)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvIntensity)
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
                float _MipMap_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MipMap );
                float _Fresnel_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Fresnel );
                float _EnvIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvIntensity );
                float3 emissive = ((texCUBElod(_CubeMap,float4(reflect((viewDirection*(-1.0)),mul( _NormalMap_var.rgb, tangentTransform ).xyz.rgb),_MipMap_var)).rgb*pow(1.0-max(0,dot(_NormalMap_var.rgb, viewDirection)),_Fresnel_var))*_EnvIntensity_var);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
