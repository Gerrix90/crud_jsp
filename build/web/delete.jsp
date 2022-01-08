<%-- 
    Document   : delete
    Created on : Apr 9, 2019, 2:06:12 AM
    Author     : Air-AppDev-02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.util.*"%>

<style>

    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #333;
        margin-bottom: 30px;
    }

    li {
        float: left;
    }

    li a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    li a:hover:not(.active) {
        background-color: #111;
    }

    .active {
        background-color: #4CAF50;
    }

    table {
        background: #FFFF99;
        margin-top: 30px;
    }

    .headClass {
        background: #CCCC00;
    }
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
    input {
        margin-top: 5px;
        margin-bottom: 5px;
    }
</style>

<ul>
    <li><a href="index.jsp">Home</a></li>
    <li><a href="#news">News</a></li>
    <li><a href="#contact">Contact</a></li>
    <li style="float:right"><a class="active" href="#about">About</a></li>
</ul>
<%
    String id = request.getParameter("id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "");
        Statement st = conn.createStatement();
        int i = st.executeUpdate("DELETE FROM korisnici WHERE id=" + id);
        out.println("Data Deleted Successfully!");
%>
<a href="index.jsp">Go to Home</a>
<%
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>
