<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../index.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="/resources/js/part_main/mainIn.js"></script>
<script src="/resources/js/form.js"></script>
<script src="/resources/js/part_friend&msg/message.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/friendList.css" />
<article>
	<div class="searchList" align="center">
		<table class="search_person" width="100%" cellspacing='0'>
			<!-- cellspacing='0' is important, must stay -->

			<!-- .search_person Header -->
			<thead>
				<tr>
					<th>당신에게 온 메세지</th>
					<th><input type="button" value="Send Msg" onclick="javascript:sendMsg()"></th>
				</tr>
			</thead>
			<!-- .search_person Header -->

			<!-- .search_person Body -->
			<tbody>
				<tr class='even'>
					<td>Sender</td>
					<td>Recipient</td>
					<td>Message</td>
										
				</tr>
				<c:if test="${listCount==0 }">
					<tr class='even'>
					<td></td>
					<td>받은 메시지가 없습니다.</td>
					<td></td>					
				</tr>	
				</c:if>
				<c:if test="${listCount!=0 }">
					<c:forEach var= "msg" items="${messageList }" varStatus="m" >
						<tr class='even'>
							<td>${msg.sender }</td>
							<td>${msg.recipient }</td>
							<td><a href="javascript:msgDetail('${msg.idx}')">${msg.message }</a></td>				
						</tr>	
					
					</c:forEach>
				</c:if>
				
			</tbody>
			
		</table>
	</div>
</article>