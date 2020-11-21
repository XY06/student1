<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <%--<link rel="stylesheet" type="text/css" href="css/index.css">--%>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <style type="text/css">
        .li1{
            float: left;
            list-style: none;
            margin-left: 10px;
            color: white;
        }
    </style>
</head>
<body>
<div style="width: 1440px;height: 1332px;background: url(css/img1/6.png)no-repeat;position: absolute;margin-left: 700px;">
    <%--<img src="css/img1/2.jpg" style="margin-left: 80px;margin-top: 3px;">--%>
    <ul style="margin-left: 830px;">
        <li class="li1">主页</li>
        <li class="li1">关于我们</li>
        <li class="li1">登录</li>
    </ul>
    <div style="margin-left: 490px;margin-top: 200px;color: white;width: 280px;height: 136px;">
        <span style="text-align: center;font-size: 30px;margin-left: 20px">学生岗位</span><br>
        <span style="text-align: center;font-size: 25px;margin-left: -30px;">致力于学生就业网站</span><br>
        <span style="text-align: center;font-size: 25px;margin-left: -10px;">为学生和企业工作</span><br><br><br>
        <input type="button" value="注册" style="width: 100px;height: 30px;margin-left: -60px;" onclick="zhuce()">
        <input type="button" value="登录" style="width: 100px;height: 30px;margin-left: 100px;" onclick="denglu()">
        <input type="text" style="width: 650px; height: 27px; margin-left: -370px;margin-top: 30px;">
        <input type="button" value="搜索" style="float: left;margin-left: 300px;margin-top: -33px;width: 100px;height: 30px;background-color: #03A9F4;color: white">
    </div>
    <ul style="margin-top: 180px;margin-left: 0px;">
        <li style="list-style: none;float: left">
            <img src="css/img1/7.jpg" alt="" style="width: 273px;height: 264px;">
            <div style="width: 269px;height: 198px;">
                <h2 style="margin-left: 100px;margin-top: 30px;">大学生</h2>
            </div>
        </li>
        <li style="list-style: none;float: left;margin-left: 80px;">
            <img src="css/img1/4.jpg" alt="" style="width: 273px;height: 264px;">
            <div style="width: 269px;height: 198px;">
                <h2 style="margin-left: 110px;margin-top: 30px;">企业</h2>
            </div>
        </li>
        <li style="list-style: none;float: left;margin-left: 80px;">
            <img src="css/img1/6.jpg" alt="" style="width: 273px;height: 264px;">
            <div style="width: 269px;height: 198px;">
                <h2 style="margin-left: 110px;margin-top: 30px;">平台</h2>
            </div>
        </li>
    </ul>
</div>

<%--<table>
    <tr>
        <td>
            全选
            <input type="checkbox" id="ckAll" onclick="qx()">
            <input type="button" onclick="delAll()" value="删除选中">
        </td>
        <td>ID</td>
        <td>名字</td>
        <td>日期</td>
        <td>操作   <input type="button" value="添加"  onclick="toadd()"></td>
    </tr>
    <c:forEach items="${list}" var="aa">
        <tr>
            <td><input type="checkbox" class="cktext" value="${aa.id}"></td>
            <td>${aa.id}</td>
            <td>${aa.username}</td>
            <td><fmt:formatDate value="${aa.adddate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <input type="button" value="修改" onclick="upd(${aa.id})">
                <input type="button" value="删除" onclick="del(${aa.id})">
            </td>
        </tr>
    </c:forEach>
    &lt;%&ndash;<form action="file/upload" method="post" enctype="multipart/form-data">
        <input type="file" name="file"/> <br>
        <input type="submit" value="上传"/>
    </form>
    <a href="/file/download">文件下载</a>&ndash;%&gt;
</table>--%>
<script type="text/javascript">
    function denglu() {
        location.href="denglu";
    }
    function zhuce() {
        location.href="zhuce";
    }

    function toadd() {
        location.href="toadd";
    }
    function upd(id) {
        location.href="toupd?id="+id;
    }
    function del(id) {
        $.post(
            "delete",
            {id:id},
            function (obj) {
                if (obj){
                    alert("删除成功");
                    location.href="list"
                }else {
                    alert("删除失败");
                }
            },
            "json"
        );
    }
    /*$(function () {
        /!*$("#ckAll").click(function () {
            $(".cktext").prop("checked",$(this).prop("checked"));
        })*!/
        $(".cktext").prop("checked",$("#ckAll").prop("checked"))
    })*/
    function qx() {
        $(".cktext").prop("checked",$("#ckAll").prop("checked"))
    }
    function delAll() {
        var id = $(".cktext:checked").map(function () {
            return $(this).val()
        }).get().join()
        $.post(
            "delAll",
            {id:id},
            function (obj) {
                if (obj){
                    alert("删除成功");
                    location.href="list"
                }else {
                    alert("删除失败");
                }
            },
            "json"
        );
    }
</script>
</body>
</html>