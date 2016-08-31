<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../index.jsp"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="/resources/js/part_main/mainIn.js"></script>
<script src="/resources/js/form.js"></script>
<script src="/resources/js/part_friend&msg/friendList.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/friendList.css" />
<article>
	<div class="searchList" align="center">
		<table class="search_person" width="100%" cellspacing='0'>
			<!-- cellspacing='0' is important, must stay -->

			<!-- .search_person Header -->
			<thead>
				<tr>
					<th>검색어</th>
					<th><input type="search" id="search" onkeyup="search()"></th>
					<th><input type="button" value="seach"></th>
				</tr>
				<tr>
					<td>Email</td>
					<td>Name</td>
					<td>Status</td>
				</tr>
			</thead>

			<tbody class="searchFriend">				
			</tbody>
			
		</table>
	</div>
</article>