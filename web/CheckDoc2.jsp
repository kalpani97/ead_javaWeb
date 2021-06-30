<%-- 
    Document   : CheckDoc2
    Created on : Jun 2, 2021, 2:25:03 PM
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
            <form class="form-inline" method="post" action="search2.jsp">
                <center>
                    <h3></br>SEARCH THE SPECIALTY</h3></br>
                    <select name="specialty"
                            <option value="NEURO">NEURO</option>
                        <option value="ENT">ENT</option>
                        <option value="GENERAL">GENARAL</option>
                        <option value="PEDS">PEDS</option>
                        <option value="CARDIO">CARDIO</option>
                        <option value="NEURO">NEURO</option>
                        <option value="ORTHO">ORTHO</option>
                    </select>
                    <input type="hidden" name="specialty" class="form-control" >
                    <button type="submit" name="save" class="btn btn-primary">Search</button></center>


            </form>


        </div>

        <p><ul>   <li><a href="index.html">HOME</a></li></UL></p>
</body>
</html>
