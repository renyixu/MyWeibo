<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/29 0029
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="format-detection" content="telephone=no"/>
    <title>骑士逸天地</title>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script src="js/jquery-3.1.0.js"></script>
    <script src="js/bootstrap.min.js"></script>


    <style type="text/css">
        ul, li {
            list-style: none;
            padding: 0px;
            margin: 0px;
        }

        a {
            text-decoration: none;
            color: #333333;
        }

        a:hover {
            text-decoration: none;
        }
    </style>

    <script type="text/javascript">
        var content_len = 0; //统计微博字数
        var realContent = "";
        var flag = false;
        $(function () {

            $("#content").on('input propertychange', function (e) {
                //判断输入的字符串长度
                content_len = $("#content").val().replace("[表情]", "1").replace(/\s/g, "").length;

                $(".tips").text("已经输入" + content_len + "个字");


                if (content_len == 0) {
                    $(".tips").text("");
                    $("#send").addClass("disabled");
                    return false;
                } else if (content_len <= 5000) {
                    $("#send").removeClass("disabled");
                } else {
                    $("#send").addClass("disabled");
                    // alert("微博字数已达上限！（5000字）");
                    var goBeyond = 5000 - content_len;
                    var ccc = "已输入<strong style=\"color:red\">" + goBeyond + "</strong>个字"
                    $(".tips").html(ccc);
                }
            });


            $(".pic").click(function () {

                $(".select_Img").click();


            })

            // 	function confirm(){

            // 		var r= new FileReader();
            // f=$(".select_Img").files[0];
            // r.readAsDataURL(f);
            // r.onload=function(e) {
            // 	$(".preview").src=this.result;

            // };
            // 	}

            //点击按钮发送内容
            $("#send").click(function () {
                if (realContent != "") {
                    window.location.href = "${pageContext.request.contextPath}/addWeibo?weiboContent=" + realContent;
                } else {
                    window.location.href = "${pageContext.request.contextPath}/addWeibo?weiboContent=" + $("#content").val();
                }
                <%--$(location).attr("href","${pageContext.request.contextPath}/addWeibo?weiboContent="+realContent);--%>

                <%--$.ajax(--%>
                <%--    {--%>
                <%--        "type": "post",--%>
                <%--        "url": "${pageContext.request.contextPath}/addWeibo",--%>
                <%--        "data": {"weiboContent": realContent},--%>
                <%--        "dataType": "json",--%>
                <%--        "success": function (data) {--%>
                <%--            console.log("提交成功...");--%>
                <%--        },--%>
                <%--        "error": function (data) {--%>
                <%--            console.log("提交失败...");--%>
                <%--        }--%>
                <%--    }--%>
                <%--);--%>

            });

            //添加表情包1
            for (var i = 1; i < 60; i++) {

                $(".emoji_1").append("<img src='img/f" + i + ".png' style='width:35px;height:35px' >");
            }
            //添加表情包2
            for (var i = 1; i < 61; i++) {

                $(".emoji_2").append("<img src='img/h" + i + ".png' style='width:35px;height:35px' >");
            }


            $(".emoji").click(function () {

                $(".myEmoji").show();

                //点击空白处隐藏弹出层
                $(document).click(function (e) {

                    if (!$("#edit_form").is(e.target) && $("#edit_form").has(e.target).length === 0) {

                        $(".myEmoji").hide();
                    }
                });


            });

            //将表情添加到输入框
            $(".myEmoji img").each(function () {
                $(this).click(function () {
                    var url = $(this)[0].src;

                    realContent = $('#content').val() + "<img src='" + url + "' style='width:25px;height:25px' >";

                    var showContent = $('#content').val() + "[表情]";

                    content_len++;

                    $('#content').val(showContent);

                    $("#send").removeClass("disabled");
                })
            })

            //放大或缩小预览图片
            $(".mypic").click(function () {
                var oWidth = $(this).width(); //取得图片的实际宽度
                var oHeight = $(this).height(); //取得图片的实际高度

                if ($(this).height() != 200) {
                    $(this).height(200);
                } else {
                    $(this).height(oHeight + 200 / oWidth * oHeight);
                }

            })

        })

        function operateWbFun(oid) {
            if (flag == false) {
                $("#" + oid).css("display", "block");
                flag = true;
            } else {
                $("#" + oid).css("display", "none");
                flag = false;
            }
        }

    </script>
</head>

<body>
<nav class="navbar  navbar-fixed-top" role="navigation" style="background: #e0620d ;padding-top: 3px;height:50px;">
    <div class="container-fluid" style="background: #fff;">
        <div class="navbar-header ">
            <span class="navbar-brand " href="#">WEIBO</span>

            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#my-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="#热门话题#">
                <i class="glyphicon glyphicon-search btn_search"></i>
                <!--  <button type="submit" class="btn btn-default">提交</button> -->
            </div>

        </form>

        <div class="collapse navbar-collapse" id="my-navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;Jack.C</a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        设置 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">登录</a></li>
                        <li><a href="#">注册</a></li>

                    </ul>
                </li>
            </ul>

        </div>


    </div>
    <hr style="margin: 0;padding: 0;color:#222;width: 100%">
</nav>

<div class="container container_bg">
    <div class="row">
        <div class="col-sm-2"></div>

        <div class="col-sm-6 col-xs-12 my_edit">
            <div class="row" id="edit_form">
                <span class="pull-left" style="margin:15px;">编写新鲜事</span>
                <span class="tips pull-right" style="margin:15px;">

                </span>
                <form role="form" style="margin-top: 50px;" action="" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <textarea id="content" class="form-control"></textarea>
                        </div>
                        <div class="col-sm-12" style="margin-top: 12px;">
                            <span class="emoji">表情</span>

                            <span class="pic">图片	</span>
                            <span>
									<input type="file" name="image" class="select_Img" style="display: none" multiple>
									<img class="preview" src="">
								</span>


                            <div class="myEmoji">
                                <ul id="myTab" class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#set" data-toggle="tab">
                                            预设
                                        </a>
                                    </li>
                                    <li><a href="#hot" data-toggle="tab">热门</a></li>

                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade in active" id="set">
                                        <div class="emoji_1"></div>

                                    </div>
                                    <div class="tab-pane fade" id="hot">
                                        <div class="emoji_2"></div>
                                    </div>

                                </div>
                            </div>
                            <!-- <span> <input type="file" id="selectImg" value=""></input> </span> -->
                            <%--                            <input type="submit" class="btn btn-default pull-right disabled" value="发布">--%>
                            <button type="button" id="send" class="btn btn-default pull-right disabled">发布</button>
                        </div>
                    </div>
                </form>
            </div>

            <!--动态-->
            <c:forEach items="${requestScope.weiboList}" var="wb" varStatus="vs">
                <div class="row item_msg">
                    <div class="col-sm-12 col-xs-12 message">
                        <img src="img/tx.jpg" class="col-sm-2 col-xs-2" style="border-radius: 50%">
                        <div class="col-sm-10 col-xs-10">
                            <span style="font-weight: bold;">Jack.C</span>
                            <a href="javascript:void(0)" onclick="operateWbFun('operateWB_${vs.index}')"><img
                                    src="img/green_pixel_38.png"
                                    style="float:right;"></a>
                            <div id="operateWB_${vs.index}"
                                 style="display:none;width:65px;background-color: #ffffff;float: right;border:1px solid blue;">
                                <ul style="text-align:center;">
                                    <c:if test="${wb.is_top==0}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/topWeibo?top_wid=${wb.wid}">置顶微博</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${wb.is_top==1}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/cancelTopWeibo?ctop_wid=${wb.wid}">取消置顶</a>
                                        </li>
                                    </c:if>
                                    <li><a href="${pageContext.request.contextPath}/deleteWeibo?delete_wid=${wb.wid}">删除微博</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/editWeibo?isEdit=0&edit_wid=${wb.wid}&edit_wcontent=${wb.wcontent}">编辑微博</a>
                                    </li>
                                </ul>
                            </div>
                            <br>
                            <small class="date" style="color:#999">${wb.wdateStr}&nbsp;&nbsp;
                                <!--已编辑-->
                                <c:if test="${wb.is_edit==1}">
                                    已编辑
                                </c:if>
                            </small>
                            <div class="msg_content">
                                <!--置顶-->
                                <c:if test="${wb.is_top==1}">
                                    <span style="background-color: red;color:#fff;padding-left: 6px;padding-right:6px;">置顶</span>
                                </c:if>
                                    ${wb.wcontent}
                                <c:if test="${!empty wb.imgs}">
                                    <c:forEach items="${wb.imgs}" var="wimg">
                                        <img class="mypic" src="${wimg.wimgpath}">
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>


        <div class="col-sm-3 col-xs-12 part_right">
            <div class="row text-center inform">
                <img src="img/icon.png">
                <h4 style="font-weight: bold;">Jack.C</h4>
                <div class="col-sm-12 my_inform">
                    <div class="col-sm-4 col-xs-4">
                        <div>111</div>
                        <div class="sort">关注</div>

                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <div>111</div>
                        <div class="sort">粉丝</div>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <div>111</div>
                        <div class="sort">博客</div>
                    </div>
                </div>
            </div>
            <div class="row part_hot">
                <div class="col-sm-12">
                    <span class="pull-left" style="padding: 10px;font-size:16px;font-weight: bold;">热门话题</span>
                    <span class="pull-right" style="padding: 10px;">换话题</span>
                </div>
                <hr style="margin: 0;padding: 0;width: 100%">

                <div class="col-sm-12 item_hot">
                    <span class="pull-left">#英雄联盟s7#</span>
                    <span class="pull-right item_num">34.6亿</span>
                </div>

                <div class="col-sm-12 item_hot">
                    <span class="pull-left">#今天霜降#</span>
                    <span class="pull-right item_num">2.6亿</span>
                </div>

                <div class="col-sm-12 item_hot">
                    <span class="pull-left">#亚洲新歌榜#</span>
                    <span class="pull-right item_num">10.4亿</span>
                </div>

                <div class="col-sm-12 item_hot">
                    <span class="pull-left">#扑通扑通少女心#</span>
                    <span class="pull-right item_num">1.5亿</span>
                </div>

                <div class="col-sm-12 item_hot">
                    <span class="pull-left">#突然开心#</span>
                    <span class="pull-right item_num">1.1亿</span>
                </div>
                <hr style="margin: 0;padding: 0;width: 100%">

                <div class="col-sm-12 text-center" style="padding: 10px"><a href="#">查看更多</a></div>

            </div>

        </div>
    </div>
</div>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
</div>
</body>
</html>
