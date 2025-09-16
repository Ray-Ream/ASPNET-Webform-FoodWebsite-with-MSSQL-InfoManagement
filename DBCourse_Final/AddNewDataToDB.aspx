<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewDataToDB.aspx.cs" Inherits="DBCourse_Final.AddNewDataToDB" %>

<%@ Register Src="~/UC/AddDataToDB_UC.ascx" TagPrefix="uc1" TagName="AddDataToDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>

    <html>
    <head>
        <meta charset="UTF-8">
        <!-- Important to make website responsive -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Insert data Page</title>

        <link rel="stylesheet" href="css/style.css">

        <style>
            .row {
                margin-bottom: 15px;
            }

            .insertbtn {
                background-color: #e7e7e7;
                border: none;
                color: black;
                padding: 20px;
                font: bolder;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 12px;
            }

                .insertbtn:hover {
                    background-color: #4CAF50;
                    color: aliceblue;
                }
        </style>
    </head>

    <body>

        <div class="container search">
            <div class="row">
                <div class="col-sm-6">
                    <div class="input-group">
                        <div class="input-group-addon">產品名稱</div>
                        <asp:TextBox ID="Name" runat="server" class="form-control" />
                    </div>
                </div>

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
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="input-group">
                        <div class="input-group-addon">使用材料</div>
                        <asp:TextBox ID="Material" runat="server" class="form-control" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="input-group">
                        <div class="input-group-addon">產品價格</div>
                        <asp:TextBox ID="Price" runat="server" class="form-control" />
                    </div>
                </div>
            </div>

            <%--<div class="row">
                <div class="col-sm-6">
                    <div class="input-group datepicker">
                        <div class="input-group-addon info">起始日期</div>
                        <asp:TextBox class="form-control" ID="SDateTextBox" runat="server" Text=""></asp:TextBox>
                        <div class="input-group-btn">
                            <div class="btn btn-info">
                                <i class="glyphicon glyphicon-calendar"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="input-group datepicker">
                        <div class="input-group-addon info">截止日期</div>
                        <asp:TextBox class="form-control" ID="EDateTextBox" runat="server" Text=""></asp:TextBox>
                        <div class="input-group-btn">
                            <div class="btn btn-info">
                                <i class="glyphicon glyphicon-calendar"></i>
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
            </div>--%>
        </div>

        <div class="container">
            <asp:Button class="insertbtn" ID="insertbtn" runat="server" Text="新增" OnClick="insertbtn_Click" />
            <asp:Button class="insertbtn" ID="reset" runat="server" Text="重製" />
        </div>

    </body>

    </html>
</asp:Content>
