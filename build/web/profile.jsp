<%-- 
    Document   : profile
    Created on : 20-Oct-2022, 12:23:36 pm
    Author     : mohit
--%>
<%@page import="org.apache.catalina.webresources.Cache"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.magicofbooks.helper.ConnectionProvider"%>
<%@page import="com.magicofbooks.dao.PostDao"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.magicofbooks.entities.*" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>



        <!--navbar..................-->

        <nav class="navbar navbar-expand-lg navbar-dark  bg-dark">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-book"> </span> Magic Of Books</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-paper-plane-o"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-plus-square-o"></span> Add Book</a>
                    </li>



                </ul>
                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user"></span> <%=user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span>Logout</a>
                    </li>

                </ul>
            </div>
        </nav>





        <!--end of navbar.....-->



        <!--message modal..................-->
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {%>
        <div class="alert <%= m.getCssClass()%> alert-dismissible fade show" role="alert">
            <%= m.getContent()%>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>


        <%
                session.removeAttribute("msg");
            }
        %>

        <!--end...............-->


        <!--main body of the page-->

        <main>
            <div class="container">
                <div class="row mt-4">

                    <!--first col-->

                    <div class="col-md-4">
                        <!--categories-->

                        <div class="list-group">
                            <a href="#" onclick="getPosts(0)" class="list-group-item list-group-item-action primary-background text-white">
                                All Posts
                            </a>
                            
                            <!--categories-->
                            
                            <%
                                PostDao d= new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1= d.getAllCategories();
                                
                                for(Category cc:list1)
                                {
                                %>
                                <a href="#" class="list-group-item list-group-item-action"><%= cc.getName()%></a>
                                <%
                            }

                                
                            %>
                            
                            
                            
                            
                            
                            
                        </div>


                    </div>

                    <!--second col-->

                    <div class="col-md-8">

                        <!--posts-->
                        
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        
                        <div class="container-fluid" id="post-container">
                            
                        </div>



                    </div>



                </div>

            </div>

        </main>



        <!--end main body of the page-->





        <!--start of profilee modal--

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"><span class="fa fa-desktop display-5 ">  Tech Toolbox</span></h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" style="border-radius: 50%; max-width: 150px" class="img-fluid">
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--printing details...............-->
                            <div id="profile-details">

                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">E-mail:</th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%=user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status:</th>
                                            <td><%=user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on:</th>
                                            <td><%=user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>



                                <!--end of details-->   
                            </div>




                            <!--profile edit............-->

                            <div id="profile-edit" style="display:none">

                                <h3 class="mt-2">Please Edit Carefully</h3>   
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID:</td>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <td>E-mail:</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"> </td>

                                        </tr>
                                        <tr>
                                            <td>Name:</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"> </td>

                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"> </td>

                                        </tr>
                                        <tr>
                                            <td>Gender:</td>
                                            <td><%= user.getGender().toUpperCase()%> </td>

                                        </tr>
                                        <tr>
                                            <td>About:</td>
                                            <td><textarea row="3"class="form-control" name="user_about" ><%= user.getAbout()%></textarea></td>

                                        </tr>
                                        <tr>
                                            <td>New DP:</td>
                                            <td><input type="file" name="image" class="form-control" ></td>

                                        </tr>

                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-success">Save</button>
                                    </div>
                                </form>
                            </div>                


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-outline-success">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of profile modal-->


        <!--post modallll..................-->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Create a Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="AddPostServlet" method="POST" id="add-post-form">


                            <div class="form-group" >
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();

                                        for (Category c : list) {

                                    %>
                                    <option value="<%=c.getCid()%>"><%= c.getName()%></option>
                                    <% }%>
                                </select>
                            </div>

                            <div class="form-group">

                                <input type="text" name="pTitle" placeholder="Enter Post Title" class="form-control"/>


                            </div>
                            <div class="form-group">

                                <textarea class="form-control" name="pContent" style="height: 100px;" placeholder="enter your content..."></textarea>
                            </div>

                            <div class="form-group">

                                <textarea class="form-control" name="pCode" style="height: 100px;" placeholder="enter your program (if any)..."></textarea>

                            </div>
                            <div class="form-group">

                                <label><i>Select image</i></label><br>

                                <input type="file" name="pic">
                            </div>
                            <div class="container text-center">
                                <button id="btn-submitt"type="submit" class="btn btn-outline-success" ><span class="fa fa-hand-pointer-o"> POST</span></button>
                            </div>


                        </form>



                    </div>

                </div>
            </div>
        </div>


        <!--end of post modal.........................-->


        <!--saaaari ki saaari scripts...............-->
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {

                let editStatus = false;

                $('#edit-profile-button').click(function () {
//                   alert("button clcked...");
                    if (editStatus == false)
                    {
                        $('#profile-details').hide()
                        $('#profile-edit').show();
                        editStatus = true;
                        $(this).text("Back")
                    } else
                    {
                        $('#profile-details').show()
                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("Edit")
                    }
                });
            });
        </script>





        <!--add post jd--> 


        <script>

            $(document).ready(function () {
                console.log("ready");

                $("#add-post-form").on("submit", function (event) {


                    //when form gets submitted.....

                    event.preventDefault();
                    console.log("clicked on submitted...");
                    let form = new FormData(this);

//               requesting to server..............

                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {

                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Saved Successfully..", "success");
                            } else {
                                swal("Error!", "Something went wrong!!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!", "Something went wrong!!", "error");
                        },

                        processData: false,
                        contentType: false

                    });

                });
            });
        </script>



        
        <!--loading posts using ajax-->
        
        
        
        <script>
            
          $(document).ready(function (e){
              
              $.ajax({
                  
                 url: "load_posts.jsp" ,
                 success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        
                        $("#loader").hide();
                        $("#post-container").html(data);
                    }
                  
              })
              
          });
            
            </script>

    </body>
</html>
