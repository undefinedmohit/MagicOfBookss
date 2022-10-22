<%-- 
    Document   : register_page
    Created on : 20-Oct-2022, 12:40:52 pm
    Author     : mohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>Register Here</title>
    </head>
    <body>


        <%@include file="navbar.jsp" %>

        <!--signup page..............-->

        <main class="primary-background banner-backgroundd p-5 align-items-center" style="padding-bottom:40px">
            <div class="container">


                <div class="col-md-6 offset-3">

                    <div class="card">

                        <div class="card-header text-center primary-background text-white">
                            <span class="fa-3x fa fa-user-plus"></span>
                            <br>
                            Register here

                        </div>

                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">

                                <div class="form-group">
                                    <label for="user_name" >User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter your name">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br><!-- comment -->
                                    <input type="radio" name="gender" value="Male">Male

                                    <input type="radio" name="gender" value="Female">Female
                                </div>
                                <div class="form-group">
                                    <textarea name="about" class="form-control" rows="4" id="" placeholder="enter something about yourself..."></textarea>
                                </div>


                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms & conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style=" display: none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please Wait...</h4>
                                </div>
                                <button type="submit" id="submit-btn" class="btn btn-outline-success">Submit</button>
                                <br>
                                <br>

                            </form>

                        </div>

                    </div>
                </div>




            </div>
        </main>



        <!--javascripts.....................-->
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {

                console.log("loaded...");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    console.log("hello");
                    let form = new FormData(this);


                    $("#submit-btn").css("display", "none");
                    $("#loader").css("display", "block");
                    //send data.............

                    $.ajax({

                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {



                            $("#submit-btn").css("display", "block");
                            $("#loader").css("display", "none");

                            if (data.trim() === 'done') {

                                swal("congratulations, registered successfully", "Go to login page", "success")
                                        .then((value) => {
                                            window.location = "login.jsp"
                                        });
                            } else {
                                
                                swal(data);
                            }


                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            $("#submit-btn").css("display", "block");
                            $("#loader").css("display", "none");

                            swal("something went wrong... try again");

                        },
                        processData: false,
                        contentType: false

                    });
                });
            });
        </script>

    </body>
</html>
