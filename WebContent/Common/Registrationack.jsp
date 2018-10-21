<%@page import="java.sql.*,java.util.*"%>
<form>
	<table>
		<td><%=(String)session.getAttribute("user_id"); %></td>
		<td><%=(String)session.getAttribute("fname"); %></td>
		<td><%=(String)session.getAttribute("lname"); %></td>
		<td><%=(String)session.getAttribute("email"); %></td>
		<td><%=(String)session.getAttribute("contact"); %></td>
		<td><%=(String)session.getAttribute("user_type"); %></td>
		<td><%=(String)session.getAttribute("country_id"); %></td>
		<td><%=(String)session.getAttribute("state_id"); %></td>
		<td><%=(String)session.getAttribute("city_name"); %></td>
	</table>
</form>