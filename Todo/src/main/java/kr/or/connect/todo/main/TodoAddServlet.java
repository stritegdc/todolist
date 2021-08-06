package kr.or.connect.todo.main;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.connect.todo.dao.TodoDao;
import kr.or.connect.todo.dto.TodoDto;

/**
 * Servlet implementation class TodoAddServlet
 */
@WebServlet("/TodoAddServlet")
public class TodoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TodoAddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");

		String what = request.getParameter("what");
		String who = request.getParameter("who");
		String priority = request.getParameter("radio");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar time = Calendar.getInstance();
		String format_time = format.format(time.getTime());
		
		System.out.println(what);
		System.out.println(who);
		System.out.println(format_time);
		System.out.println(priority);
		
		TodoDao dao = new TodoDao();
		TodoDto dto = new TodoDto();
		dto.setName(who);
		dto.setTitle(what);
		dto.setSequence(Integer.parseInt(priority));
		dto.setRegdate(format_time);
		dto.setType("todo");
		dao.addToDo(dto);

		response.sendRedirect("./MainServlet");

	}

}
