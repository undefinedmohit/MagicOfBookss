<%-- 
    Document   : index
    Created on : 22-Oct-2022, 10:48:14 am
    Author     : mohit
--%>
<%@page import="com.magicofbooks.helper.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <title>Magic of books</title>
    </head>
    <body>

        <!--navbar.................................-->
        <%@include file="navbar.jsp" %>

        <!--banner..................-->

        <div class="container-fluid p-0 m-0">

            <div class="jumbotron primary-background banner-backgroundd text-white">
                <div class="container">
                    <h3 class="display-4">Welcome to Magic Of Books</h3>
                    <h3>Mohit Yadav, this side..</h3>
                    <p>Welcome to Magic of Books, A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output.</p>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.  </p>
                    <a href="register_page.jsp" class="btn btn-outline-success btn-lg"><span class="	fa fa-user-plus"></span> Start! it's free</a>
                    <a href="login.jsp" class="btn btn-outline-success btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login </a>
                </div>

            </div>

        </div>


        <!--card......................-->
        <div class="container">
            <div class="row mb-3">
                <div class="col-md-4">

                    <div class="card bg-dark text-white">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-success">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card bg-dark text-white">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-success">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card bg-dark text-white">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-success">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4">

                    <div class="card bg-dark text-white">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-success">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card bg-dark text-white">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-success">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <div class="card bg-dark text-white">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-outline-success">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



<!--java-scripts.........................-->
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
