<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
   .jumbotron{
      background-color:white;
      margin-bottom:0px;
   }
   .jumbotronImg{
      height: 200px;
   }
</style>
<%-- wording insertform jumbotron --%>
<div class="jumbotron jumbotron-fluid">
  <div class="container text-center">
     <div>
        <img class="jumbotronImg" src="${pageContext.request.contextPath}/svg/ebd5.svg" alt="대문이미지" />
     </div>
     <br />
     <p class="lead">
    	오늘의 조각글은 ?
     </p>
  </div>
</div>