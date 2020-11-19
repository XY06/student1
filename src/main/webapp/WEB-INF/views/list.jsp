<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
</head>
<body>

<table>
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
    <%--<form action="file/upload" method="post" enctype="multipart/form-data">
        <input type="file" name="file"/> <br>
        <input type="submit" value="上传"/>
    </form>
    <a href="/file/download">文件下载</a>--%>
</table>
<script type="text/javascript">
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