
// netflix box 초기화
function initView(el_name, item_count) {

	let menu = document.getElementsByClassName(el_name);
	let m_count = menu.length;
	
	for(let i=0; i<m_count; i++){
		if (i < item_count){
			menu[i].style.display = 'block';
		} else {
			menu[i].style.display = 'none';
		}
	}
}
initView("netflix_box", 5);

function netflix_list(direction, el_name,view_count, scroll_count, style) {

	let menu = document.getElementsByClassName(el_name);
	let m_count = menu.length;
	let start = 0;

	console.log("M_COUNT : " +m_count); // 10
	style = (typeof (style) != 'undefined') ? style : 'block';

	for (let i = 0; i < m_count; i++) {
		if (menu[i].style.display == 'block') {
			start = i;
			break;
		}
	}
	console.log(direction) // pre & next

	if (direction == 'next') {
		if(menu[m_count-1].style.display == style){
			return false;
		}else{
			for (let i = 0; i < m_count; i++) {
				if (i >= start + scroll_count && i < start + scroll_count + view_count) {
					menu[i].style.display = style;
				} else {
					menu[i].style.display = 'none';
				}
			}
		}
	}else if(direction =="pre"){
		
		if(menu[0].style.display == style){
			return false;
		}else {
			 for(var i=0;i<m_count;i++){
				if (i >= start - scroll_count && i < start - scroll_count + view_count) {
				menu[i].style.display = style;
			} else {
				menu[i].style.display = 'none';
			}
		}
			
	}
		
	}
}

