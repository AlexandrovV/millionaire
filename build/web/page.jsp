<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Who Wants To Be A Millionaire</title>
	<!-- Bootstrap Core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="css/myapp.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <div class="wrapper">
        <c:choose>
            <c:when test = "${gameStarted && qId>10}">
               <%@include file="grats.jsp" %>
            </c:when>
            <c:when test = "${gameStarted}">
               <%@include file="game.jsp" %>
            </c:when>
            <c:otherwise>
              <%@include file="welcome.jsp" %>
            </c:otherwise>
        </c:choose>

        <%@include file="footer.jsp"%>