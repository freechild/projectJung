<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../index.jsp" %>
<%@ include file="../include.jsp" %>

<article>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="/resources/js/part_main/mainIn.js"></script>
<script src="/resources/js/form.js" ></script>
<script src="/resources/js/part_board/b_view.js" ></script>

	 	 
	
	<input type="hidden" value="${vo.idx }" id="idx">
	name : <c:out value="${vo.name }" /> ,
	ip : <c:out value="${vo.ip }" /> , 
	likes : <c:out value="${vo.likes }" /><br>
	title : <c:out value="${vo.title }" /> ,
	Date : <fmt:formatDate value="${vo.regdate }"/>   ->
	<hr>
	
	<c:set var ="content1" value="${vo.content } "/>
				<c:set var="content1" value="${fn:replace(content1,'<','&lt;') }"/>
				<c:set var="content1" value="${fn:replace(content1,newLine,br) }"/>
				${content1 }
	<hr>
	<div align="right">	
		<input type="button" value="수정" id ="b_modi" onclick="showPopup('b_modi')">
		<input type="button" value="삭제" id ="b_del" onclick="showPopup('b_del')">
		<input type="button" value=" 돌아가기 " onclick="location.href='board?p=${p}&s=${s}&b=${b}'" />
	</div>
	
	
	<hr>
	<br>
	<div class="comment_V">
		<c:if test="${empty clist }">
			등록된 댓글이 없습니다.
		</c:if>
		<c:if test="${!empty clist }">
			<c:forEach var="c" items="${clist }" varStatus="s">
				글쓴이 :<c:out value="${c.name }" /> 
				등록일: <fmt:formatDate value="${c.regdate }"/> 
				
				<input type="button" value="Delete"  id="${c.idx }" onclick="showPopup('${c.idx}')">
				<br>
				댓글 :<c:set var ="content" value="${c.content } "/>
				<c:set var="content" value="${fn:replace(content,'<','&lt;') }"/>
				<c:set var="content" value="${fn:replace(content,newLine,br) }"/>
				${content }<br>
				
			</c:forEach>
		</c:if>
	</div>

	
	<hr>
	<div class="comment_W">
		댓글 : <input type="text" name="content" size="20px"><hr>
		<input type="button" value="전송" onclick="javascript:comments()">
	
	</div>
	
</article>

