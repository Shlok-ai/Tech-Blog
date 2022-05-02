<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
    <% 
        
        User u=(User)session.getAttribute("currentUser");
        
       Thread.sleep(1000);
    PostDao d =new PostDao(ConnectionProvider.getConnection());
    
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<Post> posts=null; 
    if(cid==0){
        posts=d.getAllPost();
    }else{
        posts=d.getPostByCatId(cid);
    }
    
    if(posts.size()==0){
        out.println("<h4 class='display-5 text-center'>No post yet...</h4>");
        return ;
    }
     for(Post p :posts){
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
                        
            <div class="card-body">
                <b><%=p.getpTitle()%> </b>
                
               <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">

                <p><%=p.getpContent()%></p>
                
            </div>
        </div>
            <div class="card-footer primary-background text-center">
                
                
                <% 
                LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                
                %>
                    
                     <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= u.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></a>
                    <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read more..</a>
                   
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span></span></a>
                    
            </div>
        </div>
                
      <%
         }
      %>
</div>
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
