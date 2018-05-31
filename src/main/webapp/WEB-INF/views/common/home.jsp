<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
</head>
<body>
	<button onclick="goto('/test2')">to test2</button>
	<button onclick="goto('/test3')">to test3</button>
	<form id="form">
		<input type="text" name="txt">
		<input type="password" name="pw">
		<input type="button" value="/test3" onclick="toform('/test3', 'form')">
	</form>
</body>
