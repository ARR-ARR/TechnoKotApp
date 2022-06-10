<%@ page import="model.User" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    Map<String, User> userMap = (Map<String, User>) request.getServletContext().getAttribute("MapUser");
    String login = (String) session.getAttribute("login");
    User user = userMap.get(login);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Профиль <%=user.getLogin()%>
    </title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet"/>
    <link href="default.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="fonts.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="styleProfile.css" rel="stylesheet" type="text/css" media="all"/>

    <!--[if IE 6]>
    <link href="default_ie6.css" rel="stylesheet" type="text/css"/><![endif]-->

</head>
<body>
<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><span class="fa fa-bolt"></span><a href="#">Techno Kot</a></h1>
        </div>
        <div id="menu">
            <ul>
                <li><a href="index.html" accesskey="1" title="">Главная</a></li>
                <li><a href="#" accesskey="2" title="">О магазине</a></li>
                <li><a href="./catalogServlet" accesskey="3" title="">Каталог</a></li>
                <li><a href="cart.jsp" accesskey="4" title="">Корзина</a></li>
                <li class="current_page_item"><a href="./profile.jsp" accesskey="5" title="">Профиль</a></li>
                <li><a href="./logoutServlet" accesskey="4" title="">Выход</a></li>
            </ul>
        </div>
    </div>
</div>

<div id="wrapper">
    <div id="featured-wrapper">
        <div class="container">
            <div class="main-body">
                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="img/profile.png" alt="Admin" class="rounded-circle" width="150">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">ФИО</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%=user.getFio()%>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%=user.getEmail()%>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Номер счета</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%=user.getAccount()%>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Сумма на счете</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%=user.getSum()%>
                                            <div class="col-sm-3">
                                                <button class="button-little"><a href="./addingMoney">Пополнить баланс</a></button>
                                            </div>

                                        </div>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
