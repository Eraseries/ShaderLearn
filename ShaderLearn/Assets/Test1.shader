Shader "MyShader/Test1"
{
    //属性
    //注意这里定的属性不能直接拿来使用
    //在CGPROGRAM里边要重新定义下 float _Color; ，取得是ProPerties里的默认值

    //_Int("Int",Int) = 3
    //_Int  Shader里面使用的属性名。"Int"面板窗口个的属性名，Int类型
    ProPerties{
        _Int("Int",Int) = 3
        _Float("Float",Float) = 4.5
        _Range("Range",Range(8,200)) = 10
        _Vector("Vector",Vector) = (1,2,3,4)
        _Color("Color",Color) = (0.5,0.5,0.5,0.5)
        _MainTex("Main Tex",2D) = "white"{}
        _3D("Texture",3D) = "white"{}
        _Diffuse("Diffuse Color",Color) = (1,1,1,1)
        _Specular("Specular Color",Color) = (1,1,1,1)
    }

    SubShader{
        Tags{"LightMode" = "ForwardBase"}
        Pass{
            CGPROGRAM
            float _Int;             //float 也可以用half   fixed代替
            fixed4 _Color;          //float 32位存储   half16位存储     fixed11位存储
            fixed4 _Vector;
            float _Float;
            float _Range;
            fixed4 _Diffuse; 
            fixed4 _Specular;
            sampler2D _MainTex;
            float4 _MainTex_ST;
            //从应用程序传递到定点函数的语义有哪些a2v
            //POSITION 顶点坐标(模型空间下的)
            //NORMAL 法线(模型空间下的)
            //TANGENT 切线(模型空间)
            //TEXCOORD 0~n 纹理坐标  二维的坐标系  0-1
            //COLOR 顶点颜色
            struct a2v{
                fixed4 vertex:POSITION; //告诉unity把模型空间下的顶点坐标填充给vertex
                fixed3 normal:NORMAL;//告诉unity 把模型空间下的法线方向填充给normal 
                fixed4 texcoord:TEXCOORD0;//告诉unity把第一套纹理坐标填充给texcoord
            };



            //从顶点函数传递给片元函数的时候可以使用的语义
            //SV_POSITION  裁剪空间的顶点坐标（一般是系统直接使用）
            //COLOR0 可以传递一组值  4个
            //COLOR1 可以传递一组值  4个
            //TEXCOORD 0~7   传递纹理坐标
            struct v2f{
                float4 position:SV_POSITION;
                float3 worldNormal:TEXCOORD0;
                float3 worldVertex:TEXCOORD1;
                float2 uv:TEXCOORD2;
            };



            //片元函数传递给系统
            //SV_Target 颜色值，显示到屏幕上的颜色


            //总结，顶点函数用来坐标转换，片元函数用来输出屏幕颜色



            //顶点函数声明
            //基本作用是 完成顶点坐标从模型空间到裁剪空间的转换（从游戏环境到视野相机屏幕上）
             #pragma vertex vert


            //片元函数声明
            //基本作用是 返回模型对应的屏幕上的每一个像素的颜色值
            #pragma fragment frag


            #include "Lighting.cginc" //取得第一个直射光的颜色_LightColor0  第一个直射光的位置_WorldSpaceLightPos0

            v2f vert(a2v v){
                v2f f;
                f.position = UnityObjectToClipPos(v.vertex); //将顶点坐标从模型空间转换到裁剪空间
                f.worldVertex = mul((float3x3) unity_ObjectToWorld,v.vertex);//mul(v.vertex,(float3x3) unity_WorldToObject);
                f.worldNormal = UnityObjectToWorldNormal(v.normal);
                f.uv = v.texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
                return f;
            }



            fixed4 frag(v2f f):SV_Target{


                //环境光
                fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.rgb;

                //法线
                fixed3 normalDir = normalize(f.worldNormal);

                //直射光
                //fixed3 lightDir = normalize(_WorldSpaceLightPos0.xyz); //对于每个顶点来说，光的位置就是光的方向，因为光是平行光
                fixed3 lightDir = normalize(UnityWorldSpaceLightDir(f.worldVertex).xyz);


                //uv某点坐标的颜色
                //tex2D(_MainTex,f.uv.xy)
                fixed3 texColor = tex2D(_MainTex,f.uv.xy) * _Color.rgb;

                //高光反射
                //Specular = 直射光的颜色 * pow（max(cos(反射光方向和屏幕方向的夹角）,0)，高光参数）     pow x的y次方. 高光参数越大，高光范围越小
                //fixed3 reflectDir = normalize(reflect(-lightDir,normalDir));
                //fixed3 viewDir = normalize(_WorldSpaceCameraPos.xyz - f.worldVertex.xyz);
                fixed3 viewDir = normalize(UnityWorldSpaceViewDir(f.worldVertex).xyz);

                fixed3 halfDir = normalize(lightDir + viewDir);

                fixed3 specularDir = _LightColor0.rgb * _Specular.rgb * pow(max(dot(normalDir,halfDir),0),_Range);

                //漫反射
                fixed3 diffuse = _LightColor0.rgb * (dot(normalDir,lightDir) * 0.5 + 0.5) * texColor.rgb;//max(dot(normalDir,lightDir),0) * _Diffuse.rgb;//取得漫反射颜色
                fixed3 tempColor = diffuse + ambient + specularDir;
                
                return fixed4(tempColor,1);
            }


            ENDCG
        }
    }

    Fallback "Specular"
}






//光照模型 
//光照模型就是一个公式，使用这个公式来计算在某个点的光照效果

//标准光照模型
//在标准光照模型里面，把进入摄像机的光分为下面四个部分



//1自发光



//2高光反射     Specular = 直射光的颜色 * pow（max(cos(反射光方向和屏幕方向的夹角）,0)，高光参数）     pow x的y次方. 高光参数越大，高光范围越小
//Phong光照模型     
//Specular = 直射光的颜色 * pow（max(cos(反射光方向和屏幕方向的夹角）,0)，高光参数）

//Blinn-Phong光照模型
//Specular = 直射光的颜色 * pow（max(cos(法线方向 和 X的夹角）,0)，高光参数）    X为直射光的方向和屏幕方向的夹角 / 2






//3漫反射       Diffuse = 直射光的颜色 * max(0,cos(直射光方向和法线方向的夹角)) 
//兰伯特光照模型
//Diffuse = 直射光颜色 * max(0,cos(光和法线的夹角))

//半兰伯特光照模型
//Diffuse = 直射光颜色 * （cos(光和法线的夹角)  * 0.5  + 0.5）








//4环境光       通过系统变量直接取到环境光UNITY_LIGHTMODEL_AMBIENT.rgb



//Tags{"LightMode" = "ForwardBase"}
//只有定义正确的LightMode才能得到一些Unity的内置光照bianliang
//#include "Lighting.cginc"
//包含unity的内置的文件，才可以使用unity内置的一些变量

//normalize()用来把一个向量单位化（原来的方向保持不变，长度变为1）
//max()用来取得函数中最大的一个
//dot 用来取得两个向量的点积
//_WorldSpaceLightPos0 取得平行光的位置
//_LightColor0 取得平行光的颜色
//Unity_MATRIX_MVP 这个矩阵用来把一个坐标从模型空间转换到裁剪空间
//World2Object 这个矩阵用来把一个方向从世界空间转换到模型空间
//UNITY_LIGHTMODEL_AMBIENT.rgb用来获取环境光

//两个颜色融合 相乘  
//两个颜色叠加 相加

//UnityCG.cginc中一些常用的函数

//摄像机方向（视角方向）
//float3 WorldSpaceViewDir(float4 v)        根据模型空间中的顶点坐标得到（世界空间）从这个点到摄像机的观察方向
//float3 UnityWorldSpaceViewDir(float4 v)   世界空间中的顶点坐标====》世界空间从这个点到摄像机的观察方向
//float3 ObjSpaceViewDir(float4 v)          模型空间中的顶点坐标====》模型空间从这个点到摄像机的观察方向

//光源方向
//float3 WorldSpaceLightDir(float4 v)       模型空间中的顶点坐标====》世界空间中从这个点到光源的方向
//float3 UnityWorldSpaceLightDir(float4 v)  世界空间中的顶点坐标====》世界空间中从这个点到光源的方向
//float3 ObjSpaceLightDir(float4 v)         模型空间中的顶点坐标====》世界空间中从这个点到光源的方向

//方向转换
//float3 UnityObjectToWorldNormal(float3 normal)        把法线方向  模型空间====》世界空间
//float3 UnityObejctToWorldDir(float3 dir)              把方向      模型空间====》世界空间
//float3 UnityWorldToObjectDir(float3 dir)              把方向      世界空间====》模拟空间 




//漫反射 = 直射光颜色 * 法线 和 点到直射光的线的点积
//



//pixel = (normal + 1) / 2    法线的范围  （-1,1）
//normal = pixel * 2 - 1