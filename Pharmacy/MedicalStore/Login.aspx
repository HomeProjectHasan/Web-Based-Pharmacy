<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MedicalStore.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body onkeydown = "return (event.keyCode!=13)">
       <div style="padding-bottom:300px;padding-top:200px;">
          <div class="whitepanel login">
            <table id="table1" align="center">
                <tr>
                    <td>Username:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="password" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="div" style="padding-right: 7px; height: 15px;">
                            <asp:Button runat="server" ID="button1" Text="Login" Height="30px" Width="70px" Style="margin-top: 5px;" class="buttonBorderSmall" OnClick="button1_Click1" />
                            <asp:Button ID="Button2" runat="server" PostBackUrl="~/Signup.aspx" Height="30px" Width="70px" Style="margin-left: 10px;" Text="Sign Up" class="buttonBorderSmall" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <asp:Label ID="Label1" runat="server" Style="color: black" Text=""></asp:Label>
                </tr>
            </table>
          </div>
        </div>          
    </body>
</asp:Content>
