function slider() {
	
	
	// querySelector : element를 선택할때 사용함. 일치하는 요소가 없으면 null을 반환
	
	let slides = document.querySelector(".slider_items"); // 슬라이드 아이템 영역 선택
	console.log("슬라이드 아이템 선택 : "+slides);
	
	
	
	let item = slides.getElementsByClassName("slide_item"); // 슬라이드 아이템 가져오기
	console.log("가져온 슬라이드 아이템 : " + item);
	
	
	
	
	const firstImg = item[0]; // 슬라이드 아이템의 첫번째 이미지
	console.log("이미지 :" + firstImg);

	
	
		
	firstImg.classList.add('on_slide'); // 첫번째 슬라이드 아이템에 on_slide 클래스 추가 (css참고)
	
	
	// 3초마다 transition 함수를 5초마다 호출하기
	
	const getTransition = setInterval(transition, 5000); 
	
	function transition() {
		console.log('transition');
		// 현재 활성화되어있는 아이템을 선택한다
		const nowItem = document.querySelector(".on_slide");
		
		
		
		// 활성화 되어있는 아이템 비활성화
		nowItem.classList.remove('on_slide');
		
		
		// 만약 마지막 슬라이드 아이템 이라면
		if(!nowItem.nextElementSibling){
			// 첫번째 아이템 & 썸네일 아이템을 활성화 시킨다
			item[0].classList.add('on_slide');	
			
		}else {
			// 그외의 경우 다음 엘리먼트를 활성화 시킨다.
			nowItem.nextElementSibling.classList.add('on_slide');
			
		}
	}
}

// 호출
slider();


// sample

/*
function slider() {
	
	
	// querySelector : element를 선택할때 사용함. 일치하는 요소가 없으면 null을 반환
	
	let slides = document.querySelector(".slider_items"); // 슬라이드 아이템 영역 선택
	console.log("슬라이드 아이템 선택 : "+slides);
	
	let thumbnail = document.querySelector(".thumbnail"); // 썸네일 영역 선택
	console.log("썸네일 영역 선택 : " + thumbnail);
	
	let item = slides.getElementsByClassName("slide_item"); // 슬라이드 아이템 가져오기
	console.log("가져온 슬라이드 아이템 : " + item);
	
	let thumbnail_item = thumbnail.getElementsByClassName("thumbnail_item"); // 썸네일 아이템 가져오기
	console.log("가져온 썸네일 아이템 :" + thumbnail_item);
	
	
	const firstImg = item[0]; // 슬라이드 아이템의 첫번째 이미지
	console.log("이미지 :" + firstImg);

	const firstThum = thumbnail_item[0]; // 썸네일 아이템의 첫번째 이미지
	console.log("썸네일 :" + firstThum);
	
		
	firstImg.classList.add('on_slide'); // 첫번째 슬라이드 아이템에 on_slide 클래스 추가 (css참고)
	firstThum.classList.add('on_thumbnail'); // 첫번째 썸네일 아이템에 위와 같이 클래스를 추가.
	
	// 3초마다 transition 함수를 5초마다 호출하기
	
	const getTransition = setInterval(transition, 5000); 
	
	function transition() {
		console.log('transition');
		// 현재 활성화되어있는 아이템을 선택한다
		const nowItem = document.querySelector(".on_slide");
		
		// 썸네일 아이템을 선택한다
		const nowThum = document.querySelector(".on_thumbnail");
		
		// 활성화 되어있는 아이템 비활성화
		nowItem.classList.remove('on_slide');
		// 활성화 되어있는 썸네일 비활성화
		nowThum.classList.remove('on_thumbnail');
		
		// 만약 마지막 슬라이드 아이템 이라면
		if(!nowItem.nextElementSibling){
			// 첫번째 아이템 & 썸네일 아이템을 활성화 시킨다
			item[0].classList.add('on_slide');	
			thumbnail_item[0].classList.add('on_thumbnail');	
		}else {
			// 그외의 경우 다음 엘리먼트를 활성화 시킨다.
			nowItem.nextElementSibling.classList.add('on_slide');
			nowThum.nextElementSibling.classList.add('on_thumbnail');
		}
	}
}

// 호출
slider();
*/