function change(type, eventNode) {	
	var insertItem = eventNode.parentNode; 	
	if (type == 'todo')		
		type = 'doing';	
	else if (type == 'doing') {		
		type = 'done';		
		insertItem.removeChild(eventNode);	
	} 	
	
	var list = document.querySelector("section[id=" + type + "]"); 	
	list.appendChild(insertItem);
} 

function moveButtonClick(id, eventNode) {	
	var httpRequest = new XMLHttpRequest(); 
	var type = eventNode.parentNode.parentNode.getAttribute("id"); 	
	httpRequest.addEventListener("load", function() {
		if(this.responseText === "success")			
			change(type, eventNode);	
	}); 	
	
	httpRequest.open("GET", "./TodoTypeServlet?id=" + id + "&type=" + type);	
	httpRequest.send();
}