<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<style>
	/*전체 페이지 폰트 적용*/
	*{
		font-family: 'Gothic A1', sans-serif;
	}
	/*버튼 기본 노랑*/
    .btn {
    	background-color:#F7DC6F ;
    }
    /*버튼 호버시 연한 노랑*/
    .btn:hover{
    	background-color:#FBEEE6;
    }
    /*버튼안에 링크 걸려있을시 적용할 css*/
    .btn>a{
    	color:#212529;
    	text-decoration: none;
    }
</style>
<body>
<div class="container-fluid">
	<div class="container" style="margin-bottom:10px;">
        <form action="bookList.do">
           <div class="row justify-content-md-center">
              <div class="col-md-8">
                  <input class="form-control" type="text" name="keyword" >
              </div>
              <span>
                  <input class="btn" type="submit" value="검색">
              <span>
           </div>              
        </form>        
    </div>
    <table class="table" id="search-api">
    	<thead>
    		<div class="container">
		       	<tr class="text-center">
		       		<th>책표지</th>
		       		<th>책제목</th>
		       		<th>저자</th>
		       		<th>출판사</th>
		       		<th>책소개</th>
		       		<th>구매처 링크</th>
		       		<th>선택</th>
		       	</tr>
    		</div>
    	</thead>
    	<tbody>
        <c:forEach items="${bookList}" var ="b">
            <tr class="text-center">
                <td width="100"><img src="${b.image}"/></td>
                <td width="200">${b.title}</td>
                <td width="100">${b.author}</td>
                <td width="100">${b.publisher }</td>
                <td width="400">${b.description}</td>
                <td width="200">
                	<a href="${b.link }">${b.link }</a>
                </td>
                <td width="100">
                	<form action="insertform.do">
                		<label for="booktitle"></label>
                		<input type="hidden" id="booktitle" name="booktitle" value="${b.title }"/>
                		<label for="author"></label>
                		<input type="hidden" id="author" name="author" value="${b.author }"/>
                		<label for="link"></label>
                		<input type="hidden" id="link" name="link" value="${b.link }"/>
                		<input class="btn" type="submit" value="선택"/>
                	</form>
                </td>
                <!-- 
                <td width="100"><input type="button" class="checkBtn" value="선택"/></td>
                 -->                
            </tr>
        </c:forEach>
    	</tbody>
    </table>
    
    <div id="result"></div>
    <div id="result2"></div>
</div>
<!-- 
<div id="result"></div>
<div id="result2"></div>
 -->   
<script>
	/*
	//테이블의 Row 클릭시 값 가져오기
	$("#search-api").click(function(){
		
		var str = ""
		var tdArr = new Array(); //배열 선언
		
		//현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		//tr.text() 는 클릭된 Row 즉 tr 에 있는 모든 값을 가져온다.
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
		//반복문을 이용해서 배열에 값을 담아 사용할 수도 있다.
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
		
		console.log("배열에 담긴 값 : "+tdArr);
		
		//td.eq(index)를 통해 값을 가져올 수도 있다.
		var image = td.eq(0).text();
		var title = td.eq(1).text();
		var author = td.eq(2).text();
		var link = td.eq(4).text();
		
		str += "* 클릭된 row의 td값 = image. : " + image +
			", 제목 : " + title +
			", 저자 : " + author +
			", 링크 : " + link ;
		
		$("#result").html("클릭한 모든 row의 모든 데이터 = "+tr.text());
		$("#result2").html(str);
	});
	*/
	
	//버튼 클릭시 row 한개의 값 가져오기
	$(".checkBtn").click(function(){
		
		var str = ""
		var tdArr = new Array(); //배열 선언
		var checkBtn = $(this);
		
		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
        // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
        var tr = checkBtn.parent().parent();
        var td = tr.children();

		console.log("클릭한 row의 모든 데이터 : "+tr.text());
		
        var image = td.eq(0).text();
        var title = td.eq(1).text();
        var author = td.eq(2).text();
        var publisher = td.eq(3).text();
        var link = td.eq(4).text();
        var description = td.eq(5).text();
        
        //반복문을 이용해서 배열에 값을 담아 사용할 수 있다.
        td.each(function(i){
        	tdArr.push(td.eq(i).text());
        });
		
        console.log("배열에 담긴 값 : "+tdArr);
        /*
        str += image+
        	title+
        	author+
        	publisher+
        	link+
        	description;
        */
        title = title
        author = author
        link = link
        
        //$("#result").html(tr.text());
        $("#result2").html("제목 : "+title+" 저자 : "+author+" 구매처 링크 : "+link);
        //이 값을 insertform.jsp 로 넘기는 방법
        
	});
</script>
</body>
</html>