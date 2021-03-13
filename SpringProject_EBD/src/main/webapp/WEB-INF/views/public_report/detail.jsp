<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/public_report/detail</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	/* 글 내용을 출력할 div 에 적용할 css */
	.contents{
		width: 100%;
		border: 1px dotted #cecece;
	}
	/* ul 요소의 기본 스타일 제거 */
	.comments ul{
		padding: 0;
		margin: 0;
		list-style-type: none;
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 50px;
	}
	.comment-form textarea, .comment-form button{
		float: left;
	}
	.comments li{
		clear: left;
	}
	.comments ul li{
		border-top: 1px solid #888;
	}
	.comment-form textarea{
		width: 85%;
		height: 100px;
	}
	.comment-form button{
		width: 15%;
		height: 100px;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
	.comments .comment-form{
		display: none;
	}
	/* .reply_icon 을 li 요소를 기준으로 배치 하기 */
	.comments li{
		position: relative;
	}
	.comments .reply-icon{
		position: absolute;
		top: 1em;
		left: 1em;
		color: red;
	}
	pre {
	  display: block;
	  padding: 9.5px;
	  margin: 0 0 10px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #333333;
	  word-break: break-all;
	  word-wrap: break-word;
	  background-color: #f5f5f5;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	}
	/* 글 내용중에 이미지가 있으면 최대 폭을 100%로 제한하기 */
	.contents img{
		max-width: 100%;
	}
	.loader{
		position: fixed; /* 좌하단 고정된 위치에 배치 하기 위해 */
		width: 100%;
		left: 0;
		bottom: 0;
		text-align: center; /* 이미지를 좌우로 가운데  정렬 */
		z-index: 1000;
		display: none; /* 일단 숨겨 놓기 */
	}	
	.heart-link{
      	font-size : 2em;
    }	
    .card{
    	padding-left:20px;
    	padding-right:20px;
    }
    .centerimg img{
    	max-width: 100%;
    }
    .marg{
    	margin-bottom:20px;
    }
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<div class="card">
		<div class="text-center marg">
			<h1>${dto.title }</h1>
		</div>
		<div class="text-right marg">
			<span><small>조회수 ${dto.viewcnt }</small></span>
			<span><small>${dto.regdate }</small></span>
		</div>
		<div class="marg">
			<center class="centerimg">
				<img src="${pageContext.request.contextPath }${dto.imgpath }"/>
			</center>
		</div>
		<div class="row marg">
			<div class="col text-left">
				<c:if test="${not empty nick }">
		            <c:choose>
		               <c:when test="${isheartclick eq true }">
		                  <a data-num="${dto.num }" href="javascript:" class="heart-link" href="list.do">♥</a>
		               </c:when>
		               <c:otherwise> 
		                  <a data-num="${dto.num }" href="javascript:" class="heart-link" href="list.do">♡</a>
		               </c:otherwise>
		            </c:choose>
	            	<span class="heart-cnt">(${heartcnt })</span>
	            </c:if>
			</div>
			<div class="col text-right marg">
				<c:if test="${dto.writer eq nick}">
	            <form action="updatepublicck2.do" method="post">
	            	<label for="publicck"></label>
	          		<select name="publicck" id="publicck">
	          				<option value="public">공개</option>
		          			<option value="private">비공개</option>
	          		</select>
	          		<label for="num"></label>
	          		<input type="hidden" value="${dto.num }" id="num" name="num"/>
	          		<input type="submit" value="선택"/>
	          	</form>
	       		</c:if>
			</div>
		</div>
		<table class="table">
			<tr>
				<th scope="row">도서명</th>
				<td>${dto.booktitle }</td>
			</tr>
			<tr>
				<th scope="row">저자명</th>
				<td>${dto.author }</td>
			</tr>
			<tr>
				<th scope="row">장르</th>
				<td>${dto.genre }</td>
			</tr>
			<tr>
				<th scope="row">별점</th>
				<td>${dto.stars }</td>
			</tr>
			<tr>
				<th scope="row">구매처 링크</th>
				<td><a href="${dto.link }"><b>${dto.booktitle } </b>네이버 도서로 바로가기</a></td>
			</tr>
		</table>
			<div class="marg">
				${dto.content }
			</div>
		<nav>
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${dto.prevNum ne 0 }">
						<li class="page-item mr-3">
							<a class="page-link" href="detail.do?num=${dto.prevNum }">&larr; Prev</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled mr-3">
							<a class="page-link" href="javascript:">Prev</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${dto.nextNum ne 0 }">
						<li class="page-item">
							<a class="page-link" href="detail.do?num=${dto.nextNum }">Next &rarr;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="javascript:">Next</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
	<hr/>
	<!-- 원글에 댓글을 작성하는 form -->
	<form class="comment-form insert-form" action="private/comment_insert.do" method="post">
		<!-- 원글의 글번호가 ref_group 번호가 된다. -->
		<input type="hidden" name="ref_group" value="${dto.num }"/>
		<!-- 원글의 작성자가 댓글의 수신자가 된다. -->
		<input type="hidden" name="target_nick" value="${dto.writer }"/>
		<textarea name="content"><c:if test="${empty nick }">로그인이 필요합니다</c:if></textarea>
		<button type="submit">등록</button>
	</form>	
	<!-- 댓글 목록 -->
	<div class="comments">
		<ul>
			<c:forEach var="tmp" items="${commentList }">
				<c:choose>
					<c:when test="${tmp.deleted eq 'yes' }">
						<li>삭제된 댓글 입니다.</li>
					</c:when>
					<c:otherwise>
						<li id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.cmt_group }">style="padding-left:50px;"</c:if>>
							<c:if test="${tmp.num ne tmp.cmt_group }"><svg class="reply-icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-return-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  						<path fill-rule="evenodd" d="M10.146 5.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 9l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
		  						<path fill-rule="evenodd" d="M3 2.5a.5.5 0 0 0-.5.5v4A2.5 2.5 0 0 0 5 9.5h8.5a.5.5 0 0 0 0-1H5A1.5 1.5 0 0 1 3.5 7V3a.5.5 0 0 0-.5-.5z"/></svg>
							</c:if>
							<dl>
								<dt>
									<span>${tmp.writer }</span>
									<c:if test="${tmp.num ne tmp.cmt_group }">
										@<i>${tmp.target_nick }</i>
									</c:if>
									<span>${tmp.regdate }</span>
									<a data-num="${tmp.num }" href="javascript:" class="reply-link">답글</a>
									<c:if test="${tmp.writer eq nick }">
										| <a data-num="${tmp.num }" href="javascript:" class="comment-update-link">수정</a>
										| <a data-num="${tmp.num }" href="javascript:" class="comment-delete-link">삭제</a>
									</c:if>
								</dt>
								<dd>
									<pre>${tmp.content }</pre>
								</dd>
							</dl>
							<form class="comment-form re-insert-form" 
								action="private/comment_insert.do" method="post">
								<input type="hidden" name="ref_group"
									value="${dto.num }"/>
								<input type="hidden" name="target_nick"
									value="${tmp.writer }"/>
								<input type="hidden" name="cmt_group"
									value="${tmp.cmt_group }"/>
								<textarea name="content"></textarea>
								<button type="submit">등록</button>
							</form>
							<!-- 로그인된 아이디와 댓글의 작성자가 같으면 수정 폼 출력 -->
							<c:if test="${tmp.writer eq nick }">
								<form class="comment-form update-form" 
									action="private/comment_update.do" method="post">
									<input type="hidden" name="num" value="${tmp.num }"/>
									<textarea name="content">${tmp.content }</textarea>
									<button type="submit">수정</button>
								</form>
							</c:if>
						</li>						
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="loader">
<img src="${pageContext.request.contextPath }/resources/images/ajax-loader.gif"/>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//댓글 수정 링크를 눌렀을때 호출되는 함수 등록 document 는 위에 로딩한 문서
	$(document).on("click",".comment-update-link", function(){//이벤트명, 선택자, 함수
		/*
			click 이벤트가 일어난 댓글 수정 링크에 저장된 data-num 속성의 값을 
			읽어와서 id 선택자를 구성한다.
		*/
		var selector="#comment"+$(this).attr("data-num");
		//구성된 id  선택자를 이용해서 원하는 li 요소에서 .update-form 을 찾아서 동작하기
		$(selector)
		.find(".update-form")
		.slideToggle();
	});
	//로딩한 jquery.form.min.js jquery플러그인의 기능을 이용해서 댓글 수정폼을 
	//ajax 요청을 통해 전송하고 응답받기
	$(document).on("submit", ".update-form", function(){
		//이벤트가 일어난 폼을 ajax로 전송되도록 하고 (submit 이벤트가 일어났을 때 강제로 ajax로 제출을 해라 ajaxsubmit)
		$(this).ajaxSubmit(function(data){//결과는 data로 간다.
			//console.log(data);
			//수정이 일어난 댓글의 li 요소를 선택해서 원하는 작업을 한다.
			var selector="#comment"+data.num; //"#comment6" 형식의 선택자 구성
			
			//댓글 수정 폼을 안보이게 한다. 
			$(selector).find(".update-form").slideUp();
			//pre 요소에 출력된 내용 수정하기
			$(selector).find("pre").text(data.content);
		});
		//폼 전송을 막아준다.
		return false;
	});
	
	$(document).on("click",".comment-delete-link", function(){
		//삭제할 글번호 
		var num=$(this).attr("data-num");
		var isDelete=confirm("댓글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath }"+
			"/public_report/private/comment_delete.do?num="+num+"&ref_group=${dto.num}";
		}
	});
	//답글 달기 링크를 클릭했을때 실행할 함수 등록
	$(document).on("click",".reply-link", function(){//이벤트명, 선택자, 함수
		//로그인 여부
		var isLogin=${not empty nick};
		if(isLogin == false){
			alert("로그인 페이지로 이동합니다.")
			location.href="${pageContext.request.contextPath }/users/loginform.do?"+
					"url=${pageContext.request.contextPath }/public_report/detail.do?num=${dto.num}";
		}
		
		var selector="#comment"+$(this).attr("data-num");
		$(selector)
		.find(".re-insert-form")
		.slideToggle();
		
		if($(this).text()=="답글"){//링크 text를 답글일때 클릭하면 
			$(this).text("취소");//취소로 바꾸고 
		}else{//취소일때 크릭하면 
			$(this).text("답글");//답들로 바꾼다.
		}	
	});
	$(document).on("submit",".insert-form", function(){//동적으로 li요소를 추가하려고 하기 때문에 이렇게 ajax를 바꿔줌
		//로그인 여부
		var isLogin=${not empty nick};
		if(isLogin == false){
			alert("로그인 페이지로 이동합니다.")
			location.href="${pageContext.request.contextPath }/users/loginform.do?"+
					"url=${pageContext.request.contextPath }/public_report/detail.do?num=${dto.num}";
			return false; //폼 전송 막기 		
		}
	});
	function deleteConfirm(){
		var isDelete=confirm("이 글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.do?num=${dto.num}";
		}
	}
	
	//페이지가 처음 로딩될때 1page 를 보여준다고 가정
	var currentPage=1;
	//전체 페이지의 수를 javascript 변수에 담아준다.
	var totalPageCount=${totalPageCount};//jsp 가 출력해준다. 전체가 20페이지가 있으면 20페이지가 출력되도록.
	//현재 로딩중인지 여부
	var isLoading=false;
	
	/*
	페이지 로딩 시점에 document 의 높이가 window 의 실제 높이 보다 작고
	전체 페이지의 갯수가(totalPageCount) 현재페이지(currentPage)
	보다 크면 추가로 댓글을 받아오는 ajax 요청을 해야한다.
	*/
	var dH=$(document).height();//문서의 높이
	var wH=window.screen.height;//window 의 높이
	
	if(dH < wH && totalPageCount > currentPage){
		//로딩 이미지 띄우기
		$(".loader").show();
		
		currentPage++; //페이지를 1 증가 시키고 
		//해당 페이지의 내용을 ajax  요청을 해서 받아온다. 
		$.ajax({
			url:"ajax_comment_list.do",
			method:"get",
			data:{pageNum:currentPage, ref_group:${dto.num}},
			success:function(data){
				console.log(data);
				//data 가 html 마크업 형태의 문자열 
				$(".comments ul").append(data);
				//로딩 이미지를 숨긴다. 
				$(".loader").hide();
			}
		});		
	}	
	
	//웹브라우저에 scoll 이벤트가 일어 났을때 실행할 함수 등록 
	$(window).on("scroll", function(){
		//위쪽으로 스크롤된 길이 구하기
		var scrollTop=$(window).scrollTop();
		//window 의 높이
		var windowHeight=$(window).height();
		//document(문서)의 높이
		var documentHeight=$(document).height();
		//바닥까지 스크롤 되었는지 여부
		var isBottom = scrollTop+windowHeight + 10 >= documentHeight;
		if(isBottom){//만일 바닥까지 스크롤 했다면...
			if(currentPage == totalPageCount || isLoading){//만일 마지막 페이지 이면 
				return; //함수를 여기서 종료한다. 
			}
			//현재 로딩 중이라고 표시한다. 
			isLoading=true;
			//로딩 이미지 띄우기
			$(".loader").show();
			
			currentPage++; //페이지를 1 증가 시키고 
			//해당 페이지의 내용을 ajax  요청을 해서 받아온다. 함수로 받아짐. 
			$.ajax({
				url:"ajax_comment_list.do",
				method:"get",
				data:{pageNum:currentPage, ref_group:${dto.num}},
				success:function(data){ //li, dl, dt, dd (a, form 동적으로 추가)
					console.log(data);
					//data 가 html 마크업 형태의 문자열 
					$(".comments ul").append(data);
					//로딩 이미지를 숨긴다. 
					$(".loader").hide();
					//로딩중이 아니라고 표시한다.
					isLoading=false;
				}
			});
		}
	});	
	
	//하트를 클릭할 때마다 호출되는 함수 등록
	   $(document).on("click",".heart-link",function(){
	      //글 번호를 불러온다.
	      var target_num=$(this).attr("data-num");
	   
	      if($(this).text()=="♡"){ //하트일때 클릭하면
	         
	         //insert 요청을 한다.(컨트롤러에서 responsebody사용)
	         $.ajax({
	            url:"${pageContext.request.contextPath }/public_report/saveheart.do",
	            method:"GET",
	            data: "target_num="+target_num,
	            success:function(data){ //나중에 구현 : 하트 수를 반환
	               $(".heart-cnt").text("("+data.heartCnt+")");
	            }
	         });
	         $(this).text("♥"); //하트 눌림으로 바뀐다.
	         
	         
	      
	      }else{//하트 눌림일 때 클릭하면 (하트를 해제한 효과)         
	         //delete 요청을 한다.(컨트롤러에서 responsebody사용)
	         $.ajax({
	            url:"${pageContext.request.contextPath }/public_report/removeheart.do",
	            method:"GET",
	            data: "target_num="+target_num,
	            success:function(data){
	               $(".heart-cnt").text("("+data.heartCnt+")");
	            }             
	         });
	         
	         $(this).text("♡");//하트로 바뀐다. 
	      }
	      
	   });
	   
	 //페이지가 뒤로가기 하면 하트버튼과 하트수 갱신이 안된다. 이때 하트를 누르면 디비에 중복으로 값이 들어가진다.
	   //방지하기 위해 페이지가 뒤로가기 할때마다 css로 클릭을 막고 새로고침을 통해 갱신된 하트버튼과 하트수가 나오도록 한다.
	   $(window).bind("pageshow", function (event) {
	      if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
	         console.log('BFCahe로부터 detail 복원됨');
	         $(".heart-link").css("pointer-events","none");
	         location.reload();//새로고침하기
	      }
	      else {
	         console.log('새로 열린 detail 페이지');
	      }
	      
	   });
</script>
</body>
</html>