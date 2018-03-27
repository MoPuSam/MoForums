<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 170904
  Date: 2018/2/24
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--<link rel="shortcut icon" href="http://www.yingmoo.com/img/favicon.ico" type="image/x-icon" />--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shopsManager.css" />
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>--%>
   <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js" ></script>--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/navTop.js"></script>--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.circliful.min.js"></script>--%>

</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<!-- 内容  开始-->
<div class="wrap">
    <div id="center" class="vip_cont c100 clearfix" style="margin-top: 5%;">
        <!--左边列表导航  开始-->
        <div class="fl vip_left vip_magLeft">
            <dl>
                <dt>我的账号</dt>
                <dd>
                    <p><a onclick="showMessage()">基本资料</a></p>
                    <p><a onclick="updatePassword()">修改密码</a></p>
                </dd>
            </dl>
        </div>
        <!--左边列表导航  结束-->

        <!--右边列表内容  开始-->
        <div class="fr vip_right vip_magRight">
            <!--用户信息  开始 -->
            <div class="cus01">
                <div class="cusImg">
                    <a><img id="head" class="headimg" src="${user.photo}" title="更换头像" alt="未上传头像"/></a>
                </div>
                <div class="cusName">
                    <p title="用户名称">${user.uNickname}</p>
                    <%--<span title="分众传媒有限公司">公司名称：分众传媒有限公司</span>--%>
                    <span class="bdTell">账号绑定<i></i><em>${user.uPhone}</em></span>
                </div>
            </div>
            <ul class="cus02">
                <li>
                    <p><span>个人帖子</span><a href="${pageContext.request.contextPath}/post/add" target="_blank">去上传</a></p>
                    <span class="numbers"id="postNum"></span>
                </li>
                <%--<li>
                    <p><span>媒体资源</span><a href="#" target="_blank">去上传</a></p>
                    <span class="numbers"><font>6</font>套</span>
                </li>--%>
                <li>
                    <p><span>个人头像</span><a onclick="uploadHead()">去上传</a></p>
                   <%-- <script>
                        $(function(){
                            $('#myStat').circliful();
                        });
                    </script>--%>
                    <span class="numbers mystat">
								<%--<div id="myStat" data-dimension="60" data-text="85%" data-info="New Clients" data-width="10" data-fontsize="12" data-percent="85" data-fgcolor="#ff6561" data-bgcolor="#eee" data-fill="#FFF" class="circliful" style="width: 60px;"></div>--%>
                        <input type=file name="myhead" id="myhead">
							</span>
                </li>
            </ul>
            <!-- 用户信息  结束 -->
            <%--<div class="cus03">
                <div class="mess">
                    <a href="#" target="_blank"><i></i>成为VIP会员或者加入鹰监测服务，可以优先排序，增加公司曝光等。>>点击了解详情</a>
                </div>
            </div>--%>
        </div>
        <!--右边列表内容  结束-->
    </div>
    <div id="message" class="vip_cont c100 clearfix" style="margin-top: 5%;">
        <!--左边列表导航  开始-->
        <div class="fl vip_left vip_magLeft">
            <dl>
                <dt onclick="showCenter()">我的账号</dt>
                <dd>
                    <p style="background-color: rgba(200,150,200,.5)"><a onclick="showMessage()"><b>基本资料</b></a></p>
                    <p><a onclick="updatePassword()">修改密码</a></p>
                </dd>
            </dl>
        </div>
        <!--左边列表导航  结束-->

        <!--右边列表内容  开始-->
        <div class="fr vip_right vip_magRight">
            <!--用户信息  开始 -->
            <div class="cus01">
                昵称：${user.uNickname}<br/>
                电话：${user.uPhone}<br/>
                邮箱：${user.uEmail}<br/>
                性别：<c:if test="${user.uSex eq 1}">
                        男
                      </c:if>
                        <c:if test="${user.uSex eq 2}">
                            女
                        </c:if>
            </div>

        </div>
        <!--右边列表内容  结束-->

    </div>
    <div id="passwordUpdate"  class="vip_cont c100 clearfix" style="margin-top: 5%;">
        <!--左边列表导航  开始-->
        <div class="fl vip_left vip_magLeft">
            <dl>
                <dt onclick="showCenter()">我的账号</dt>
                <dd>
                    <p><a onclick="showMessage()">基本资料</a></p>
                    <p style="background-color: rgba(200,150,200,.5)"><a onclick="updatePassword()"><b>修改密码</b></a></p>
                </dd>
            </dl>
        </div>
        <!--左边列表导航  结束-->

        <!--右边列表内容  开始-->
        <div class="fr vip_right vip_magRight">
            <!--用户信息  开始 -->
            <div class="cus01">
                <form action="#" method="post" onsubmit="return false">
                    密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="oldpassword" type="password" id="password1"/><br/>
                    新密码：<input name="newpassword1" type="password" id="password2"/>
                    重新输入新密码：<input name="newpassword2" type="password" id="password3"/><br/>
                    <input class="button" type="button" onclick="modifyPassword()" value="提交">
                </form>
            </div>

        </div>
        <!--右边列表内容  结束-->

    </div>
</div>
<script type="text/javascript">
    function showMessage() {
        $("#center").hide();
        $("#passwordUpdate").hide();
        $("#message").show();
    }
    function updatePassword() {
        $("#center").hide();
        $("#message").hide();
        $("#passwordUpdate").show();
    }
    function showCenter() {
        $("#message").hide();
        $("#passwordUpdate").hide();
        $("#center").show();
    }
    $(document).ready(function(){
        $("#message").hide();
        $("#passwordUpdate").hide();
        jQuery.ajax({
            type: "post",
            cache: false,
            url:'${pageContext.request.contextPath}/user/postNum',
            data:"uid="+${uid},
            dataType: "json",
            success: function(rt){
                $("#postNum").append('<font>'+rt+'</font>个');
            },
            error: function(rt){}
        });
    })
    function modifyPassword() {
        $.ajax({
            url : '${pageContext.request.contextPath}/user/updatePassword',
            type : 'POST',
            data : "oldpassword="+$("#password1").val()+"&newpassword1="+$("#password2").val()+"&newpassword2="+$("#password3").val(),
            success : function(responseStr) {
                alert(responseStr);
            },
            error : function(responseStr) {
                alert(responseStr);
            }
        });
    }
    function uploadHead() {
       var uid = "${uid}";
       var formData = new FormData();
       var name = $("input").val();
       formData.append("file",$("#myhead")[0].files[0]);
       formData.append("uid",uid);
       $.ajax({
           url : '${pageContext.request.contextPath}/image/uploadHead',
           type : 'POST',
           data : formData,
// 告诉jQuery不要去处理发送的数据
           processData : false,
// 告诉jQuery不要去设置Content-Type请求头
           contentType : false,
           beforeSend:function(){
               console.log("正在进行，请稍候");
           },
           success : function(responseStr) {
               var jsondata = $.parseJSON(responseStr);
               console.info("图片地址:"+jsondata.url);
               $("#head").attr("src",jsondata.url);
               if(jsondata.error=='1'){
                   alert(jsondata.message);
               }
           },
           error : function(responseStr) {
           }
       });

   }
    /*function showImage() {
        var docObj = document.getElementById("doc");
        var imgObjPreview = document.getElementById("preview");
        if (docObj.files && docObj.files[0]) {
            //火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '300px';
            imgObjPreview.style.height = '120px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        } else {
            //IE下，使用滤镜
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag");
            //必须设置初始大小
            localImagId.style.width = "250px";
            localImagId.style.height = "200px";
            //图片异常的捕捉，防止用户修改后缀来伪造图片
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters
                    .item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }*/
</script>
</body>
</html>
