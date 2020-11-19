<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/11/11
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>学生岗位网站</title>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
</head>
<body>
<form>
    <div style="margin-left: 800px;font-weight: bold;margin-top:150px;font-size: 30px;width: 700px;height: 500px;border-bottom: #b81900;border: 1px solid;">
        <table style="width: 600px;height: 400px;margin-left: 50px;">
            <tr style="margin-left: 20px">
                <td>用户名</td>
                <td><input type="text" name="user"></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" name="password" id="password"></td>
            </tr>
            <tr>
                <td>手机号</td>
                <td><input type="text" name="phone"></td>
            </tr>
            <tr>
                <td>重复密码</td>
                <td><input type="password" name="password1" id="password1"></td>
            </tr>
            <tr>
                <td>身份</td>
                <td>
                    <select name="shenfen">
                        <option>请选择</option>
                        <option>学生</option>
                        <option>企业</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="button" value="注册" onclick="zhuce1()"></td>
                <td><input type="button" value="返回" onclick="fanhui()"></td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    function zhuce1() {
        // location.href="denglu";
        // var password = $("password").val();
        // var password1 =$("password1").val();
        if (password.value!=null && password.value!= '' && password1.value!=password.value) {
            alert("两次密码不正确")
        }else {
            $.post(
                "zhuce1",
                $("form").serialize(),
                function (obj) {
                    if (obj){
                        alert("添加成功");
                        location.href="denglu";
                    }else {
                        alert("添加失败");
                    }
                }
            )
        }

    }
    function fanhui() {
        location.href="zhuce1";
    }
</script>
    <%--<img src="css/img1/1.jpg" style="height: 500px;width: 700px;margin-left: 650px">
    <table style="margin-left: 1400px;margin-top: -400px;font-weight: bold;font-size: 20px;">
        <tr style="text-align: center">
            <td style="width: 200px;">学生</td>
            <td style="width: 200px;">企业</td>
        </tr>
        <tr>
            <td>账号</td>
            <td>
                <input type="text" name="username">
            </td>

        </tr>
        <tr>
            <td>密码</td>
            <td>
                <input type="password" name="password">
            </td>
        </tr>
        <tr>
            <td><a href="list" style="text-decoration:none">登录</a></td>
            <td><a href="" style="text-decoration:none">游客</a></td>
            <td><a href="zhuce" style="text-decoration:none">注册</a></td>
        </tr>
    </table>--%>
</body>
</html>
