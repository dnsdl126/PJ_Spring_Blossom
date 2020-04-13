	function getFileInfo(fullName, path) {
		var origianlFileName;  //화면에 출력할 파일명
		var imgSrc; 		   // 썸네일 or 파일아이콘 이미지 팔일
		var originalFileUrl;   // 원본파일 요청 URL
		var uuidFileName;      // 날짜 경로를 제외한 나머지 파일명 (UUID)
		var basicFileName = fullName;  // 삭제시 값을 전달하기 위한

		//이미지 파일이면
		if(checkImageType(fullName)) {
			imgSrc = path + "/upload/displayFile?fileName=" + fullName;
			uuidFileName = fullName.substr(14);// 순수 이미지 이름만 남음 
			var originalImg = fullName.substr(0 ,12) + fullName.substr(14)
			// s_는 썸네일 이미지 이름이어서 s_를 뺀 순수 이미지 이름을 만들어낸다 
			
			//원본이미지 요청 링크 
			originalFileUrl = path + "/upload/displayFile?fileName=" + originalImg;
		} else {
			imgSrc = path + "/resources/img/file-icon.png"; // 파일 아이콘
			uuidFileName = fullName.substr(12);
			// 파일 다운로드 요청 링크
			originalFileUrl = path + "/upload/displayFile?fileName=" + fullName;
					
		}
		originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);
		//전체 파일명의 크기가 14보다 작으면 그래로 이름 출력.
		// 14보다 크면 실행
		if(originalFileName.length > 14) {
			// 앞에서부터 11글자 자름
			var shortName = originalFileName.substr(0, 10);
			//.을 기준으로 배열 생성
			var formatVal = originalFileName.split(".");
			//formatVal = originalFileName.substr(originalFileName.length-3)
			// 파일명에 .이 여러개 들어가 있을수도 있음
			// 배열크기를 구해와서 무조건 맨 마지막 확장자 부분 출력되게 함
			var arrNum = formatVal.length -1;
			//맨 처음 문자열 10글자 + ..... + 확장자
			originalFileName = shortName + "..." + formatVal[arrNum];
		}
		return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileurl: originalFileUrl, fullName: fullName, basicFileName: basicFileName};
		
	}
	
//첨부파일 출력
	
	function printFiles(data, path) {
		var fileInfo = getFileInfo(data, path);
		 console.log(fileInfo);
		//Handlebars 파일 템플렛에 파일 정보들을 바인딩 하고 HTML 생성
		var html = fileTemplate(fileInfo);
		html +="<input type = 'hidden' class='file' value='"+ fileInfo.fullName+"'>";
		// Handlebars 파일 템플렛 컴파일을 통해 생성된 HTML 을 DOM 에 주입
		$(".uploadedList").append(html);
		//이미지 파일인 경우 aaaaaaaaaa 파일 템플렛에 lightbox속성 추가
		if(fileInfo.fullName.substr(12, 2) == "s_"){
			//마지막에 추가된 첨부파일 템플릿 선택자
			var that = $(".uploadedList li").last();
			//lightbox 속성추가
			that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages"); 
			//파일 아이콘에서 이미지 아이콘으로 변경 		
		    that.find(".fa-paperclip").attr("class", "fa fa-camera");
		}
	}
	
	function getOriginalName(fileName) {
		if(checkImageType(fileName)) { // 이미지 파일이면 skip
			return;
		}
		var idx=fileName.indexOf("_")+1; // uuid를 제외한 파일 이름
		return fileName.substr(idx);
	}
	
	function getImageLink(fineName) {
		if(!checkImageType(fileName)){// 이미지 파일이 아니면 skip
			return;
		}
		var front= fileName.substr(0,12) // 연 월일 경로
		var end = fileName.substr(14); // s_ 제거
		return front + end;
	}
	
	function checkImageType(fileName) {
		var pattern=/jpg|gif|png|jpeg/i; // 정규표현식 (대소문자 무시)
		return fileName.match(pattern); // 규칙에 맞으면 true
	}
	
	//첨부파일 리스트를 출력하는 함수
	function listAttach(path, bno) {
		var listCnt = 0;
		$.ajax({
			type: "post",
			url: path + '/board/getAttach?bno='+bno,
			async: false,
			success:function(list) {
				// list : //json
				 console.log(list)
				listCnt = list.length;
				
				/* console.log(list.length);*/
			
				/* jQuery each()sms qksqhrans
				i와 e는 index와 element로
				json에서 {0: "apple.png"}일때
				index는 0, element는 apple.png가 됨 */
				
				$(list).each(function(i, e){
					/* console.log(list) */
					printFiles(e,path); //첨부파일 출력 메서드 호출
				});
			}
		});
		return listCnt;
	}