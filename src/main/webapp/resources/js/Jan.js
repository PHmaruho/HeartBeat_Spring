/**
 * JAN Javascript File
	주석은 해당 jsp 페이지!
 */

//Common-home.jsp

/*var img=new Array();
img[0]=new Image(); img[0].src="resources/img/banner/mainBanner1.jpg";
img[1]=new Image(); img[1].src="resources/img/banner/mainBanner2.jpg";
img[2]=new Image(); img[2].src="resources/img/banner/mainBanner3.jpg";
var interval=1500;
var n=0;
var imgs = new Array("resources/img/banner/mainBanner.jpg","resources/img/banner/mainBanner1.jpg","resources/img/banner/mainBanner2.jpg","resources/img/banner/mainBanner3.jpg");
function rotate()
{
if(navigator.appName=="Netscape" && document.getElementById)
{
document.getElementById("slide").src=imgs[n];
}
else document.images.slide.src=imgs[n];
(n==(imgs.length-1))?n=0:n++;
setTimeout("rotate()",interval);
}


list=new Array("resources/img/profile/mainBanner1.jpg","resources/img/profile/mainBanner2.jpg","resources/img/profile/mainBanner3.jpg"); 
num=Math.round(Math.random()*(list.length-1)); 
displayMultimedia("/xe/flash/"+ list[num],500,140,false); */


//Common - mainBanner random

var $imgList = $('.banner>div');			// banner div 안에 있는 div 자식들을 가져옴
var nImgCount = $imgList.children().length;	// 위에서 가져온 div 자식들의 개수
var nDuration = 2000;					// 이미지를 변경할 시간 (3000 = 3초)
var bAuto = true;						// 자동으로 변경할 지 여부
var nIndex = 0;						// 변경할 이미지의 Index

if(bAuto == true) {
	setInterval(autoSlide, nDuration);		// Javascript setInterval 함수 호출
}

function autoSlide() {
	/* 3초마다 이 함수에 들어오게 됨 */
	// % 연산은 나누기를 한 후 나머지 값을 가져오는 연산입니다.
	 //nImgCount = 4
	/*
		nIndex = 0
		++nIndex = 1
		(++nIndex % nImageCount) = (1 % 4 = 1)
		$($imgList.get(0)).fadeOut(1000);	// 0 Index에 있는 이미지를 fadeOut
		$($imgList.get(1)).fadeIn(1000);	// 1 Index에 있는 이미지를 fadeIn
	*/
	/*
		nIndex = 1
		++nIndex = 2
		(++nIndex % nImageCount) = (2 % 4 = 2)
		$($imgList.get(1)).fadeOut(1000);	// 1 Index에 있는 이미지를 fadeOut
		$($imgList.get(2)).fadeIn(1000);	// 2 Index에 있는 이미지를 fadeIn
	*/
	var next = (++nIndex % nImgCount);
	$($imgList.get(next - 1)).fadeOut(1000);
	$($imgList.get(next)).fadeIn(1000);
}

// Common - 상세페이지

function like_func() {
	var frm_read = $(frm_read);
	var target_sq = $('#target_sq',frm_read).val();
	//var member_sq = $('#member_sq',frm_read).varl();
	console.log("target_sq, member_sq :"+target_sq+","+member_sq);
$.ajax({
	url:"/do/like",
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
});
}

/**
 * JSY's Javascript File
	주석은 해당 jsp 페이지!
 */

// Common- 상세페이지
function musicShare(v){
	var member_id='<%=Session["id"]%>';
	var c=$('#music_sq'+v).val();
	$.ajax({
		url:'/heartbeat/do/mainListShare',
		data:{
			music_sq:c,
			id:member_id
		},
		success:function(){
			alert('공유되었습니다.');
		}
	})
}