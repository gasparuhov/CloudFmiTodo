package com.fmi.cloud.java.todo;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fmi.cloud.java.todo.dao.Dao;

public class ServletDoneTodo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String id = req.getParameter("id");
		Dao.INSTANCE.makeDone(Long.parseLong(id));
		resp.sendRedirect("/TodoApplication.jsp");
	}
}
