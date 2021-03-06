<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/Jan.js"></script>

</head>
<body>
<button onclick="goto('/home')">Home</button>	
<Br><Br>
<div class="box">
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">Likes</h2><br>
		<h6 style="color:gray;">Hear the tracks you’ve liked:</h6>
		<br><br><Br>
	<ul class="glul lists">
			<c:if test="${list==null ||list.size()==0}">
				리스트가 없습니다.
			</c:if>
			
			<c:if test="${list!=null }">
				<c:forEach var="like" items="${list}" varStatus="i">
					<li>
					<div id="likeList${i.index }">
					<c:if test="${like.code_meaning == '앨범' }">
						<div class="likeAlbum">
							<a href="/heartbeat/others/album/${like.album_sq}">
								<%-- <input type="hidden" id="music_sq${i.index }" value="${like.album_sq}"> --%>
								<img src="${pageContext.request.contextPath }/resources/img/album/${like.img_path }.png" class="albumImg">
							</a><br><br>
							<a href="#">
								<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" class="glul-img" onclick="like_func(${like.music_like_sq},'${like.code_meaning }','likeList${i.index }')">
							</a>
							${like.like_Count }<br>
						</div>
					</c:if>
					
					<c:if test="${like.code_meaning == '곡' }">
						<div class="likeMusic">
							<a href="/heartbeat/others/music/${like.music_sq}">
								<%-- <input type="hidden" id="music_sq${i.index }" value="${like.music_sq}"> --%>				
								<img src="${pageContext.request.contextPath }/resources/img/album/${like.img_path }.png" class="albumImg" style="border-radius: 50%;">
							</a><br><br>
							<a href="#">
								<img src="${pageContext.request.contextPath }/resources/img/profile/like.png" class="glul-img" onclick="like_func(${like.music_like_sq},'${like.code_meaning }','likeList${i.index }')">
							</a>
							${like.like_Count }<br>
						</div>
					</c:if>
					
						${like.album_nm }<br>
						<a href="/heartbeat/others/artist/${like.member_sq}">
							${like.nick }<br>
						</a>
						<c:if test="${like.cntFollow== 0}">
							<input type="button" value="+follow" onclick="following(${like.member_sq},${loginSession },'likeList${i.index }')" id="follow" >
						</c:if>
						<c:if test="${like.cntFollow>0 }">	
							<input type="button" value="-unfollow" onclick="unfollow(${like.member_sq},${loginSession },'likeList${i.index }')"id="unfollow" >
						</c:if>
						</div>
					</li>
					</c:forEach>
				</c:if>
					 <li class="lists__item js-load">test1</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test2</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test3</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test4</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test5</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test6</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test7</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test8</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test9</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test10</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test11</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test12</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test13</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test14</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test15</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test16</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test17</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test18</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test19</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test20</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test21</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test22</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test23</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test24</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
				      <li class="lists__item js-load">test25</li>
				      <li class="lists__item js-load">txttxttxttxttxttxt</li>
	</ul>
	<div id="js-btn-wrap" class="btn-wrap" style="text-align:center;" > <a href="javascript:;" class="button">더보기</a> </div>
	</div>
<div class="contents">
	<h2 style="text-align:center;" class="subTitle">unLikes</h2><br>
		<br><br><Br>
	<ul class="glul">
		<c:if test="${unList==null ||unList.size()==0}">
			리스트가 없습니다.
		</c:if>
			<c:if test="${unList!=null }">
			<c:forEach var="unlike" items="${unList}" varStatus="i">
				<li>
				<div id="unlikeList${i.index }">
				<c:if test="${unlike.code_meaning == '언라이크앨범' }">
					<div class="likeAlbum">
						<a href="/heartbeat/others/album/${unlike.album_sq}">
							<%-- <input type="hidden" id="music_sq${i.index }" value="${like.album_sq}"> --%>
							<img src="${pageContext.request.contextPath }/resources/img/album/${unlike.img_path }.png" class="albumImg"><br>
						</a>
						<a href="#">
							<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img" onclick="unLikeCancel(${unlike.music_like_sq},'${unlike.code_meaning }','unlikeList${i.index }')">
						</a>
						${unlike.like_Count }<br>
					</div>
				</c:if>
				<c:if test="${unlike.code_meaning == '언라이크곡' }">
					<div class="likeMusic">
						<a href="/heartbeat/others/music/${unlike.music_sq}">
							<%-- <input type="hidden" id="music_sq${i.index }" value="${like.music_sq}"> --%>				
							<img src="${pageContext.request.contextPath }/resources/img/album/${unlike.img_path }.png" class="albumImg" style="border-radius: 50%;"><br>
						</a>
						<a href="#">
							<img src="${pageContext.request.contextPath }/resources/img/profile/dislike.png" class="glul-img" onclick="unLikeCancel(${unlike.music_like_sq},'${unlike.code_meaning }','unlikeList${i.index }')">
						</a>
						${unlike.like_Count }<br>
					</div>
				</c:if>
					
					${unlike.album_nm }<br>
					
					<a href="/heartbeat/others/artist/${unlike.member_sq}">
						${unlike.nick }<br>
					</a>
					<c:if test="${unlike.cntFollow== 0}">
						<input type="button" value="+follow" onclick="following(${unlike.member_sq},${loginSession },'unlikeList${i.index }')" id="follow" >
					</c:if>
					<c:if test="${unlike.cntFollow>0 }">	
						<input type="button" value="-unfollow" onclick="unfollow(${unlike.member_sq},${loginSession },'unlikeList${i.index }')"id="unfollow" >
					</c:if>
					</div>
				</li>
			</c:forEach>
		</c:if>
	</ul>
    <div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">더보기</a> </div>
</div>
</div>

</body>
