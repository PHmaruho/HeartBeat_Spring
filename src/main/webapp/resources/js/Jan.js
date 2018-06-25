/**
 * JAN Javascript File
	주석은 해당 jsp 페이지!
 */

// Common - 상세페이지
function like_func(sq, type,v) {
	/*alert('like_func')
	alert("도착ㄱ");
	alert("타입 :" + type );
	alert("sq : " + sq);*/
	$.ajax({
		url: '/heartbeat/do/dislike',
		data: {
			music_like_sq: sq ,
			music_like_type: type
		},
		success: function() {
			/*location.reload();*/
			$('#'+v).load('#'+v+' '+'#'+v);
		}
	})
	
	/*var frm_read = $(frm_read);
	var target_sq = $('#target_sq',frm_read).val();
	//var member_sq = $('#member_sq',frm_read).varl();
	console.log("target_sq, member_sq :"+target_sq+","+member_sq);
$.ajax({
	url:"/heartbeat/do/like",
	type: "GET",
	cache: false,
	dataType: "json",
	data: 'target_sq='+target_sq,
	success: function(data) {
		var msg ='';
		var like_img='';
		msg += data.msg;
		alert(msg);
		
		if(data.like_check == 0 ) {
			like_img="resources/img/profile/dislike.png";
		} else {
			like_img="resources/img/profile/like.png"
		}
		$('#like_img',frm_read).attr('src',like_img);
		$('#like_cnt').html(data.like_cnt);
		$('#like_check').html(data.like_check);
	},
	error : function(request,status,error) {
		alert("code:"+request.status+"|n"+"message:"+request.responseText+"|n"+"error:"+error);
	}
});*/
	
}

/**
 * JSY's Javascript File
	주석은 해당 jsp 페이지!
 */


// Activity - clickLike
function likeAlbum(sq, id, type) {
	$.ajax({
		url : '/heartbeat/do/likeAlbum',
		data: {
			album_sq :sq,
			member_sq : id
		},
		success:function() {
			/*location.reload();*/
			$('#'+type).load('#'+type+' '+'#'+type);
		}
		
	})
}

function likeMusic(sq, id) {
	$.ajax({
		url : '/heartbeat/do/likeMusic',
		data: {
			music_sq :sq,
			member_sq : id
		},
		success:function() {
			/*location.reload();
			$('#'+type).load('#'+type+' '+'#'+type);*/
		}
		
	})
}

function unLikeCancel(sq, type,v) {
	
	$.ajax({
		url: '/heartbeat/do/unLikeCancel',
		data: {
			music_like_sq : sq,
			music_like_type: type
		},
		success : function() {
			/*location.reload();*/
			$('#'+v).load('#'+v+' '+'#'+v);
		}
	})
	
}


function following(sq,session,type) {

	if(sq==session) alert('본인을 팔로우 할 수 없습니다.');
	$.ajax({
		url: '/heartbeat/do/follow',
		data: {
			member_sq : sq,
			loginSession : session
		},
		success : function(data) {
			
			if(data == 1) {
			$('#'+type).load('#'+type+' '+'#'+type);

			} else if (data == 0) alert("이미 팔로우된 유저");
			/*location.reload();*/
			$('#'+type).load('#'+type+' '+'#'+type);
			
		}
	})
}


function unfollow(targetSq,memberSq,type) {
	
	if(targetSq== memberSq) alert('본인을 팔로우할 수 없습니다.')
	else{
		$.ajax({
			url: '/heartbeat/do/unfollow',
			data: {
				member_sq : memberSq,
				target_sq:targetSq
			},
			success : function() {
				/*location.reload();*/
				$('#'+type).load('#'+type+' '+'#'+type);
			}
		});
		
	}
}


