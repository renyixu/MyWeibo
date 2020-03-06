<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/27 0027
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>编辑微博</title>
    <script src="js/jquery-3.1.0.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="js/bootstrap.min.js"></script>
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
                    window.location.href = "${pageContext.request.contextPath}/editWeibo?isEdit=1&editWeiboId=${requestScope.edit_wid}&editWeiboContent=" + realContent;
                } else {
                    window.location.href = "${pageContext.request.contextPath}/editWeibo?isEdit=1&editWeiboId=${requestScope.edit_wid}&editWeiboContent=" + $("#content").val();
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

    </script>
</head>
<body>
<div class="row">
    <div class="col-sm-2"></div>
    <div class="col-sm-6 col-xs-12 my_edit">
        <div class="row" id="edit_form">
            <span class="pull-left" style="margin:15px;">编辑微博</span>
            <span class="tips pull-right" style="margin:15px;">
                </span>
            <form role="form" style="margin-top: 50px;" action="" method="post">
                <div class="form-group">
                    <div class="col-sm-12">
                        <textarea id="content" class="form-control">${requestScope.edit_wcontent}</textarea>
                    </div>
                    <div class="col-sm-12" style="margin-top: 12px;">
                        <span class="emoji">表情</span>

                        <span class="pic">图片	</span>
                        <span>
									<input type="file" name="image" class="select_Img" style="display: none"
                                           multiple="">
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
                                    <div class="emoji_1"><img src="img/f1.png" style="width:35px;height:35px"><img
                                            src="img/f2.png" style="width:35px;height:35px"><img src="img/f3.png"
                                                                                                 style="width:35px;height:35px"><img
                                            src="img/f4.png" style="width:35px;height:35px"><img src="img/f5.png"
                                                                                                 style="width:35px;height:35px"><img
                                            src="img/f6.png" style="width:35px;height:35px"><img src="img/f7.png"
                                                                                                 style="width:35px;height:35px"><img
                                            src="img/f8.png" style="width:35px;height:35px"><img src="img/f9.png"
                                                                                                 style="width:35px;height:35px"><img
                                            src="img/f10.png" style="width:35px;height:35px"><img src="img/f11.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f12.png" style="width:35px;height:35px"><img src="img/f13.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f14.png" style="width:35px;height:35px"><img src="img/f15.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f16.png" style="width:35px;height:35px"><img src="img/f17.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f18.png" style="width:35px;height:35px"><img src="img/f19.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f20.png" style="width:35px;height:35px"><img src="img/f21.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f22.png" style="width:35px;height:35px"><img src="img/f23.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f24.png" style="width:35px;height:35px"><img src="img/f25.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f26.png" style="width:35px;height:35px"><img src="img/f27.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f28.png" style="width:35px;height:35px"><img src="img/f29.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f30.png" style="width:35px;height:35px"><img src="img/f31.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f32.png" style="width:35px;height:35px"><img src="img/f33.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f34.png" style="width:35px;height:35px"><img src="img/f35.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f36.png" style="width:35px;height:35px"><img src="img/f37.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f38.png" style="width:35px;height:35px"><img src="img/f39.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f40.png" style="width:35px;height:35px"><img src="img/f41.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f42.png" style="width:35px;height:35px"><img src="img/f43.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f44.png" style="width:35px;height:35px"><img src="img/f45.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f46.png" style="width:35px;height:35px"><img src="img/f47.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f48.png" style="width:35px;height:35px"><img src="img/f49.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f50.png" style="width:35px;height:35px"><img src="img/f51.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f52.png" style="width:35px;height:35px"><img src="img/f53.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f54.png" style="width:35px;height:35px"><img src="img/f55.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f56.png" style="width:35px;height:35px"><img src="img/f57.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/f58.png" style="width:35px;height:35px"><img src="img/f59.png"
                                                                                                  style="width:35px;height:35px">
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="hot">
                                    <div class="emoji_2"><img src="img/h1.png" style="width:35px;height:35px"><img
                                            src="img/h2.png" style="width:35px;height:35px"><img src="img/h3.png"
                                                                                                 style="width:35px;height:35px"><img
                                            src="img/h4.png" style="width:35px;height:35px"><img src="img/h5.png"
                                                                                                 style="width:35px;height:35px"><img
                                            src="img/h6.png" style="width:35px;height:35px"><img src="img/h7.png"
                                                                                                 style="width:35px;height:35px"><img
                                            src="img/h8.png" style="width:35px;height:35px"><img src="img/h9.png"
                                                                                                 style="width:35px;height:35px"><img
                                            src="img/h10.png" style="width:35px;height:35px"><img src="img/h11.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h12.png" style="width:35px;height:35px"><img src="img/h13.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h14.png" style="width:35px;height:35px"><img src="img/h15.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h16.png" style="width:35px;height:35px"><img src="img/h17.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h18.png" style="width:35px;height:35px"><img src="img/h19.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h20.png" style="width:35px;height:35px"><img src="img/h21.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h22.png" style="width:35px;height:35px"><img src="img/h23.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h24.png" style="width:35px;height:35px"><img src="img/h25.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h26.png" style="width:35px;height:35px"><img src="img/h27.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h28.png" style="width:35px;height:35px"><img src="img/h29.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h30.png" style="width:35px;height:35px"><img src="img/h31.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h32.png" style="width:35px;height:35px"><img src="img/h33.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h34.png" style="width:35px;height:35px"><img src="img/h35.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h36.png" style="width:35px;height:35px"><img src="img/h37.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h38.png" style="width:35px;height:35px"><img src="img/h39.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h40.png" style="width:35px;height:35px"><img src="img/h41.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h42.png" style="width:35px;height:35px"><img src="img/h43.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h44.png" style="width:35px;height:35px"><img src="img/h45.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h46.png" style="width:35px;height:35px"><img src="img/h47.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h48.png" style="width:35px;height:35px"><img src="img/h49.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h50.png" style="width:35px;height:35px"><img src="img/h51.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h52.png" style="width:35px;height:35px"><img src="img/h53.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h54.png" style="width:35px;height:35px"><img src="img/h55.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h56.png" style="width:35px;height:35px"><img src="img/h57.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h58.png" style="width:35px;height:35px"><img src="img/h59.png"
                                                                                                  style="width:35px;height:35px"><img
                                            src="img/h60.png" style="width:35px;height:35px"></div>
                                </div>

                            </div>
                        </div>
                        <!-- <span> <input type="file" id="selectImg" value=""></input> </span> -->

                        <button type="button" id="send" class="btn btn-default pull-right disabled">发布</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
