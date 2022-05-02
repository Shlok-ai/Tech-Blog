<%-- 
    Document   : login
    Created on : 24-Feb-2022, 11:41:44 pm
    Author     : ASUS
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    </head>
    
    </head>
     <body>
            <%@include file="navbar.jsp" %>
            
            <main class=" d-flex align-item-center primary-background p-5 d-flex align items-center" style="height:90vh">
               
                <div class="container">
                            <div class="jumbotron col-md-4 " style="margin-left: 330px">
                                <div class="text-center">
                                    <span class="fa fa-3x fa fa-user-plus  "> </span>
                                     <h3>Login Here</h3>
                                </div>
                              <br>
                             <% 
                                Message m=(Message) session.getAttribute("msg");
                                if(m!=null){
                             %>
                             <div class="alert <%=m.getCssClass() %>" role="alert">
                                 
                                <%= m.getContent() %>
                                
                             </div>
                             
                             <%
                                 session.removeAttribute("msg");
                                }
                             %>
                              
                              
                              
                        <form action="loginServlet" method="post">
                       <div class="form-group">
                        <label for="email">Email address:</label>
                        <input name="email" required type="email" class="form-control" id="email">
                      </div>
                      <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input name="password" required type="current-password" class="form-control" id="pwd">
                      </div>
                     
                            <div class="container text-center">
                               <button type="submit" class="btn btn-primary">Submit</button> 
                            </div>
                      
                     </form>   
                      </div>
                    
               
             </div>
            </main>
            
             
            
            
            

            <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--            <script src="js/myjs.js" type="text/javascript"></script>-->
     </body>
</html>
