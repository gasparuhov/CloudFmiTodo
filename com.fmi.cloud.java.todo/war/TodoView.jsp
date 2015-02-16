<%@page import="com.fmi.cloud.java.todo.model.Todo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fmi.cloud.java.todo.dao.Dao"%>
<%@ page import="java.lang.String"%>
<%@ page import="java.lang.Long"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>View/Edit Todo</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<meta charset="utf-8">
</head>
<body>
	<%
		Dao dao = Dao.INSTANCE;
		String idStr = request.getParameter("id");
		if (idStr.isEmpty()) {
			response.sendRedirect("/TodoApplication.jsp");
		}
		long id = Long.parseLong(idStr);
		Todo todo = dao.getTodo(id);
		if (todo == null) {
	%>
	<script type="text/javascript">
		alert("Unable to retrieve todo")
	</script>
	<%
		response.sendRedirect("/TodoApplication.jsp");
		}
	%>
	<div class="main">

		<div class="headline">View/Edit todo</div>

		<form action="/update?id=<%=todo.getId() %>" method="post" accept-charset="utf-8">
			<table>
				<tr>
					<td><label for="summary">Summary</label></td>
					<td><input type="text" name="summary" id="summary" size="65"
						value="<%=todo.getShortDescription()%>" /></td>
				</tr>
				<tr>
					<td valign="description"><label for="description">Description</label></td>
					<td><textarea rows="4" cols="50" name="description"
							id="description"><%=todo.getLongDescription()%></textarea></td>
				</tr>
				<tr>
					<td valign="top"><label for="url">URL</label></td>
					<td><input type="url" name="url" id="url" size="65"
						value="<%=todo.getUrl()%>"></td>
				</tr>
				<tr>
					<td colspan="1" align="left"><a href="/TodoApplication.jsp">
							<input type="button" value="Cancel"></input>
					</a></td>
					<td colspan="1" align="right"><input type="submit"
						value="Save" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>