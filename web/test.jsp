<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/27 0027
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="js/jquery-3.1.0.js">
    <script type="text/javascript">
        function tijiao(){
            var formData=new formData();
            formData.append("hahaha",);
            $.ajax(
                {
                    "type":"post",
                    "url":"${pageContext.request.contextPath}/testimg",
                    "data":formData,
                    "success":function(){
                        console.log("成功!");
                    },
                    "error":function(){
                        console.log("失败！");
                    }
                }
            );
        }
    </script>
</head>
<body>

<form id="f" action="" method="post">
    <input type="text" name="hahaha"><br>
    <input type="file" name="fff" multiple>
    <button onclick="tijiao()">上传</button>
</form>

</body>
</html>
