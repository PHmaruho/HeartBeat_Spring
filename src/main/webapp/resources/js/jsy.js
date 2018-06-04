/**
 * JSY's Javascript File
 */

/*common- discover, explore- discoverList */
 function showDetailSearch(){
	$('#detailSearchCategory').toggle();
}

function searchDetailShowKeyword(category){
	var r=category.value;
	$('#cat').val("");
	$('#cat').val(r);
	$('#detailTextSpace').show();
}

function clickdetailText(){
	var c=document.getElementById('cat').value;
	var d=document.getElementById('detailText').value.trim().split(' ');
}

function searchList(){
	var keyword=document.getElementById('searchBox').value.trim();
	var arr= keyword.split(" ");
	var con=["#","@","*"];
	var con2=["#@","#*","##","@@","@*","@#","**","*@"];
	var con3=["!","$","%","^","&","+","-","=","-","_","|"];
	var count1=0;
	var count2=0;
	var count3=0;
	var noCategory=0;
	
	for(var i=0;i<arr.length;i++){
		for(var c3=0;c3<con3.length;c3++){
			var result=arr[i].indexOf(con3[c3]);
			var result2=arr[i].lastIndexOf(con3[c3]);
			if((result==-1)&&(result2==-1)) continue;
			else count3++;
		}
		alert('count3: '+count3);
		if(count3==0){
			for(var c2=0;c2<con2.length;c2++){
				var result=arr[i].indexOf(con2[c2]);
				var result2= arr[i].lastIndexOf(con2[c2]);
				if((result2==0)&& (result2!=-1)) continue;
				else count2++;
			}
		alert('count2: '+count2);
		if(count2!=0){
			for(var c=0;c<con.length;c++){
				var result=arr[i].indexOf(con[c]);
				var result2= arr[i].lastIndexOf(con[c]);
				alert('con[c]:'+con[c]+'/result:'+result+'/result2: '+result2);
				if((result==0)&&(result2==0)) {count=0;break;}
					else count1++;
				}
			}
		alert('out count1: '+count1);
		}
			/*if((result==-1)&&(result2!=-1)&&(result2==0)) continue;
			else count2++;*/
	}
			/*if(count2==0){
			 * for(var c=0;c<con.length;c++){
			if(count3==0){
				for(var c1=0;c1<con.length;c1++){
					var result=arr[i].indexOf(con[c1]);
					var result2= arr[i].lastIndexOf(con[c1]);
					if((result==-1)&&(result2!=-1)&&(result2==0)) {
						count1++;
						continue;
					}else noCategory++;
				}
			}
		}*/
	
	var v=(count1!=0) && (noCategory!=0)
	if(keyword.length==0){
		alert('검색어를 입력해주세요');
		return false;
	}else if(!v) {
		alert('검색어 분류 를 확인해주세요.');
		return false;
	}
	else{
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
}

/*common- mainList*/
function mainListShare(str){
	var mainList_id='music_sq'+str;
	var mainList_value=document.getElementById(mainList_id).value.trim();
	
	$.ajax({
		url:'/heartbeat/do/mainListShare',
		data:{
			music_sq:mainList_value
			},
		success:function(){
			alert('공유되었습니다.');
		}
	});
}