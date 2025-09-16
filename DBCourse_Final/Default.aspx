<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DBCourse_Final._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Database Course Website</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <section class="food-search text-center">
            <div class="container">
                <form action="food-search.html" method="POST">
                    <input type="search" name="search" placeholder="Search for Food.." required>
                    <input type="submit" name="submit" value="Search" class="btn btn-primary">
                </form>
            </div>
        </section>
        <section class="categories">
            <div class="container">
                <h2 class="text-center">--- 美食類別 ---</h2>
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
        <section class="food-menu">
            <div class="container">
                <h2 class="text-center">--- 推薦美食 ---</h2>
                <asp:Repeater ID="foodRep" runat="server">
                    <ItemTemplate>
                        <div class="food-menu-box">
                            <div class="food-menu-img">
                                <img src="images/<%#Eval("category") %>.jpg" alt="Chicke Hawain Pizza" class="img-responsive img-curve">
                            </div>
                            <div class="food-menu-desc">
                                <h4><%#Eval("name") %></h4>
                                <p class="food-price">$ <%#Eval("price") %></p>
                                <p class="food-detail"><%#Eval("ingredients") %></p>
                                <br>
                                <button value="<%#Eval("id") %>" onclick="addClickCount_Click">Order Now</button>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="clearfix"></div>
            </div>
            <p class="text-center">
                <a href="#">See All Foods</a>
            </p>
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
