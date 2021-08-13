function change(type, eventNode) {	
	var base = eventNode.parentNode; 	
	if (type === 'todo')		
		type = 'doing';	
	else if (type === 'doing') {		
		type = 'done';		
		base.removeChild(eventNode);	
	} 	
	
	var list = document.querySelector("div[id=" + type + "]"); 	
	list.appendChild(base);
} 


function moveButtonClick(id, eventNode) {	
	var xhr = new XMLHttpRequest(); 
	var type = eventNode.parentNode.parentNode.getAttribute("id"); 	
	xhr.addEventListener("load", function() {
		if(this.responseText === "success")			
			change(type, eventNode);	
	}); 	
	
	xhr.open("GET", "./TodoTypeServlet?id=" + id + "&type=" + type);	
	xhr.send();
}

function removeButtonClick(id, eventNode){
	var xhr = new XMLHttpRequest();
	xhr.addEventListener("load", function() {
		if(this.readyState == 4 && this.status == 200)			
			console.log(this.responseText);
	}); 	
	
	xhr.open("GET", "./TodoRemoveServlet?id=" + id);
	xhr.send();
}