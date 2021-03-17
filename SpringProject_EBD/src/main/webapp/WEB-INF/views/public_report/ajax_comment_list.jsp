<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.cmt-link{
   		color:grey;
   }
   	a:hover{
   		color:brown;
   }
</style>    
<c:forEach var="tmp" items="${commentList }"><%--댓글목록을 이용 --%>
	<c:choose>
		<c:when test="${tmp.deleted eq 'yes' }">
			<li>삭제된 댓글 입니다.</li><%-- li만 출력 --%>
		</c:when>
		<c:otherwise>
			<li id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.cmt_group }">style="padding-left:50px;"</c:if>>
				<c:if test="${tmp.num ne tmp.cmt_group }"><svg class="reply-icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-return-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 						<path fill-rule="evenodd" d="M10.146 5.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 9l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
 						<path fill-rule="evenodd" d="M3 2.5a.5.5 0 0 0-.5.5v4A2.5 2.5 0 0 0 5 9.5h8.5a.5.5 0 0 0 0-1H5A1.5 1.5 0 0 1 3.5 7V3a.5.5 0 0 0-.5-.5z"/></svg>
				</c:if>
				<dl>
					<dt>
						<div class="row">
							<div class="col">
								<span>${tmp.writer }</span>
								<c:if test="${tmp.num ne tmp.cmt_group }">
									@<i>${tmp.target_nick }</i>
								</c:if>
								<span>${tmp.regdate }</span>
							</div>
							<div class="col text-right">
								<span>
									<small>
										<a data-num="${tmp.num }" href="javascript:" class="reply-link cmt-link">답글</a>
										<c:if test="${tmp.writer eq nick }">
											<span class="cmt-link">|</span>
											<a data-num="${tmp.num }" href="javascript:" class="comment-update-link cmt-link">수정</a>
											<span class="cmt-link">|</span>
											<a data-num="${tmp.num }" href="javascript:" class="comment-delete-link cmt-link">삭제</a>
										</c:if>
									</small>
								</span>
							</div>
						</div>
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
					<div class="row">
						<div class="col-12">
							<textarea class="form-control" name="content"></textarea>
						</div>
						<div class="col text-right">
							<button class="btn btn-primary" type="submit">답글등록</button>
						</div>
					</div>
				</form>
				<!-- 로그인된 아이디와 댓글의 작성자가 같으면 수정 폼 출력 -->
				<c:if test="${tmp.writer eq nick }">
					<form class="comment-form update-form" 
						action="private/comment_update.do" method="post">
						<input type="hidden" name="num" value="${tmp.num }"/>
						<div class="row">
							<div class="col-12">
								<textarea class="form-control" name="content">${tmp.content }</textarea>
							</div>
							<div class="col text-right">
								<button class="btn btn-primary" type="submit">수정등록</button>
							</div>
						</div>
					</form>
				</c:if>
			</li>						
		</c:otherwise>
	</c:choose>
</c:forEach>