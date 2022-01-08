<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("id");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "crud";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        String sql = "select * from korisnici where id=" + id;
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
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
        margin-top: 5px;
        margin-bottom: 5px;
    }
</style>
<html>
    <body>

        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#news">News</a></li>
            <li><a href="#contact">Contact</a></li>
            <li style="float:right"><a class="active" href="#about">About</a></li>
        </ul>

        <h1>Update data</h1>
        <form method="post">
            <input type="hidden" name="id" value="<%=resultSet.getString("id")%>">
            <input type="text" name="id" value="<%=resultSet.getString("id")%>">
            <br>
            Username:<br>
            <input type="text" name="username" value="<%=resultSet.getString("username")%>">
            <br>
            Password:<br>
            <input type="text" name="password" value="<%=resultSet.getString("password")%>">
            <br>
            Email:<br>
            <input type="text" name="mejl" value="<%=resultSet.getString("mejl")%>">
            <br>
            <input type="submit" value="submit">
        </form>
        <%
                    String username = request.getParameter("username");
                    String pass = request.getParameter("password");
                    String mejl = request.getParameter("mejl");
                    int idFinal = Integer.valueOf(request.getParameter("id"));

                    if (username != null) {
                        out.println(username);
                        out.println(pass);
                        out.println(mejl);

                        try {
                            //stmt.executeQuery("insert into `korisnici`(`username`,`password`,`mejl`) values ('b','b','b')");
                            statement.execute("UPDATE `korisnici` SET `username`=" + "'" + username + "'"
                                    + ",`password`=" + "'" + pass + "'" + ",`mejl`="
                                    + "'" + mejl + "'" + " WHERE id=" + "'" + idFinal + "'");

                            out.println("Successfuly changed");
                        } catch (Exception e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                    }

                }
                // connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>