<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width,maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="format-detection" content="telephone=no"/>
    <link href="res/css/mdui.min.css" rel="stylesheet">
    <script type="text/javascript" src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://res.springmarker.com/other/js/mdui.min.js"></script>
    <style>
        body{
            font-family:Microsoft Yahei;
        }
        .main {
            min-width: 320px;
            max-width: 600px;
            margin-top: 200px;
        }

        .submitButton {
            margin-top: 20px;
        }

        @media only screen and (max-width: 800px) {
            .main {
                margin-top: 80px;
            }
        }
    </style>
</head>
<body>
<div class="mdui-container main">
    <div class="mdui-center mdui-text-color-blue mdui-text-center" style="float: left;width:100%;font-size: 28px;">
        自由的音乐
    </div>

    <div class="mdui-center" style="width:100%;margin-top: 30px;float: left">
        <table style="float: left;width: 100%">
            <tr>
                <td>
                    <label class="mdui-radio mdui-center">
                        <input id="group1" type="radio" name="group1"/>
                        <i class="mdui-radio-icon"></i>
                        腾讯
                    </label>
                </td>
                <td>
                    <label class="mdui-radio">
                        <input id="group2"  type="radio" name="group1"/>
                        <i class="mdui-radio-icon"></i>
                        网易
                    </label>
                </td>
                <td>
                    <label class="mdui-radio">
                        <input id="group3" type="radio" name="group1"/>
                        <i class="mdui-radio-icon"></i>
                        酷狗
                    </label>
                </td>
            </tr>
        </table>

    </div>
    <div class="mdui-center" style="width: 100%;float: left">
        <div class="mdui-textfield">
            <input id="inputText" class="mdui-textfield-input" type="text" placeholder="请输入关键词" AUTOCOMPLETE="off"/>
        </div>

        <button id="submitButton" type="submit" value="开始" onclick="submit()"
                class=" mdui-ripple mdui-color-pink-400 submitButton mdui-btn mdui-btn-raised  mdui-center">
            开始
        </button>


    </div>


</div>

<div class="" style="">


</div>

<script>
    $('#inputText').bind('keyup', function (event) {
        if (event.keyCode == "13") {
            //回车执行查询
            $('#submitButton').click();
        }
    });
    function submit() {
        var type;
        if ( document.getElementById("group1").checked){
            type=1;
        }else if( document.getElementById("group2").checked){
            type=2;
        }else if( document.getElementById("group3").checked){
            type=3;
        }else {
            mdui.snackbar({message: '未选择！'});
            return;
        }
        var keyword=$("#inputText").val();
        if (keyword==""||keyword==null){
            mdui.snackbar({message: '未输入关键词！'});
            return;
        }
        location.href = "search.do?keyword="+keyword+"&page=1&type="+type;
    }
</script>
</body>
</html>