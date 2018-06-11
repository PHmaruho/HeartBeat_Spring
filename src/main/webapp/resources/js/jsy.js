/**
 * JSY's Javascript File
	주석은 해당 jsp 페이지!
 */

// Common- mainList
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
//common- discover, explore- discoverList
function showDetailSearch(){
	$('#detailSearchCategory').toggle();
}

function searchDetailShowKeyword(category){
	var r=category.value;
	$('#cat').val("");
	$('#cat').val(r);
	$('#cat').show;
	$('#detailTextSpace').show();
}

function clickdetailText(){
	var c=document.getElementById('cat').value;
	var d=document.getElementById('detailText').value.trim().split(' ');
}

function searchList(){
	var keyword=document.getElementById('searchBox').value.trim();
	//alert('keyword: '+keyword)
	var arr= keyword.split(" ");
	var con=["#","@","*"];
	var con2=["#@","#*","##","@@","@*","@#","**","*@","*#"];
	var con3
	=["!","$","%","^","&","+","-","=","-","_","|","[","]",":",";","\'","<",">",".","{","}","?",",","\"","||"];
	var count1=0;
	var count2=0;
	var count3=0;
	var noCategory=0;
	
	if(keyword.length==0){
		alert('검색어를 입력해주세요');
		return false;
	}
	
	for(var i=0;i<arr.length;i++){
		count1=0;
		//alert('arr['+i+']:'+arr[i]);
		
		for(var c3=0;c3<con3.length;c3++){
			var result=arr[i].indexOf(con3[c3]);
			var result2=arr[i].lastIndexOf(con3[c3]);
			//alert('result1:'+result+'/result2:'+result2);
			if((result==-1)&&(result2==-1)) continue;
			else count3++;
		}
		//alert('count3: '+count3);
		if(count3==0){
			for(var c2=0;c2<con2.length;c2++){
				var result= arr[i].lastIndexOf(con2[c2]);
				var result2= arr[i].lastIndexOf(con2[c2]);
				if((result==-1)&&(result2==-1)){
					//alert('con2[c2]:'+con2[c2]+'/result:'+result+'/result2: '+result2);
					continue;
				}
				else {
					count2++;
				}
			}
			//alert('count2: '+count2);
			if(count2==0){
				for(var c=0;c<con.length;c++){
					
					var result=arr[i].indexOf(con[c]);
					var result2= arr[i].lastIndexOf(con[c]);
					//alert('1 / arr[i]:'+arr[i]+'/con[c]:'+con[c]+'/result:'+result+'/result2: '+result2);
					
					if((result==0)&(result2==0)&(result==result2)){
						var arr2=arr[i].split(con[c]);
						for(var c1=0;c1<con.length;c1++){
							var result=arr2[1].indexOf(con[c1]);
							var result2= arr2[1].lastIndexOf(con[c1]);
							var result3=arr2[1].length;
							//alert('2 / arr2[1]:'+arr2[1]+'/con[c]:'+con[c1]+'/result:'+result+'/result2: '+result2);
								if(result3!=0){
									if((result==-1)&& (result2==-1)) {
										count1+=-1;
										//alert('2 count: '+count1);
									}
								}else count1=0;
							}
					}
				}
			}
			}
		//alert('count1: '+count1);
		if(count1!=-3) {
			alert('검색어 분류 또는 빈칸을 확인해주세요.');
			return false;
		}
	}
	
		$.ajax({
			type:'POST',
			url:'/heartbeat/do/discoverList',
			data:{
					val:keyword
				},
			success:function(data){
				$('#keywordList').html("");
				$('#keywordList').html(data);
			}
		});	
}

/* member - memberAlarmList */
function getMemberAlarmList(v){
	var v="ㅇㅅㅇ";
	//alert('getMembreAlarmList: '+v);
	$(document).ready(function(){
		setInterval(
				alarmContentShow(v),1000)
	});
}
function alarmContentShow(v){
	//alert('alarmContentShow ok');
	$('#alarmContent').toggle();
	var mId='<%=Session["id"]%>';
	//alert('v: '+v);
	$.ajax({
		url:'/heartbeat/do/memberAlarmList',
		data:{
			member_id:711
		},
		success:function(data){
			$('#alarmContent').html("");
			$('#alarmContent').html(data);
		}
	})
}
function updateAlarmStatus(v){
	var c=$('#alarm_sq'+v).val();
	//alert('alarm_sq: '+c);
	$.ajax({
		url:'/heartbeat/do/updateAlarmStatus',
		data:{
			alarmSq:c,
		},
		success:function(){
			alert('읽음 ok');
			location.reload();
		}
	})
}