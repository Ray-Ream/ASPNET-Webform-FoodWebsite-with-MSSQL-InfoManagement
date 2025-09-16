<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Foods.aspx.cs" Inherits="DBCourse_Final.Foods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Foods Page</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            .row {
                margin-bottom: 15px;
            }

            .reloadbtn {
                background-color: #e7e7e7;
                border: none;
                color: black;
                padding: 20px;
                font: bolder;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 1px 2px;
                cursor: pointer;
                border-radius: 12px;
            }

            .insertbtn:hover {
                background-color: #4CAF50;
                color: aliceblue;
            }

            .hidden {
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="container search">
            <div class="row">
                <div class="col-md-6">
                    <div class="input-group">
                        <div class="input-group-addon">產品分類</div>
                        <asp:DropDownList ID="Category" runat="server" class="form-control">
                            <asp:ListItem Text="請選擇其中一種分類" Value="-1" />
                            <asp:ListItem Text="披薩" Value="1" />
                            <asp:ListItem Text="漢堡" Value="2" />
                            <asp:ListItem Text="甜點" Value="3" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group">
                        <div class="input-group-addon">價格</div>
                        <asp:TextBox ID="Price_Down" runat="server" class="form-control" />
                        <asp:TextBox ID="Price_Top" runat="server" class="form-control" />
                    </div>
                </div>
                <asp:Button class="reloadbtn" ID="Button2" runat="server" Text="查詢" OnClick="reloadbtn_Click" />
            </div>
        </div>
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
                                <asp:Button ID="addClickCount" runat="server" Text="Order Now" CommandArgument='<%#Eval("id") %>' OnClick="addClickCount_Click1" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="clearfix"></div>
            </div>
        </section>
    </body>
    </html>
</asp:Content>
