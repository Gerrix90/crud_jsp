<%-- 
    Document   : index
    Created on : Apr 8, 2019, 8:00:29 PM
    Author     : Air-AppDev-02
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="example.Controller"%>
<%@page import="example.Person"%>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
        margin: 5px;
    }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../newcss.css" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>

        <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="#news">News</a></li>
            <li><a href="#contact">Contact</a></li>
            <li style="float:right"><a class="active" href="#about">About</a></li>
        </ul>

        <form action="index.jsp" method="post">

            Username :<input type="text" name="username" required/>
            Password :<input type="text" name="password" required/>
            Email :<input type="text" name="mejl" required/>
            <input type="submit" value="Submit"/>

        </form>


        <%

            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "");
            Statement st = con.createStatement();

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String mejl = request.getParameter("mejl");

            if (username != null) {
                out.println(username);
                out.println(password);
                out.println(mejl);

                try {
                    //stmt.executeQuery("insert into `korisnici`(`username`,`password`,`mejl`) values ('b','b','b')");
                    st.execute("INSERT INTO `korisnici`("
                            + "`username`,`password`,`mejl`) VALUES ('"
                            + username + "','" + password + "','"
                            + mejl + "')");

                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }

            ResultSet rs = st.executeQuery("SELECT * FROM `korisnici`");
            ArrayList users = new ArrayList<Person>();

            while (rs.next()) {
                users.add(new Person(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("mejl"),
                        Integer.valueOf(rs.getString("id"))
                ));

            }
        %>

        <table style="width:50%" id="thetable">
            <tr class="headClass">
                <th>ID</th>
                <th >Username</th>
                <th >Password</th> 
                <th >Email</th>
                <th >Edit</th>
                <th >Delete</th>
            </tr>


            <%
                for (int idx = 0; idx < users.size(); idx++) {
                    Person person = (Person) users.get(idx);

                    out.println("<tr>");
                    out.println("<td>" + person.getId() + "</td>");
                    out.println("<td >" + person.getUsername() + "</td>");
                    out.println("<td >" + person.getPassword() + "</td>");
                    out.println("<td >" + person.getMejl() + "</td>");
            %>
            <td><a href="update.jsp?id=<%=person.getId()%>">update</a></td>
            <td><a href="delete.jsp?id=<%=person.getId()%>"><button type="button" class="delete">Delete</button></a></td>
            <%
                    out.println("<tr>");

                }
            %>
        </table>
    </body>
</html>
