<%-- 
    Document   : registrer
    Created on : 25-Feb-2022, 6:43:57 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    </head>
    
    </head>
    <body>
         <%@include file="navbar.jsp" %>
        <main class="primary-background p-5">
           
            
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card">
                        <div class="card-header text-center ">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register Here
                        </div>
                        <div class="card-body">
                          <form id="reg-form" action="RegisterServlet"method="POST">
                                <div class="mb-3">
                                  <label for="user_name" class="form-label">User Name</label>
                                  <input name="user_name" type="text" class="form-control" id="user_name" placeholder="user_name">
                                </div>
                                <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Email address</label>
                                  <input name="user_email"type="email" class="form-control" id="exampleInputEmail1" placeholder="email">
                                  <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3 form-check">
                                <div class="mb-3">
                                  <label for="exampleInputPassword1" class="form-label">Password</label>
                                  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="password" autocomplete="on">
                                </div>
                                    
                                  <input name="check"type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                </div>
                                 <br>
                                 <div class="text-center" id="loader"style="display:none">
                                      <span class="fa fa-refresh fa-spin fa-2x" ></span>
                                      <h4>Please Wait</h4>
                                 </div>
                                 
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                              </form> 
                            
                        </div>
                    </div>
                 </div
            </div>
       </main>
        
        
        
        
        
     <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src=https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js></script>
    <!--<script src="js/myjs.js" type="text/javascript"></script>-->
    
    <script>
        $(document).ready(function(){
            console.log("ready......");
            
            //Ajax based implementation using jquery
            
            $('#reg-form').on('submit',function(event){
                event.preventDefault();  //Stopping to go to the register servlet
             
                var form=$(this).serialize();
                
                $("#submit-btn").hide();
                $("#loader").show();
                
                
//                console.log(form)
                //Send data to register servlet
                $.ajax({
                    url:"RegisterServlet",
                    type:'POST',
                    data:form,
                   
                    success:function(data,textStatus,jqXHR){
                        console.log("Success....");
                          $("#submit-btn").show();
                          $("#loader").hide();
                          if(data.trim()==='done'){
                            swal("Registered Successfully.Redirecting to login page")
                              .then((value) => {
                                window.location="login.jsp";
                              });
                          }else{
                              swal(data);
                          }
                    },
                    error: function(jqXHR,textStatus,errorThrown)
                        {
                            $("#submit-btn").show();
                            $("#loader").hide();
                             swal("Something went wrong...Try again!!");
                    },
                    processData:false,
                    ContentType:false
                });
                
                
            }); 
        });
    </script>
    </body>
</html>
