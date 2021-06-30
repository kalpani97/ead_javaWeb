<%-- 
    Document   : CheckDoc1
    Created on : Jun 1, 2021, 6:13:33 PM
    Author     : kalpani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Search</title>
        <style>
            body {
                background-image: url("img/doc18.jpg");
                background-color: #cccccc;
            }
        </style>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style1.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <form class="form-inline" method="post" action="search.jsp">
                <center>
                    <h3></br>SEARCH THE DATE AND YOUR ID</h3></br>
                    <input type="date" name="day" class="form-control" placeholder="Search the date..">
                    <input type="text" name="id" class="form-control" placeholder="YOUR ID..">
                    <button type="submit" name="save" class="btn btn-primary">Search</button></center>


            </form>
            
            
        </div>
        
<p><ul>   <li><a href="index.html">HOME</a></li></UL></p>
    </body>
</html>