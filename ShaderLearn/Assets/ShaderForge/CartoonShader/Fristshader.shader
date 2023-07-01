// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33416,y:32846,varname:node_3138,prsc:2|emission-6336-OUT,olwid-7600-OUT,olcol-4745-OUT;n:type:ShaderForge.SFN_Dot,id:6049,x:32171,y:32363,varname:node_6049,prsc:2,dt:0|A-8275-OUT,B-8332-OUT;n:type:ShaderForge.SFN_NormalVector,id:8275,x:31959,y:32270,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:8332,x:31959,y:32458,varname:node_8332,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8038,x:32375,y:32412,varname:node_8038,prsc:2|A-6049-OUT,B-3104-OUT;n:type:ShaderForge.SFN_Vector1,id:3104,x:32207,y:32589,varname:node_3104,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:8258,x:32540,y:32435,varname:node_8258,prsc:2|A-8038-OUT,B-3104-OUT;n:type:ShaderForge.SFN_Append,id:1381,x:32704,y:32482,varname:node_1381,prsc:2|A-8258-OUT,B-8661-OUT;n:type:ShaderForge.SFN_Vector1,id:8661,x:32438,y:32627,varname:node_8661,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Code,id:3669,x:32466,y:32253,varname:node_3669,prsc:2,code:,output:2,fname:Function_node_3669,width:247,height:117;n:type:ShaderForge.SFN_Slider,id:5909,x:32207,y:32699,ptovrint:False,ptlb:highLight_Range1,ptin:_highLight_Range1,varname:node_5909,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.9913043,max:1;n:type:ShaderForge.SFN_Vector3,id:4745,x:32302,y:33414,varname:node_4745,prsc:2,v1:0.5,v2:0.5,v3:0;n:type:ShaderForge.SFN_Vector1,id:7600,x:32237,y:32761,varname:node_7600,prsc:2,v1:0.015;n:type:ShaderForge.SFN_LightVector,id:6221,x:31739,y:32710,varname:node_6221,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:290,x:31739,y:32836,prsc:2,pt:False;n:type:ShaderForge.SFN_Vector4Property,id:1125,x:31735,y:33216,ptovrint:False,ptlb:highLight_offset,ptin:_highLight_offset,varname:node_1125,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:-0.5,v2:0,v3:-0.5,v4:0;n:type:ShaderForge.SFN_Vector4Property,id:3992,x:31735,y:33055,ptovrint:False,ptlb:highLight_offset1,ptin:_highLight_offset1,varname:node_3992,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Add,id:6087,x:31944,y:32880,varname:node_6087,prsc:2|A-290-OUT,B-3992-XYZ;n:type:ShaderForge.SFN_Add,id:2125,x:31944,y:33065,varname:node_2125,prsc:2|A-290-OUT,B-1125-XYZ;n:type:ShaderForge.SFN_Normalize,id:8456,x:32129,y:32880,varname:node_8456,prsc:2|IN-6087-OUT;n:type:ShaderForge.SFN_Normalize,id:882,x:32129,y:33065,varname:node_882,prsc:2|IN-2125-OUT;n:type:ShaderForge.SFN_Dot,id:624,x:32316,y:32847,varname:node_624,prsc:2,dt:0|A-6221-OUT,B-8456-OUT;n:type:ShaderForge.SFN_Dot,id:6755,x:32312,y:33125,varname:node_6755,prsc:2,dt:0|A-6221-OUT,B-882-OUT;n:type:ShaderForge.SFN_Vector1,id:3236,x:32362,y:33040,varname:node_3236,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:1997,x:32349,y:32983,varname:node_1997,prsc:2,v1:1;n:type:ShaderForge.SFN_If,id:6457,x:32614,y:32870,varname:node_6457,prsc:2|A-624-OUT,B-5909-OUT,GT-1997-OUT,EQ-3236-OUT,LT-3236-OUT;n:type:ShaderForge.SFN_If,id:6859,x:32614,y:33105,varname:node_6859,prsc:2|A-6755-OUT,B-7668-OUT,GT-1997-OUT,EQ-3236-OUT,LT-3236-OUT;n:type:ShaderForge.SFN_Slider,id:7668,x:32223,y:33310,ptovrint:False,ptlb:highLight_Range2,ptin:_highLight_Range2,varname:node_7668,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.9913043,max:1;n:type:ShaderForge.SFN_Max,id:6519,x:32785,y:32953,varname:node_6519,prsc:2|A-6457-OUT,B-6859-OUT;n:type:ShaderForge.SFN_Color,id:5108,x:32666,y:32713,ptovrint:False,ptlb:highLight_Color,ptin:_highLight_Color,varname:node_5108,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:9639,x:32946,y:32626,varname:node_9639,prsc:2|A-1381-OUT,B-5108-RGB,T-6519-OUT;n:type:ShaderForge.SFN_Fresnel,id:540,x:32814,y:33121,varname:node_540,prsc:2|EXP-5397-OUT;n:type:ShaderForge.SFN_Vector1,id:5397,x:32646,y:33266,varname:node_5397,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:9447,x:33015,y:33045,varname:node_9447,prsc:2|A-540-OUT,B-8083-RGB;n:type:ShaderForge.SFN_Color,id:8083,x:32754,y:33379,ptovrint:False,ptlb:Fresnel_clo,ptin:_Fresnel_clo,varname:node_8083,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Blend,id:6336,x:33228,y:32880,varname:node_6336,prsc:2,blmd:6,clmp:True|SRC-9639-OUT,DST-9447-OUT;proporder:5909-1125-3992-7668-5108-8083;pass:END;sub:END;*/

Shader "Shader Forge/Fristshader/Lampert" {
    Properties {
        [HideInInspector]_highLight_Range1 ("highLight_Range1", Range(0, 1)) = 0.9913043
        _highLight_offset ("highLight_offset", Vector) = (-0.5,0,-0.5,0)
        _highLight_offset1 ("highLight_offset1", Vector) = (0,0,0,0)
        _highLight_Range2 ("highLight_Range2", Range(0, 1)) = 0.9913043
        _highLight_Color ("highLight_Color", Color) = (1,1,0.5,1)
        _Fresnel_clo ("Fresnel_clo", Color) = (1,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*0.015,1) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4(float3(0.5,0.5,0),0);
            }
            ENDCG
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
                UNITY_DEFINE_INSTANCED_PROP( float, _highLight_Range1)
                UNITY_DEFINE_INSTANCED_PROP( float4, _highLight_offset)
                UNITY_DEFINE_INSTANCED_PROP( float4, _highLight_offset1)
                UNITY_DEFINE_INSTANCED_PROP( float, _highLight_Range2)
                UNITY_DEFINE_INSTANCED_PROP( float4, _highLight_Color)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Fresnel_clo)
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float node_3104 = 0.5;
                float4 _highLight_Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _highLight_Color );
                float4 _highLight_offset1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _highLight_offset1 );
                float _highLight_Range1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _highLight_Range1 );
                float node_6457_if_leA = step(dot(lightDirection,normalize((i.normalDir+_highLight_offset1_var.rgb))),_highLight_Range1_var);
                float node_6457_if_leB = step(_highLight_Range1_var,dot(lightDirection,normalize((i.normalDir+_highLight_offset1_var.rgb))));
                float node_3236 = 0.0;
                float node_1997 = 1.0;
                float node_6457 = lerp((node_6457_if_leA*node_3236)+(node_6457_if_leB*node_1997),node_3236,node_6457_if_leA*node_6457_if_leB);
                float4 _highLight_offset_var = UNITY_ACCESS_INSTANCED_PROP( Props, _highLight_offset );
                float _highLight_Range2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _highLight_Range2 );
                float node_6859_if_leA = step(dot(lightDirection,normalize((i.normalDir+_highLight_offset_var.rgb))),_highLight_Range2_var);
                float node_6859_if_leB = step(_highLight_Range2_var,dot(lightDirection,normalize((i.normalDir+_highLight_offset_var.rgb))));
                float node_6859 = lerp((node_6859_if_leA*node_3236)+(node_6859_if_leB*node_1997),node_3236,node_6859_if_leA*node_6859_if_leB);
                float4 _Fresnel_clo_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Fresnel_clo );
                float3 emissive = saturate((1.0-(1.0-lerp(float3(float2(((dot(i.normalDir,lightDirection)*node_3104)+node_3104),0.7),0.0),_highLight_Color_var.rgb,max(node_6457,node_6859)))*(1.0-(pow(1.0-max(0,dot(normalDirection, viewDirection)),3.0)*_Fresnel_clo_var.rgb))));
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
                UNITY_DEFINE_INSTANCED_PROP( float, _highLight_Range1)
                UNITY_DEFINE_INSTANCED_PROP( float4, _highLight_offset)
                UNITY_DEFINE_INSTANCED_PROP( float4, _highLight_offset1)
                UNITY_DEFINE_INSTANCED_PROP( float, _highLight_Range2)
                UNITY_DEFINE_INSTANCED_PROP( float4, _highLight_Color)
                UNITY_DEFINE_INSTANCED_PROP( float4, _Fresnel_clo)
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
