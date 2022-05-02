<%-- 
    Document   : error_page
    Created on : 11-Mar-2022, 6:12:57 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%> <!--Runs automatically when error is detected-->


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Sorry something went wrong!!</title>
        
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    </head>
    
     
    </head>
    <body>
        <div class="container text-center" >
            <img src="img/computer.png" class="img-fluid rounded mx-auto d-block" alt="..." Width-50%> 
            <h2 class="display-4">Sorry!!Something went wrong</h2>
            <%= exception%>
            <a href="index.jsp" class="btn primary-background btn-lg text-white">Home</button></a>
        </div>
    </body>
</html>
