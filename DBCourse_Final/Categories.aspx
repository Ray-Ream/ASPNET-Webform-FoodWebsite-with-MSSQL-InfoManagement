<%@ Page Title="Categories Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="DBCourse_Final.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <!-- Important to make website responsive -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Categories Page</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <!-- CAtegories Section Starts Here -->
        <section class="categories">
            <div class="container">
                <h2 class="text-center">Explore Foods</h2>
                <a href="Foods">
                    <div class="box-3 float-container">
                        <img src="images/pizza.jpg" alt="Pizza" class="img-responsive img-curve">

                        <h3 class="float-text text-white">披薩</h3>
                    </div>
                </a>
                <a href="Foods">
                    <div class="box-3 float-container">
                        <img src="images/burger.jpg" alt="Burger" class="img-responsive img-curve">

                        <h3 class="float-text text-white">漢堡</h3>
                    </div>
                </a>
                <a href="Foods">
                    <div class="box-3 float-container">
                        <img src="images/dessert.jpg" alt="Momo" class="img-responsive img-curve">

                        <h3 class="float-text text-white">甜點</h3>
                    </div>
                </a>
                <div class="clearfix"></div>
            </div>
        </section>
        <section class="social">
            <div class="container text-center">
                <ul>
                    <li>
                        <a href="#">
                            <img src="https://img.icons8.com/fluent/50/000000/facebook-new.png" /></a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="https://img.icons8.com/fluent/48/000000/instagram-new.png" /></a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="https://img.icons8.com/fluent/48/000000/twitter.png" /></a>
                    </li>
                </ul>
            </div>
        </section>
    </body>
    </html>
</asp:Content>
