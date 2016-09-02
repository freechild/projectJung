<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../include.jsp" %>
<%@ include file ="../index.jsp" %>

<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="/resources/js/form.js"></script>
<script src="/resources/js/part_main/mainIn.js"></script>
<script src="/resources/js/part_board/board.js"></script>
<script>
</script>
<article class="pagewidth" >
	<div align="center" ng-app="myApp" ng-controller="customersCtrl">
		<table class="board"  border="1" style="border:none;" >
			<tr>
				<th colspan="5" style="border: none;">
					<span style="font-size: 20pt;"> 
						자유게시판   &nbsp;&nbsp;&nbsp;&nbsp;
					</span>
				</th>
			</tr> 
			<tr>
				<td style="border: none;" align="right" colspan="5">
						<!-- 카테고리와 페이징 정보 -->  
					 <select id="category" onchange="categoryChange(this.value);">
						<option value="0">전체보기</option>
						<option value="2" ng-repeat="x in category">
							{{x.item}}
						</option>
					</select>					
					&nbsp;&nbsp;&nbsp;{{board.totalCount}}개
					<span ng-if="board.totalCount>0">
						({{board.currentPage}} / {{board.totalPage}} Page)
					</span>			
				</td>
			</tr>
			<tr bgcolor="white">
				<th>No</th>
				<th width="40%">제목</th>
				<th>작성자</th>
				<th width="30%">작성일</th>
				<th>조회수</th>
			</tr>
			
			<tr bgcolor="white" ng-repeat="x in names" ng-if="board.totalCount == 0">
				<th colspan="5">
				등록된 글이 없습니다.
				</th>	
 			</tr>
			<tr ng-repeat="x in names" ng-if="board.totalCount > 0">
			    <td align="center">
					<span>{{board.totalCount-(board.currentPage-1)*board.pageSize-$index }}</span>
				</td>
				<td>
					&nbsp;
					<a ng-href="b_view?idx={{x.idx}}&p={{board.currentPage}}&s={{board.pageSize}}&b={{board.blockSize}}&categoryid={{board.categoryid}}">
					<c:out value="{{x.title}}"/>
					</a>
				</td>
				<td align="center">
					<span><c:out value="{{x.name}}"/></span>
				</td>
				<td align="center" style="font-size:10px">
					<span>{{x.regdate}}</span>
				</td>
				<td align="center"><span>{{x.read}}</span></td>
 			</tr>
 			
 			<tr>
				<td align="center" colspan="5" style="border: none;">
					<!-- 페이지이동 처리 --> <!-- 이전 -->
			<c:if test="${board.startPage>1 }">
				[<a href="?p=${board.startPage-1 }&s=${board.pageSize }&b=${board.blockSize}&categoryid=${categoryid}">이전</a>] 
			</c:if>
			  <!-- 페이지리스트  -->
			<c:forEach var="i" begin="${board.startPage }" end="${board.endPage }">
				<c:if test="${board.currentPage==i }">
					[${i }] 
				</c:if>
				<c:if test="${board.currentPage!=i }">
					[<a href="?p=${i }&s=${board.pageSize }&b=${board.blockSize}&categoryid=${categoryid}">${i }</a>] 
				</c:if>
			</c:forEach>
			 <!-- 다음  -->
			<c:if test="${board.endPage<board.totalPage }">
				[<a href="?p=${board.endPage+1 }&s=${board.pageSize }&b=${board.blockSize}&categoryid=${categoryid}">다음</a>] 
			</c:if>
				</td>
			</tr>
 		
 		
 		
		</table>
	</div>
	<script>
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	
	var app = angular.module('myApp', []);
	app.controller('customersCtrl', function($scope, $http) {
		//주소받기
		var uid = getParameterByName('categoryid');
		alert(uid);
		$http({
	    	
	    })
	    .then(function (data) {
	    	$scope.names = data.data.list;
	    	$scope.board = data.data;
	    });
	    $http.get("/category")
	    .then(function (data) {
	    	$scope.category = data.data;
	    });
	});
</script>
</article>		



