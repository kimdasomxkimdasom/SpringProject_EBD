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
<%-- file insertform jumbotron --%>
<div class="jumbotron jumbotron-fluid">
  <div class="container text-center">
     <div>
        <img class="jumbotronImg" src="${pageContext.request.contextPath}/svg/ebd2.svg" alt="대문이미지" />
     </div>
     <br />
     <p class="lead">북스북스 회원들과 내가 만든 양식을 나누고, 공유하고 </p>
  </div>
</div>