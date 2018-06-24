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
var sliderOptions =
{
    sliderId: "slider",
    startSlide: 0,
    effect: "series1",
    effectRandom: false,
    pauseTime: 2800,
    transitionTime: 1200,
    slices: 14,
    boxes: 8,
    hoverPause: 1,
    autoAdvance: true,
    thumbnailsWrapperId: "thumb_container_id",
    m: false,
    license: "mylicense"
};

var imageSlider=new mcImgSlider(sliderOptions); 
/*
function mcImgSlider(i){for(var I=function(a){return ................}*/


/*var $imgList = $('.banner>div');			// banner div 안에 있는 div 자식들을 가져옴
var nImgCount = $imgList.children().length;	// 위에서 가져온 div 자식들의 개수
var nDuration = 4000;					// 이미지를 변경할 시간 (3000 = 3초)
var bAuto = true;						// 자동으로 변경할 지 여부
var nIndex = 0;						// 변경할 이미지의 Index

if(bAuto == true) {
	setInterval(autoSlide, nDuration);		// Javascript setInterval 함수 호출
}

function autoSlide() {
	 3초마다 이 함수에 들어오게 됨 
	// % 연산은 나누기를 한 후 나머지 값을 가져오는 연산입니다.
	 nImgCount = 4
	
		nIndex = 0
		++nIndex = 1
		(++nIndex % nImageCount) = (1 % 4 = 1)
		$($imgList.get(0)).fadeOut(1000);	// 0 Index에 있는 이미지를 fadeOut
		$($imgList.get(1)).fadeIn(1000);	// 1 Index에 있는 이미지를 fadeIn
	
	
		nIndex = 1
		++nIndex = 2
		(++nIndex % nImageCount) = (2 % 4 = 2)
		$($imgList.get(1)).fadeOut(1000);	// 1 Index에 있는 이미지를 fadeOut
		$($imgList.get(2)).fadeIn(1000);	// 2 Index에 있는 이미지를 fadeIn
	
	var next = (++nIndex % nImgCount);
	$($imgList.get(next - 1)).fadeOut(2000);
	$($imgList.get(next)).fadeIn(2000);
}
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
			alert("좋아요 취소");
			/*location.reload();*/
			$('#'+v).load('#'+v+' '+'#'+v);
		}
	})


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
			alert("♥");
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
			alert("♥");
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
			alert("다시 조아요");
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
				alert("팔로잉 시작");
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
				alert("팔로우 해제");
				/*location.reload();*/
				$('#'+type).load('#'+type+' '+'#'+type);
			}
		});
		
	}}}


var gfv_ajaxCallback = "";
function ComAjax(opt_formId){
    this.url = "";     
    this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.param = "";
     
    if(this.formId == "commonForm"){
        var frm = $("#commonForm");
        if(frm.length > 0){
            frm.remove();
        }
        var str = "<form id='commonForm' name='commonForm'></form>";
        $('body').append(str);
    }
     
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.setCallback = function setCallback(callBack){
        fv_ajaxCallback = callBack;
    };
 
    this.addParam = function addParam(key,value){
        this.param = this.param + "&" + key + "=" + value;
    };
     
    this.ajax = function ajax(){
        if(this.formId != "commonForm"){
            this.param += "&" + $("#" + this.formId).serialize();
        }
        $.ajax({
            url : this.url,   
            type : "POST",  
            data : this.param,
            async : false,
            success : function(data, status) {
                if(typeof(fv_ajaxCallback) == "function"){
                    fv_ajaxCallback(data);
                }
                else {
                    eval(fv_ajaxCallback + "(data);");
                }
            }
        });
    };
}


/*
divId : 페이징 태그가 그려질 div
pageIndx : 현재 페이지 위치가 저장될 input 태그 id
recordCount : 페이지당 레코드 수
totalCount : 전체 조회 건수
eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
*/
var gfv_pageIndex = null;
var gfv_eventName = null;
function gfn_renderPaging(params){
    var divId = params.divId; //페이징이 그려질 div id
    gfv_pageIndex = params.pageIndex; //현재 위치가 저장될 input 태그
    var totalCount = params.totalCount; //전체 조회 건수
    var currentIndex = $("#"+params.pageIndex).val(); //현재 위치
    if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true){
        currentIndex = 1;
    }
     
    var recordCount = params.recordCount; //페이지당 레코드 수
    if(gfn_isNull(recordCount) == true){
        recordCount = 20;
    }
    var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
    gfv_eventName = params.eventName;
     
    $("#"+divId).empty();
    var preStr = "";
    var postStr = "";
    var str = "";
     
    var first = (parseInt((currentIndex-1) / 10) * 10) + 1;
    var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
    var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) - 9 : 1;
    var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
     
    if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
        preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" +
                "<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>";
    }
    else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨앞 태그 작성
        preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>";
    }
     
    if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성
        postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" +
                    "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
    }
    else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨뒤 태그 작성
        postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
    }
     
    for(var i=first; i<(first+last); i++){
        if(i != currentIndex){
            str += "<a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a>";
        }
        else{
            str += "<b><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></b>";
        }
    }
    $("#"+divId).append(preStr + str + postStr);
}
 
function _movePage(value){
    $("#"+gfv_pageIndex).val(value);
    if(typeof(gfv_eventName) == "function"){
        gfv_eventName(value);
    }
    else {
        eval(gfv_eventName + "(value);");
    }
}


