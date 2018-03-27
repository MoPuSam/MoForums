<%--
  Created by IntelliJ IDEA.
  User: 170904
  Date: 2018/1/17
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
    <script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>

    <style type="text/css" rel="stylesheet">
        form {
            margin: 0;
        }

        .editor {
            margin-top: 5px;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<jsp:include page="../head.jsp"></jsp:include>
<div class="main layui-clear" style="margin-top: 5%">
    <div class="wrap">
        <div class="content detail">
            <div class="fly-panel detail-box">
                <h1>${post.pTitle}</h1>
                <div class="fly-tip fly-detail-hint" data-id="">
                    <span class="fly-tip-stick">楼主</span>
                    <c:if test="${nickname eq 'admin'}">
                    <span class="fly-tip-stick">置顶帖</span><span class="jie-admin"> <a
                        href="">点击置顶</a> </span> <span
                        class="layui-btn layui-btn-mini jie-admin"> <a href="">取消置顶</a>
						</span> <span class="jie-admin" type="del" style="margin-left: 20px;">
							<a>删除该帖</a> </span>
                    </c:if>
                    <div class="fly-list-hint">
                        <i class="iconfont" title="回答">&#xe60c;</i> ${rlist.size()}
                    </div>
                </div>
                <div class="detail-about">
                    <a class="jie-user" href=""> <img
                            src="${post.user.photo}" alt="头像"> <cite> ${post.user.uNickname}
                        <em>${post.updateTime}</em> </cite> </a>
                    <%--<div class="detail-hits" data-id="{{rows.id}}">
							 <span class="layui-btn layui-btn-mini jie-admin"><a
                                     href="#">已完帖，无法编辑</a> </span> <span
                            class="layui-btn layui-btn-mini jie-admin" type="collect"
                            data-type="add"> <a id="collectPost">收藏</a> </span> <span
                            class="layui-btn layui-btn-mini jie-admin  layui-btn-danger"
                            type="collect" data-type="add"> <a>取消收藏</a> </span>

                    </div>--%>
                </div>
                <div class="detail-body photos" style="margin-bottom: 20px;">
                    <p>${content}</p>
                </div>
            </div>
            <div class="fly-panel detail-box" style="padding-top: 0;">
                <a name="comment"></a>
                <ul class="jieda photos" id="jieda">
                    <c:forEach items="${rlist}" var="reply">
                        <li data-id="13"><a name="item-121212121212"></a>
                            <div class="detail-about detail-about-reply">
                                <a class="jie-user" href=""> <img
                                        src="${reply.replyer.photo}" alt=""> <cite> <i>${reply.replyer.uNickname}</i>
                                    <em style="color:#FF9E3F">称号</em> </cite> </a>
                                <div class="detail-hits">
                                    <span>刚刚</span>
                                </div>
                            </div>
                            <div class="detail-body jieda-body">
                                <p>${reply.rContent}</p>
                            </div>
                            <div class="jieda-reply">
								<span class="jieda-zan" type="zan"><i
                                        class="iconfont icon-zan"></i><em>0</em>
								</span>
                                <c:if test="${nickname eq 'admin'}">
                                <div class="jieda-admin">
                                    <span type="del"><a href="#" class="layui-btn layui-btn-danger layui-btn-small">删除</a></span>
                                </div>
                                </c:if>
                            </div></li>
                    </c:forEach>
                    <%--<c:if test="${rlist eq null}">
                    <li class="fly-none">没有任何回答</li>
                    </c:if>--%>
                </ul>
                <span id="toName">@${post.user.uNickname}(楼主)</span>
                <div class="layui-form layui-form-pane">
                    <form action="#" onsubmit="return false">
                        <div class="layui-form-item layui-form-text">
                            <div class="layui-input-block">
										<textarea id="content" name="content" required
                                                  lay-verify="required" placeholder="我要回答"
                                                  class="layui-textarea fly-editor" style="height: 250px;"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" onclick="reply()" lay-filter="*" lay-submit>提交回复</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="edge">
        <dl class="fly-panel fly-list-one" id="hotlist">
            <dt class="fly-panel-title">最近热帖</dt>
        </dl>

        <dl class="fly-panel fly-list-one" id="rankList">
            <dt class="fly-panel-title">游戏讨论排行</dt>

        </dl>
    </div>
</div>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/kindeditor-4.1.11/kindeditor-all.js"></script>
<script type="text/javascript">
    KindEditor.ready(function(K){

        window.editor = K.create("textarea[id='content']",{
            resizeType : 1,
            allowPreviewEmoticons: false,
            allowImageUpload:true,//允许上传图片
            allowFileManager:true, //允许对上传图片进行管理
            uploadJson:'${pageContext.request.contextPath}/image/fileUpload', //上传图片的java代码，只不过放在jsp中
            //fileManagerJson:'${pageContext.request.contextPath}/kindeditor-4.1.11/jsp/file_manager_json.jsp',
            afterUpload: function(){this.sync();}, //图片上传后，将上传内容同步到textarea中
            afterBlur: function(){this.sync();},   ////失去焦点时，将上传内容同步到textarea中
            items : [
                'fontname','fontsize', '|','forecolor', 'hilitecolor','bold', 'italic','underline',
                'removeformat','|', 'justifyleft','justifycenter', 'justifyright','insertorderedlist',
                'insertunorderedlist','|', 'emoticons','link','|','image','|','baidumap']
        });

    });

    function reply() {
        //var tags = $("tagstr").value;
        // 取得HTML内容
        var text = editor.html();
        var uid = "${uid}";
        var pid = "${post.pId}";
        // 同步textarea["#editor_id"]和KindEditor数据后,可以直接取得textarea的value,否则textarea的值为空或者默认值
        editor.sync();
        // 在下列方法中选择其一即可获取到KindEditor的HTML数据
        //text=$("#content").value;// 原生API
        //alert(text);
        jQuery.ajax({
            type: "post",
            cache: false,
            url:'${pageContext.request.contextPath}/post/reply',
            data:"uid="+uid+"&content="+encodeURI(text)+"&pid="+pid,
            dataType: "json",
            success: function(rt){
                alert(rt);
                window.location.reload();
            },
            error: function(rt){}
        });
    }
    $(document).ready(function(){
        jQuery.ajax({
            type: "post",
            cache: false,
            url:'${pageContext.request.contextPath}/message/rank',
            dataType: "json",
            success: function(rt){
                $.each( rt, function(i, n){
                    var rank = i+1;
                    $("#rankList").append('<dd><span style="width:20px;text-align:center;font-size: 10px;color: #FFFFFF;border-radius: 50%;background-color: #c9302c">'+rank+'</span>&nbsp;<a href="'+n.pId+'" target="_blank">'+n.pType+'</a> <span><i name="talkNum">&#xe60c;</i> '+n.num+'</span></dd>');
                });
                $("i[name='talkNum']").addClass("iconfont");
            },
            error: function(rt){}
        });
        jQuery.ajax({
            type: "post",
            cache: false,
            url:'${pageContext.request.contextPath}/message/hot',
            dataType: "json",
            success: function(rt){
                $.each( rt, function(i, n){
                    $("#hotlist").append('<dd><a href="${pageContext.request.contextPath}/post/view?pid='+n.pId+'">'+n.pTitle+'</a> <span><i name="talkNum">&#xe60b;</i> '+n.hits+'</span></dd>');
                });
                $("i[name='talkNum']").addClass("iconfont");
            },
            error: function(rt){}
        });
    })
</script>
</body>
</html>
