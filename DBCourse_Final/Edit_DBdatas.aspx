<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_DBdatas.aspx.cs" Inherits="DBCourse_Final.Edit_DBdatas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit database</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            .row {
                margin-bottom: 15px;
            }

            .updatebtn {
                background-color: dimgray;
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
        <section class="food-menu">
            <h2 class="text-center">--- 編輯頁面 ---</h2>
            <asp:Repeater ID="foodRep" runat="server">
                <ItemTemplate>
                    <div class="col-md-6" style="margin-top: 2px;" id='<%#Eval("id") %>'>
                        <div class="input-group">
                            <div class="input-group-addon"><%#Eval("name") %></div>
                            <asp:TextBox ID="foodName" runat="server" class="form-control" Text='<%#Eval("name") %>' />
                            <asp:TextBox ID="foodIngredients" runat="server" class="form-control" Text='<%#Eval("ingredients") %>' />
                            <asp:TextBox ID="foodPrice" runat="server" class="form-control" Text='<%#Eval("price") %>' />
                        </div>
                        <div class="input-group">
                            <div class="input-group-addon">產品分類</div>
                            <asp:DropDownList ID="Category" runat="server" class="form-control">
                                <asp:ListItem Text="請選擇其中一種分類" Value="-1" />
                                <asp:ListItem Text="披薩" Value="1" />
                                <asp:ListItem Text="漢堡" Value="2" />
                                <asp:ListItem Text="甜點" Value="3" />
                            </asp:DropDownList>
                        </div>
                        <asp:Button class="updatebtn" ID="UpdateBtn" runat="server" Text="Update" CommandArgument='<%#Eval("id") %>' OnClick="UpdateBtn_Click" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="clearfix"></div>
        </section>
    </body>
    </html>
</asp:Content>
