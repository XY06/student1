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
    <script type="text/javascript">
        var id = ${param.id};
        $(function () {
            $.post(
                "upd",
                {id:id},
                function(obj)
                {
                    /*var list = obj.list;*/
                    var student = obj.student;
                    /*for ( var i in list) {
                        $("[name='cid']").append("<option value='"+list[i].cid+"'>" + list[i].cname + "</option>")
                    }*/
                    $("[name='id']").val(student.id);
                    $("[name='sname']").val(student.sname);
                    $("[name='sdata']").val(student.sdata);
                },
                "json");
        })
    </script>
</head>
<body>
    <form action="">
        <input type="hidden" name="id">
        名字：<input type="text" name="sname"><br>
        日期：<input type="text" name="sdata"><br>
    </form>
    <input type="button" value="返回" onclick="goblack()">
    <input type="button" value="提交" onclick="tj()">
<script type="text/javascript">
    function tj() {
        /*location.href="add";*/
        $.post(
            "addupd",
            $("form").serialize(),
            function (obj) {
                if (obj){
                    alert("修改成功");
                    location.href="list";
                }else {
                    alert("修改失败");
                }
            },
            "json"
        )
    }
    function goblack() {
        location.href="list";
    }
</script>
</body>
</html>