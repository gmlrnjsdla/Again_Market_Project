<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/memberModify.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/member_modify/modify.js"></script>

<title>Insert title here</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>
	
<form action="memberModifyOk" name="modify_frm" method="post" enctype="multipart/form-data">	
	<div class="recommend" style="margin-bottom:100px;">
	<div class="card" style="width: 700px; height:820px; border:1px solid #dddddd; border-radius:5px;">
		<br>
		<div class="card-body" style="margin-left: 5%;"> 
			<div style="display:inline-block;vertical-align:top;">
				<input type="hidden" name="id" value="${memberDto.id }" >
				
			
		
			<!--  프로필사진 출력 시작-->	
			
				<div id="att_zone" class="rounded-circle" style="border:1px solid #dddddd; width: 50px; 
											height: 50px;border-radius: 70%; overflow: hidden;"
      				data-placeholder="파일을 첨부 하려면 파일 선택 버튼을 클릭하세요">
      			</div>
      		
			<!--  프로필사진 출력 끝-->
			
			</div>
			<!-- 아이디, 프로필사진 버튼 span -->
			<span style="display:inline-block; font-weight: bold; font-size: 20px; ">
				&nbsp;&nbsp;&nbsp;${memberDto.id }<br>&nbsp;&nbsp;
			
				<!-- 프로필 사진변경 시작 -->
			
				<span id="image_preview">
				
				<label class="input-file-button" for="btnAtt" accept="image/*" onchange="setThumbnail(event);" 
						style="height:30px; margin-top:10px;;padding:2px 5px 0 5px;font-size: 15px; font-weight: normal;"> 프로필 사진변경</label>
				<input type="file" id="btnAtt" name="file" style="display:none;"/>
				
			  	<script>
				( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
			  		imageView = function imageView(att_zone, btn){
			
					    var attZone = document.getElementById(att_zone);
					    var btnAtt = document.getElementById(btn)
					    var sel_files = [];
					    
					    // 이미지와 체크 박스를 감싸고 있는 div 속성a
					    var div_style = 'display:inline-block;position:relative;'
					                  + 'width:100%;height:100%;margin:5px;border:1px solid #C0C0C0;z-index:1;margin: auto;';
					    			  
					    // 미리보기 이미지 속성
					    var img_style = 'width:100%;height:100%;z-index:none; object-fit: cover;';
					    			  
					    // 이미지안에 표시되는 체크박스의 속성
					    var chk_style = 'width:30px;height:30px;position:absolute;font-size:10px;'
					                  + 'right:5px;bottom:5px;z-index:999;background-color:rgba(255,255,255,0.1);color:#C0C0C0';
					   				 
					    btnAtt.onchange = function(e){
					      var files = e.target.files;
					      var fileArr = Array.prototype.slice.call(files)
					      for(f of fileArr){
					        imageLoader(f);
					    }
					 }  
			    
			 
				    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
				    imageLoader = function(file){
					      sel_files.push(file);
					      var reader = new FileReader();
					      reader.onload = function(ee){
					        let img = document.createElement('img')
					        img.setAttribute('style', img_style)
					        img.src = ee.target.result;
					        attZone.appendChild(makeDiv(img, file));
					      }
				      
				      reader.readAsDataURL(file);
				    }
			    
				    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
				    makeDiv = function(img, file){
				      var div = document.createElement('div')
				      div.setAttribute('style', div_style)
				      
				      var btn = document.createElement('input')
				      btn.setAttribute('type', 'button')
				     // btn.setAttribute('value', 'x')
				      btn.setAttribute('delFile', file.name);
				     // btn.setAttribute('style', chk_style);
				      btn.onclick = function(ev){
				        var ele = ev.srcElement;
				        var delFile = ele.getAttribute('delFile');
				        for(var i=0 ;i<sel_files.length; i++){
				          if(delFile== sel_files[i].name){
				            sel_files.splice(i, 1);      
				          }
				        }
			        
				        dt = new DataTransfer();
				        for(f in sel_files) {
				          var file = sel_files[f];
				          dt.items.add(file);
				        }
				        btnAtt.files = dt.files;
				        var p = ele.parentNode;
				        attZone.removeChild(p)
				      }
				      div.appendChild(img)
				      div.appendChild(btn)
				      return div
				    }
				  }
				)('att_zone', 'btnAtt')
			
				</script>
				</span>
				<!-- 프로필 사진변경 끝 -->
			</span>
			<!-- 아이디, 프로필사진 버튼 span 끝-->
				<br>
	  	</div>
		

		
	  	
	  	<!-- 이름 -->
	  
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">이름</label>
 		<div class="col-sm-10">
    		<input type="text" class="form-control" id="colFormLabel" name="name" value="${memberDto.name }" style="width:480px;">
  		</div>
		</div>
	  	<div class="col-auto">
	    	<div class="form-text" style="margin-left: 20%; margin-right: 15%;">
	      		사람들이 이름, 별명 또는 비지니스 이름 등 회원님의 알려진 이름을 사용하여 회원
	      		계정을 찾을 수 있도록 도와주세요. 이름은 14일 안에 두 번만 변경할 수 있습니다.<br><br><br>
	    	</div>
	  	</div>
	  	<!--  이름끝 -->
	  	
	  	<!-- 사용자 -->
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">닉네임</label>
 		<div class="col-sm-10">
    		<input type="text" class="form-control" id="colFormLabel" name="nick" value="${memberDto.nick }" style="width:480px;">
  		</div>
		</div>
	  	<div class="col-auto">
	    	<div class="form-text" style="margin-left: 20%; margin-right: 15%;">
	      		대부분의 겨우 이후 14일 동안 사용자 이름을 다시 <!-- ${id} -->(으)로 변경할 수 있습니다.<br><br><br>
	    	</div>
	  	</div>
	  	<!--  사용자끝 -->
	  	
	  	<!-- 소개 -->
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">소개</label>
 		<div class="col-sm-10">
    		<textarea class="form-control" aria-label="With textarea" style="width:480px;" name="greet" >${memberDto.greet }</textarea> 
  		</div>
		</div>
	  	<!--  소개 끝 -->
	  	
	  	<div class="form-text" style="margin-left: 17%; margin-right: 15%;">
	      		<br>
	      		<h5>개인정보</h5>
	      		비즈니스나 반려동물 등에 사용된 계정인 경우에도 회원님의 개인 정보를 입력하세요. 
	      		공개 프로필에는 포함되지 않습니다. <br><br>
	    	</div>
		
		<!-- 이메일 -->
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">이메일</label>
 		<div class="col-sm-10">
    		<input type="text" class="form-control" id="colFormLabel" name="mail" value="${memberDto.mail }" style="width:480px;">
  		</div>
		</div>
	  	<!--  이메일끝 -->
  		
  		<!-- 전화번호 -->
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">전화번호</label>
 		<div class="col-sm-10">
    		<input type="text" class="form-control" id="colFormLabel" name="phone" value="${memberDto.phone }" style="width:480px;">
  		</div>
		</div>
	  	<!--  전화번호끝 -->
  		
  		
	  	<center>
		<input type="button" class="btn btn-primary"  style="width:100px;margin-bottom: 20px;" value="수정" onclick="modifyCheck()"></button>
		<button type="button" class="btn btn-secondary"  style="margin-bottom: 20px;" onclick="script:window.location='sell_List?id=${memberDto.id }'"> 취소</button>
		</center>
		
	</div>
	</div>
	</form>
	
	<%@ include file="include/footer.jsp" %>
</body>
</html>