<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.or.connect.todo.dao.TodoDao"%>
<%@ page import="kr.or.connect.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<title>TO DO LIST</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="style.css">
</head>
<body>
        
	<%
	List<TodoDto> list = (List<TodoDto>)request.getAttribute("list");
	TodoDto d = new TodoDto();
	int len = list.size();
	String todo = "todo";
	String doing = "doing";
	String done = "done";
	List<TodoDto> toDoList = new ArrayList<>();
	List<TodoDto> doingList = new ArrayList<>();
	List<TodoDto> doneList = new ArrayList<>();
	for(int i=0; i<len; i++){
		if (list.get(i).getType().equals(todo)){
			toDoList.add(list.get(i));
		}
		else if(list.get(i).getType().equals(doing)){
			doingList.add(list.get(i));
		}
		else{
			doneList.add(list.get(i));
		}
	}
	int j=0;
	
	%>
 <a href="TodoFormServlet" class="reg">새로운 TODO 등록</a>
  <div class="table">
    <table id="tmain">
      <tr id="status">
        <td>TO DO</td>
        <td>DOING</td>
        <td>DONE</td>
      </tr>
    </table>
  <table id=tbody>
    <tbody id=member>
	<tr><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td></tr>
    </tbody>
  </table>
  </div>

   <script type="text/javascript">
   document.addEventListener("DOMContentLoaded", function(){
	  var table1 = document.getElementById("member");
		var loop1 = 0;
		var loop2 = 0;
		var loop3 = 0;
		<%
		for(int l=0; l<toDoList.size(); l++){
		%>
		table1.rows[loop1].cells[0].innerHTML = "<%= toDoList.get(l)%><button type=\"button\">▶</button></td>"
		loop1++;
		<%
		}
		%>
		
		<%
		for(int m=0; m<doingList.size(); m++){
		%>
		table1.rows[loop2].cells[1].innerHTML = "<%= doingList.get(m)%><button type=\"button\" onclick=\"moveRight(this)\">▶</button>"
		loop2++;
		<%
		}
		%>
		
		<%
		for(int k=0; k<doneList.size(); k++){
		%>
		
		table1.rows[loop3].cells[2].innerHTML = "<%= doneList.get(k)%><button type=\"button\" onclick=\"moveRight(this)\">▶</button>"
		loop3++;
		<%
		}
		%>
	});
   
	 function moveRight(){
		<%
		TodoDto dto = new TodoDto();
		//어떤 dto인지 접근해야 함.
		
		request.setAttribute("id", dto.getId());
		request.setAttribute("type", dto.getType());
 	 
	//	RequestDispatcher rd = request.getRequestDispatcher("TodoTypeServlet");
	//	rd.forward(request, response);
		%>
	}
   </script>
</body>
</html>