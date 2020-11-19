<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
</head>
<body>
    <form action="">
        名字：<input type="text" name="sname" value=""><br>
        <%--日期：<input type="text" name="sdata"><br>--%>
    </form>
    <input type="button" value="返回" onclick="goblack()">
    <input type="button" value="提交" onclick="tj()">
<script type="text/javascript">
    function tj() {
        /*location.href="add";*/
        $.post(
            "add",
            $("form").serialize(),
            function (obj) {
                if (obj){
                    alert("添加成功");
                    location.href="list";
                }else {
                    alert("添加失败");
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