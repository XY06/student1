<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <%--<link rel="stylesheet" type="text/css" href="css/index.css">--%>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
</head>
<body>
    <div style="margin-top: 300px;">
        <img src="css/img1/2.jpg" alt="" style="margin-left: 1100px;width: 138px;height: 136px;">
        <form action="">
            <div style="margin-left: 1100px;margin-top: 50px;">
                用户名：<input type="text" name="user" value=""><br>
                密码：<input type="password" name="password" value="" style="margin-top: 20px;"><br>
                <%--日期：<input type="text" name="sdata"><br>--%>
                <input style="margin-top: 30px;" type="button" value="登录" onclick="denglu()">
                <input style="margin-left: 80px;" type="button" value="返回" onclick="goblack()">
            </div>
        </form>
    </div>

<script type="text/javascript">
    function denglu() {
        /*location.href="add";*/
        $.post(
            "denglu1",
            $("form").serialize(),
            function (obj) {
                if (obj){
                    alert("登录成功");
                    location.href="list";
                }else {
                    alert("登录失败");
                }
            }
        )
    }
    function goblack() {
        location.href="list";
    }
</script>
</body>
</html>