package com.fmi.cloud.java.todo;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fmi.cloud.java.todo.dao.Dao;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class ServletUpdateTodo extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		System.out.println("Updating todo");

		long id = Long.parseLong(checkNull(req.getParameter("id")));
		String summary = checkNull(req.getParameter("summary"));
		String description = checkNull(req.getParameter("description"));
		String url = checkNull(req.getParameter("url"));
		boolean finished = Boolean.parseBoolean(checkNull(req.getParameter("finished")));

		Dao.INSTANCE.update(id, summary, description, url, finished);

		resp.sendRedirect("/TodoApplication.jsp");
	}

	private String checkNull(String s) {
		if (s == null) {
			return "";
		}
		return s;
	}
}