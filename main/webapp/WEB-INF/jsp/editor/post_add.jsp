<%--
  Created by IntelliJ IDEA.
  User: 170904
  Date: 2018/1/17
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/categories.js"></script>--%>
    <style type="text/css">
        *{margin:0;padding:0;list-style-type:none;}
        a,img{border:0;}
        em{font-style:normal;}
        body{font:12px/180% Arial, Helvetica, sans-serif;}
        a,a:visited{color:#5e5e5e;text-decoration:none;}
        a:hover{color:#3366cc!important;text-decoration:none;}
        .clear{display:block;overflow:hidden;clear:both;height:0;line-height:0;font-size:0;}
        .clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
        .clearfix{display:inline-table;}/* Hides from IE-mac \*/
        *html .clearfix{height:1%;}
        .clearfix{display:block;}/* End hide from IE-mac */
        *+html .clearfix{min-height:1%;}
        .demo{width:450px;margin:40px auto;position:relative;}
        /* Form input */
        .Form li{font-size:21px;font-weight:300}
        .Form input[type=text],.Form input[type=password],.Form textarea{
            display:inline-block;padding:6px 12px;font-size:18px;font-weight:300;line-height:1.4;color:#221919;background:#fff;border:1px solid #a4a2a2;

            box-sizing:border-box;
            -moz-box-sizing:border-box;
            -ms-box-sizing:border-box;
            -webkit-box-sizing:border-box;

            border-radius:6px;
            -moz-border-radius:6px;
            -webkit-border-radius:6px;

            box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);
            -moz-box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);
            -webkit-box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);

            -webkit-transition:all .08s ease-in-out;
            -moz-transition:all .08s ease-in-out;
        }
        .Form textarea{min-height:90px}
        .Form label{display:inline-block;line-height:1.4em;font-size:18px}
        .Form input[type=text]:focus,.Form input[type=password]:focus,.Form textarea:focus{
            border-color:#006499;
            box-shadow:0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
            -moz-box-shadow:0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
            -webkit-box-shadow:0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
        }
        .FancyForm li,.FancyForm li .input{position:relative}
        .FancyForm input[type=text],.FancyForm input[type=password],.FancyForm textarea{
            position:relative;z-index:3;display:block;width:100%;background:transparent;border:1px solid #a4a2a2;
            border-radius:6px;
            -moz-border-radius:6px;
            -webkit-border-radius:6px;

            box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);
            -moz-box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);
            -webkit-box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);

            -webkit-transition:all .08s ease-in-out;
            -moz-transition:all .08s ease-in-out;
        }
        .FancyForm textarea{min-height:3.95em;line-height:1.3}
        .FancyForm label{
            position:absolute;z-index:2;top:7px;left:13px;display:block;color:#BCBCBC;cursor:text;

            -moz-user-select:none;
            -webkit-user-select:none;

            -moz-transition:all .16s ease-in-out;
            -webkit-transition:all .16s ease-in-out;
        }
        .FancyForm .fff{
            position:absolute;z-index:1;top:0;right:0;left:3px;bottom:0;background-color:#fff;

            border-radius:8px;
            -moz-border-radius:8px;
            -webkit-border-radius:8px;
        }


        /* Button base */
        .Button{
            position:relative;
            display:inline-block;
            padding:.45em .825em .45em;
            text-align:center;
            line-height:1em;
            border:1px solid transparent;
            cursor:pointer;

            border-radius:.3em;
            -moz-border-radius:.3em;
            -webkit-border-radius:.3em;

            -moz-transition-property:color, -moz-box-shadow, text-shadow;
            -moz-transition-duration:.05s;
            -moz-transition-timing-function:ease-in-out;
            -webkit-transition-property:color, -webkit-box-shadow, text-shadow;
            -webkit-transition-duration:.05s;
            -webkit-transition-timing-function:ease-in-out;

            box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35);
            -moz-box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35);
            -webkit-box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35);
        }

        .Button:hover {text-decoration:none;}
        .Button strong {position:relative; z-index:2;}

        .Button{
            display:block;border:1px solid;opacity:1;

            border-radius:.3em;
            -moz-border-radius:.3em;
            -webkit-border-radius:.3em;

            box-shadow:inset 0 1px rgba(255,255,255,0.35);
            -moz-box-shadow:inset 0 1px rgba(255,255,255,0.35);
            -webkit-box-shadow:inset 0 1px rgba(255,255,255,0.35);

            -moz-transition-property:opacity;
            -moz-transition-duration:0.5s;
            -moz-transition-timing-function:ease-in-out;
            -webkit-transition-property:opacity;
            -webkit-transition-duration:0.5s;
            -webkit-transition-timing-function:ease-in-out;
        }

        .Button:hover span{
            -moz-transition-property:opacity;
            -moz-transition-duration:0.05s;
            -moz-transition-timing-function:linear;
            -webkit-transition-property:opacity;
            -webkit-transition-duration:0.05s;
            -webkit-transition-timing-function:linear;
        }
        .Button:active span{
            -moz-transition:none;
            -webkit-transition:none;
        }

        /* Red Button */
        .RedButton{color:#fcf9f9; text-shadow:0 -1px rgba(34,25,25,0.5);}
        .RedButton:hover {color:#fff; text-shadow:0 -1px rgba(34,25,25,0.3);}
        .RedButton:active {color:#f2f0f0; text-shadow:0 -1px rgba(34,25,25,0.6);}

        .RedButton{
            border-color:#015E91;
            background-color:#3693D5;

            background:-o-linear-gradient(top left, #54B1EB, #47A0E0 50%, #419FE1 50%, #3683D5);
            background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#54B1EB), to(#47A0E0), color-stop(.5,#419FE1),color-stop(.5,#3683D5));
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#54B1EB', endColorstr='#3683D5');
        }

        .RedButton:hover{
            border-color:#0366AD;
            background-color:#3EA1D6;

            background:-o-linear-gradient(top left, #5EB4EA, #61A1EE 50%, #59A5EB 50%, #3691E6);
            background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#5EB4EA), to(#61A1EE), color-stop(.5,#59A5EB),color-stop(.5,#3691E6));
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5EB4EA', endColorstr='#3691E6');
        }

        .RedButton:active{
            border-color:#013B6A;
            background-color:#3089C8;

            background:-o-linear-gradient(top left, #4B9CDD, #4189D5 50%, #3D8BD3 50%, #3093C8);
            background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#4B9CDD), to(#4189D5), color-stop(.5,#3D8BD3),color-stop(.5,#3093C8));
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4B9CDD', endColorstr='#3093C8');
        }

        .RedButton.Button18:hover{
            box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
            -moz-box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
            -webkit-box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
        }
        .RedButton.Button18:active{
            box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);
            -moz-box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);
            -webkit-box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);
        }
        /* login */
        .login .stext{padding:6px 12px;width:380px;border:1px solid #a4a2a2;}


        /* tag */
        .default-tag a,.default-tag a span,.plus-tag a,.plus-tag a em,.plus-tag-add a{background:url(${pageContext.request.contextPath}/images/tagbg.png) no-repeat;}
        .tagbtn a{color:#333333;display:block;float:left;height:22px;line-height:22px;overflow:hidden;margin:0 10px 10px 0;padding:0 10px 0 5px;white-space:nowrap;}
        /* default-tag */
        .default-tag{padding:16px 0 0 0;}
        .default-tag a{background-position:100% 0;}
        .default-tag a:hover{background-position:100% -22px;}
        .default-tag a span{padding:0 0 0 11px;background-position:0 -60px;}
        .default-tag a:hover span{background-position:0 -98px;}
        .default-tag a.selected{opacity:0.6;filter:alpha(opacity=60);}
        .default-tag a.selected:hover{background-position:100% 0;cursor:default;}
        .default-tag a.selected:hover span{background-position:0 -60px;}
        /* plus-tag */
        .plus-tag{padding:0 0 10px 0;}
        .plus-tag a{background-position:100% -22px;}
        .plus-tag a span{float:left;}
        .plus-tag a em{display:block;float:left;margin:5px 0 0 8px;width:13px;height:13px;overflow:hidden;background-position:-165px -100px;cursor:pointer;}
        .plus-tag a:hover em{background-position:-168px -64px;}
        /* plus-tag-add */
        .plus-tag-add li{height:56px;position:relative;}
        .plus-tag-add li .label{position:absolute;left:-110px;top:7px;display:block;}
        .plus-tag-add button{float:left;}
        .plus-tag-add a{float:left;margin:12px 0 0 20px;display:inline;font-size:18px;background-position:-289px -59px;padding:0 0 0 16px;}
        .plus-tag-add a.plus{background-position:-289px -96px;}
    </style>
 </head>
<body>
<jsp:include page="../head.jsp"></jsp:include>
<div class="main layui-clear" style="margin-top: 5%">
    <div class="fly-panel">
        <h2 class="page-title">发表个人帖子</h2>
        <span>分区:</span>
        <select name="select1" id="sel1">
            <option value="default" id="selection1" selected="selected">----请选择-----</option>
        </select>
        <hr/>
        <div class="demo">
            <div class="plus-tag tagbtn clearfix" id="myTags"></div>
            <div class="plus-tag-add">
                <form id="tagsf" action="" class="login">
                    <ul class="Form FancyForm">
                        <li>
                            <span class="label">我的标签：</span>
                            <input id="tags" name="" type="text" class="stext" maxlength="20" />
                            <label>输入标签</label>
                            <span class="fff"></span>
                        </li>
                        <li>
                            <button type="button" class="Button RedButton Button18" style="font-size:22px;">添加标签</button>
                            <a href="javascript:void(0);" onclick="showTags()">展开推荐标签</a>
                        </li>
                    </ul>
                </form>
            </div><!--plus-tag-add end-->

            <div id="mycard-plus" style="display:none;">
                <div class="default-tag tagbtn">
                    <div id="tagbox" class="clearfix">
                        <a value="-1" name="tagName" title="" href="javascript:void(0);"><span></span><em></em></a>
                        <a value="-1" name="tagName" title="" href="javascript:void(0);"><span></span><em></em></a>
                        <a value="-1" name="tagName" title="" href="javascript:void(0);"><span></span><em></em></a>
                        <a value="-1" name="tagName" title="" href="javascript:void(0);"><span></span><em></em></a>
                        <a value="-1" name="tagName" title="" href="javascript:void(0);"><span></span><em></em></a>
                        <a value="-1" name="tagName" title="" href="javascript:void(0);"><span></span><em></em></a>
                        <a value="-1" name="tagName" title="" href="javascript:void(0);"><span></span><em></em></a>
                        <a value="-1" name="tagName" title="" href="javascript:void(0);"><span></span><em></em></a>
                        <a value="-1" name="tagName" title="" href="javascript:void(0);"><span></span><em></em></a>
                        <a value="-1" name="tagName" title="" href="javascript:void(0);"><span></span><em></em></a>
                        <%--<a value="-1" title="java工程师" href="javascript:void(0);"><span>java工程师</span><em></em></a>
                        <a value="-1" title="php工程师" href="javascript:void(0);"><span>php工程师</span><em></em></a>
                        <a value="-1" title="dreamweaver" href="javascript:void(0);"><span>juheweb.com</span><em></em></a>
                        <a value="-1" title="photoshop" href="javascript:void(0);"><span>photoshop</span><em></em></a>
                        <a value="-1" title="公文写作" href="javascript:void(0);"><span>公文写作</span><em></em></a>
                        <a value="-1" title="70后" href="javascript:void(0);"><span>70后</span><em></em></a>
                        <a value="-1" title="80后" href="javascript:void(0);"><span>80后</span><em></em></a>
                        <a value="-1" title="加班狂" href="javascript:void(0);"><span>加班狂</span><em></em></a>--%>
                    </div>
                    <div class="clearfix" style="display:none;"><a value="-1" title="媒体" href="javascript:void(0);"><span>媒体</span><em></em></a></div>
                    <div class="clearfix" style="display:none;"><a value="-1" title="网络营销" href="javascript:void(0);"><span>网络营销</span><em></em></a></div>
                </div>
                <div align="right"><a href="javascript:void(0);" id="change-tips" style="color:#3366cc;">换一换</a></div>
            </div><!--mycard-plus end-->

        </div>
        <!-- <div class="fly-none">并无权限</div> -->
        <div class="layui-form layui-form-pane">
            <form id="mypost" action="#" method="post" onsubmit="return false">
                <div class="layui-form-item">
                    <label for="title" class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                        <input type="text" id="title" name="title" required lay-verify="required" autocomplete="off" class="layui-input" value="">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block">
                        <label for="content" class="layui-form-label" style="top: -2px;">描述</label>
                        <div class="editor">
                            <textarea id="content" name="content" style="width:100%;height:450px;visibility:hidden;"></textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" lay-filter="*" onclick="addpost()">立即发布</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/res/js/kindeditor.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content',
        resizeMode : 1,
        cssPath : './index.css',
        items : [
            'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
            'removeformat', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
            'insertunorderedlist', 'emoticons', 'image', 'link']
    });
</script>--%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/kindeditor-4.1.11/kindeditor-all.js"></script>
<script>
    /*KindEditor.ready(function(K) {
     window.editor = K.create('#content');
     });*/

    KindEditor.ready(function(K){

        window.editor = K.create("textarea[id='content']",{
            resizeType : 1,
            allowPreviewEmoticons: true,
            allowImageUpload:true,//允许上传图片
            allowFileManager:true, //允许对上传图片进行管理
            uploadJson:'${pageContext.request.contextPath}/image/fileUpload', //上传图片的java代码，只不过放在jsp中
            //fileManagerJson:'${pageContext.request.contextPath}/kindeditor-4.1.11/jsp/file_manager_json.jsp',
            afterUpload: function(){this.sync();}, //图片上传后，将上传内容同步到textarea中
            afterBlur: function(){this.sync();},   ////失去焦点时，将上传内容同步到textarea中
            items : [
                'fontname','fontsize', '|','forecolor', 'hilitecolor','bold', 'italic','underline',
                'removeformat','|', 'justifyleft','justifycenter', 'justifyright','insertorderedlist',
                'insertunorderedlist','|', 'emoticons','link','|','image','|','baidumap','|','media']
        });

    });
</script>
<script>

    layui.cache.page = '';
    layui.cache.user = {
        username: '游客'
        ,uid: -1
        ,avatar: '../res/images/avatar/00.jpg'
        ,experience: 83
        ,sex: '男'
    };
    layui.config({
        version: "2.0.0"
        ,base: '../res/mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
</script>
<script>
    function addpost() {
        var tagstr="";
        var tags = $("span[name='tagr']");
            $.each( tags, function(i, n){
                tagstr =tagstr + n.innerHTML + "-";
            });
        tagstr = tagstr.substr(0,tagstr.length-1);
        //var tags = $("tagstr").value;
        // 取得HTML内容
        var text = editor.html();
        // 同步textarea["#editor_id"]和KindEditor数据后,可以直接取得textarea的value,否则textarea的值为空或者默认值
        editor.sync();
        // 在下列方法中选择其一即可获取到KindEditor的HTML数据
        //text=$("content").value;// 原生API
        jQuery.ajax({
            type: "post",
            cache: false,
            url:'${pageContext.request.contextPath}/post/addpost',
            data:"title="+$("#title").val()+"&content="+encodeURI(text)+"&tags="+tagstr+"&pateId="+$("#sel2").val(),
            dataType: "json",
            success: function(rt){
                alert(rt);
                window.location.reload();
            },
            error: function(rt){}
        });
    }
</script>
<script type="text/javascript">
    var FancyForm=function(){
        return{
            inputs:".FancyForm input, .FancyForm textarea",
            setup:function(){
                var a=this;
                this.inputs=$(this.inputs);
                a.inputs.each(function(){
                    var c=$(this);
                    a.checkVal(c)
                });
                a.inputs.on("keyup blur",function(){
                    var c=$(this);
                    a.checkVal(c);
                });
            },checkVal:function(a){
                a.val().length>0?a.parent("li").addClass("val"):a.parent("li").removeClass("val")
            }
        }
    }();
</script>

<script type="text/javascript">
    $(document).ready(function() {
        FancyForm.setup();
    });
</script>

<script type="text/javascript">
    var searchAjax=function(){};
    var G_tocard_maxTips=30;

    $(function(){(
        function(){

            var a=$(".plus-tag");

            $("a em",a).on("click",function(){
                var c=$(this).parents("a"),b=c.attr("title"),d=c.attr("value");
                delTips(b,d)
            });

            hasTips=function(b){
                var d=$("a",a),c=false;
                d.each(function(){
                    if($(this).attr("title")==b){
                        c=true;
                        return false
                    }
                });
                return c
            };

            isMaxTips=function(){
                return
                $("a",a).length>=G_tocard_maxTips
            };

            setTips=function(c,d){
                if(hasTips(c)){
                    return false
                }if(isMaxTips()){
                    alert("最多添加"+G_tocard_maxTips+"个标签！");
                    return false
                }
                var b=d?'value="'+d+'"':"";
                a.append($("<a "+b+" title='"+c+"' href='javascript:void(0);' ><span name='tagr'>"+c+"</span><em></em></a>"));
                searchAjax(c,d,true);
                return true
            };

            delTips=function(b,c){
                if(!hasTips(b)){
                    return false
                }
                $("a",a).each(function(){
                    var d=$(this);
                    if(d.attr("title")==b){
                        d.remove();
                        return false
                    }
                });
                searchAjax(b,c,false);
                return true
            };

            getTips=function(){
                var b=[];
                $("a",a).each(function(){
                    b.push($(this).attr("title"))
                });
                return b
            };

            getTipsId=function(){
                var b=[];
                $("a",a).each(function(){
                    b.push($(this).attr("value"))
                });
                return b
            };

            getTipsIdAndTag=function(){
                var b=[];
                $("a",a).each(function(){
                    b.push($(this).attr("value")+"##"+$(this).attr("title"))
                });
                return b
            }
        }

    )()});
</script>

<script type="text/javascript">
    // 更新选中标签标签
    $(function(){
        setSelectTips();
        $('.plus-tag').append($('.plus-tag a'));
    });
    var searchAjax = function(name, id, isAdd){
        setSelectTips();
    };
    // 搜索
    (function(){
        var $b = $('.plus-tag-add button'),$i = $('.plus-tag-add input');
        $i.keyup(function(e){
            if(e.keyCode == 13){
                $b.click();
            }
        });
        $b.click(function(){
            var name = $i.val().toLowerCase();
            if(name != '') setTips(name,-1);
            $i.val('');
            $i.select();
        });
    })();
    // 推荐标签
    (function(){
        var str = ['展开推荐标签', '收起推荐标签']
        $('.plus-tag-add a').click(function(){
            var $this = $(this),
                $con = $('#mycard-plus');

            if($this.hasClass('plus')){
                $this.removeClass('plus').text(str[0]);
                $con.hide();
            }else{
                $this.addClass('plus').text(str[1]);
                $con.show();
            }
        });
        $('.default-tag a').on('click', function(){
            var $this = $(this),
                name = $this.attr('title'),
                id = $this.attr('value');
            setTips(name, id);
        });
        // 更新高亮显示
        setSelectTips = function(){
            var arrName = getTips();
            if(arrName.length){
                $('#myTags').show();
            }else{
                $('#myTags').hide();
            }
            $('.default-tag a').removeClass('selected');
            $.each(arrName, function(index,name){
                $('.default-tag a').each(function(){
                    var $this = $(this);
                    if($this.attr('title') == name){
                        $this.addClass('selected');
                        return false;
                    }
                })
            });
        }

    })();
    // 更换链接
    (function(){
        var $b = $('#change-tips'),
            $d = $('.default-tag div'),
            len = $d.length,
            t = 'nowtips';
        $b.click(function(){
            var i = $d.index($('.default-tag .nowtips'));
            i = (i+1 < len) ? (i+1) : 0;
            $d.hide().removeClass(t);
            $d.eq(i).show().addClass(t);
        });
        $d.eq(0).addClass(t);
    })();
    function  showTags() {
        $(document).ready(function(){
            jQuery.ajax({
                type: "post",
                cache: false,
                url:'${pageContext.request.contextPath}/tag/list',
                dataType: "json",
                success: function(rt){
                    var tags = $("a[name = 'tagName']");
                    var tagspan = $("a[name = 'tagName'] > span");
                    $.each( rt, function(i, n){
                        tags[i].title = n.tName;
                        tagspan[i].innerHTML=n.tName;
                        //$("#tagbox").append('<a value="-1" title="'+n.tName+'" href="javascript:void(0);"><span>'+n.tName+'</span><em></em></a>');

                    });
                },
                error: function(rt){}
            });
        })
    }
    $(document).ready(function() {
        var json;
        var jsonArr = [];
        jQuery.ajax({
            type: "post",
            cache: false,
            url: '${pageContext.request.contextPath}/category/select',
            dataType: "json",
            success: function(rt) { //alert(JSON.stringify(rt));
                json = JSON.stringify(rt);
                jsonArr = eval(json);
                //json = rt;
                // alert(json);
                //alert(jsonArr.length);
                var idPre = "selection";
                var flag = false; //默认不创建新的select
                var flag2 = false; //默认新的select下的option不存在.
                function guazai(index, id, $s ) {
                    var jsonObject = [];
                    var num = 0;
                    //debugger;
                    if (index === 1) {
                        jsonObject = jsonArr;
                        flag = true;
                        num = jsonObject.length;
                        var tempId ="", tempValue="", str="";
                        for (var i = 0; i < num; i++) {
                            tempValue = jsonObject[i].gcName;
                            tempId = idPre + index + jsonObject[i].gcId;
                            str += "<option value='" + tempValue + "' id = '" + tempId + "'>" + tempValue + "</option>";
                        }
                        $($s).append(str);
                    }
                    if (index === 2) {
                        jsonObject = jsonArr[id - 1].pategoryList;
                        //jsonObject = JSON.stringify(json[id - 1].pategoryList);
                        num = jsonObject.length;
                        var tempId ="", tempValue="", str="" ,pateId = "";
                        for (var i = 0; i < num; i++) {
                            tempValue = jsonObject[i].pType;
                            pateId = jsonObject[i].pId;
                            tempId = idPre + index + pateId;
                            str += "<option value='" + pateId + "' id = '" + tempId + "'>" + tempValue + "</option>";
                        }
                        $($s).append(str);
                    }
                }
                guazai(1, 0, '#sel1');
                $("#sel1").change(function() {
                    var str = '';
                    if (!flag) {
                        $("#sel2 > option[value!='default']").remove();
                        flag2 = true;
                    }
                    if (flag) {
                        if (!flag2) {
                            str = "游戏类型：<select name='select2' id='sel2'></select>";
                            $(this).after(str);
                            flag2 = true;
                        }
                        str = "<option value='default' id='" + idPre + 2 + "'>----请选择-----</option>";
                        $("#sel2").append(str);
                        flag = false;
                    }
                    //获得当前对象的id
                    var id = $(this).find("option:selected").attr("id");
                    var i = idPre.length + 1;
                    id = parseInt(id.substring(i, id.length));
                    guazai(2, id, '#sel2');
                });
            },
            error: function(rt){}
        });
    });
</script>
</body>
</html>
