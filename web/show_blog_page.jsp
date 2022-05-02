
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage= "error_page.jsp"%>  

<% 
User user=(User)session.getAttribute("currentUser");
if(user==null){
    response.sendRedirect("login.jsp");
}

%> 

<% 
   int PostId=Integer.parseInt(request.getParameter("post_id"));
   PostDao d=new PostDao(ConnectionProvider.getConnection());
   
   Post p=d.getPostByPostId(PostId);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle() %> || Techblog</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
        <div id="fb-root"></div>
            <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v13.0" nonce="xBswb4WQ"></script></head>
                
    <body>
          <!--//Navbar-->
      
      
          <nav class="navbar navbar-expand-lg navbar-light primary-background">
                <a href="index.jsp" class="navbar-brand" href="#"> <span class="fa fa-asterisk"></span> TechBlog</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
              </li>

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#">Programming</a>
                  <a class="dropdown-item" href="#">Projects</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">DSA</a>
                </div>
                  <li class="nav-item">
                  <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact</a>
                </li>
              <li class="nav-item">
                  <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-bell-o"></span> Do Post</a>
              </li>
            </ul>
              <ul class="navbar-nav mr-right">
                   <li class="nav-item">
                      <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle "><%= user.getName() %> </span></a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"> LogOut</span></a>
                  </li>

              </ul>
          </div>
        </nav>
          <!--//end of navbar-->
       
         <!--main content of body-->
         
         <div class="container">
             <div class="row my-4">
                 <div class="col-md-8 offset-md-2">
                    <div class="card">
                         <div class="card-header primary-background">
                             <h4><%=p.getpTitle() %></h4>
                         </div>
                    </div>
                    <div class="card-body">
                         <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
                    </div>
                    <div class="card-body">
                       
                        <p><%=p.getpContent() %></p>
                        <br>
                        <br>
                        <pre><%=p.getpCode()%></pre>
                    </div>
                    <div class="card-footer primary-background">
                        
                         <% 
                          LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                         %>
                       <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%> )" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
                       <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span></span></a>       
                    
                    </div>
                       <div class="card-footer">
                       
                           <div class="fb-comments" data-href="http://localhost:9494/TechBlog/show_blog_page.jsp?post_id=<%=p.getPid() %>" data-width="" data-numposts="5"></div>                       
                       </div>                           

                </div>
             </div>
         </div>
         
         <!--end of main content of body-->
        
        
          <!--Modal-->
          
          
          <!-- Button trigger modal -->


       <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header primary-background text-white">
                <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>       <!-- Modal -->

              <div class="modal-body">
                  <div class="container text-center">
                      <img src="pics/<%=user.getProfile()%>" class="img-fluid"style="border-radius:50%; max-width: 100px" alt="....">
                     
                        <h3 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName() %></h3>
                        
                        <!--Details-->
                        <div id="profile-detail">
                            
                           <table class="table">
                           
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row">ID</th>
                                <td><%=user.getId() %></td>
                               
                              </tr>
                              <tr>
                                <th scope="row">Email</th>
                                <td><%= user.getEmail() %></td>
                                
                              <tr>
                                <th scope="row">About</th>
                                <td>Hello I Am programmer</td>
                                 <tr>
                                <th scope="row">Registered Date</th>
                                <td><%= user.getDateTime() %></td>
                                
                              <tr>
                              
                            </tbody>
                          </table> 
                        </div>
                                
                        <!--Profile edit-->
                        
                        <div id="profile-edit"style="display: none">
                            <br>
                            <h5>Edit Here</h5>
                            <form action="EditServlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID:</td>
                                        <td><%=user.getId() %></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><input type="email"class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>

                                    </tr>
                                     <tr>
                                        <td>Name:</td>
                                        <td><input type="text"class="form-control" name="user_name" value="<%= user.getName() %>"></td>

                                    </tr>
                                     <tr>
                                        <td>Password:</td>
                                        <td><input type="password"class="form-control" name="user_password" value="<%= user.getPassword() %>" autocomplete="on"></td>

                                    </tr>
                                     <tr>
                                        <td>Profile:</td>
                                        <td><input type="file"class="form-control" name="image" ></td>

                                    </tr>
                                </table>
                                        <div class="container">
                                            <button type="submit" class="btn btn-outline-primary">Save</button>
                                        </div>
                            </form>
                            
                        </div>
                        
                  </div>
                ...
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
              </div>
            </div>
          </div>
        </div>      
          
         <!--End of profile modal-->
         
           <!--add post modal-->
       
        <!-- Modal -->

            <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the Post Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    
                      <form id="add-post-form" action="AddPostServlet" method="POST">
                          
                          
                              
                                  <option selected disabled >....Select Categories...</option>
                                  <% 
                                    PostDao postd=new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<category> list= postd.getAllCategories();   
                                    for(category c :list){
                                    %>
                                     <option value="<%= c.getCid() %>" ><%= c.getName()%></option>
                                    <%
                                    }
                                  
                                  %>
                               
                          
                          <br>
                          <div class="form-group">
                              <input name="pTitle"type="text" placeholder="Post title"class="form-control">
                          </div>
                          <div class="form-group">
                              <textarea name="pContent" class="form-control" style="height:160px;" placeholder="Enter your content"></textarea>
                          </div>
                          <div class="form-group">
                              <textarea name="pCode" class="form-control" style="height:120px;" placeholder="Enter your program(if any)"></textarea>
                          </div>
                          <div class="form-group">
                              <label>Select your pic</label>
                              <br>
                              <input name="pPic" type="file">
                          </div>
                              
                          <div class="container text-center">
                              <button  type="submit" class="btn-btn-outline-primary"> Post</button>
                          </div>
                      </form>
                      
                  </div>
                 
                </div>
              </div>
            </div>

         <!--end post modal-->
         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
         <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--<script src="js/myjs.js" type="text/javascript"></script>-->
        
        
        <script>
            $(document).ready(function(){
                let editStatus=false;
                
                $('#edit-profile-button').click(function(){
//                    alert("button clicked");

                 if(editStatus === false){
                     $("#profile-detail").hide();
                     $("#profile-edit").show();
                     editStatus=true;
                     $(this).text("Back");
                 }else{
                      $("#profile-detail").show();
                      $("#profile-edit").hide();
                      editStatus=false;
                      $(this).text("Edit");
                 }     
                });
            });
        </script>
        
        <!--now add post js-->
        <script>
            $(document).ready(function (e){
                
                //
              $("#add-post-form").on("submit",function(event){
                  //codes get called when form is submitted
                  event.preventDefault();  //stop the flow of synchronous flow of data....
                  
                  console.log("Submission is started");
                  let form=new FormData(this);
                  
                  //now requesting to server
                  $.ajax({
                      url:"AddPostServlet",
                      type:"POST",
                      data:form,
                      success:function(data,textStatus,jqXHR){
                      console.log(data);
                      if(data.trim()==='done'){
                        swal("Good job!", "Saved Successfully!!", "success");  //sweet alert plugin used to render success or error...
                      }else{
                          swal("Error", "Something went wrong try again !!", "error");

                      }
                      
                      },
                      error:function(jqXHR,textStatus,errorThrown){
                          console.log("Error");
                          swal("Error", "Something went wrong try again !!", "error");
                       //async error...   
                      },
                      processData:false,
                      contentType:false
                      
                  });
              });                   
            });
        </script> 
        <script>
            function doLike(pid,uid){
                console.log(pid+ " "+uid);

                    const d={
                        uid:uid,
                        pid:pid,
                        operation:'like'
                    };
                    $.ajax({
                        url:"LikeServlet",
                        data:d,
                        success: function(data,textStatus,jQXHR){
                            console.log(data);
                            if(data.trim()==='true'){
                                let c= $(".like-counter").html();
                                c++;
                                $('.like-counter').html(c);
                            }
                            
                        },
                        error: function(jQXHR,textStatus,errorThrown){
                            console.log(data);
                        }
                    });
            }             

        </script>
        
        
    </body>
</html>
