<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MedicalStore.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <body onkeydown = "return (event.keyCode!=13)">
        <div style="padding-top:10px;">
        </div>
            <div style="padding-bottom:300px;padding-top:200px;">

        <div class="whitepanel login">
            <div class="div" style="color: black">
                Username&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Style="margin-left: 0px"></asp:TextBox>
            </div>
            <div class="div" style="color: black">
                Password&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPassword" TextMode="password" runat="server" Style="margin-left: 0px"></asp:TextBox>
            </div>
            <div class="div" style="padding-left: 27px; padding-right: 7px; height: 15px;">
                <asp:Button runat="server" ID="button1" Text="Login" Height="30px" Width="70px" Style="margin-top:5px; margin-left:50px;" class="buttonBorderSmall" OnClick="button1_Click1" />
                <asp:Button ID="Button2" runat="server" PostBackUrl="~/Signup.aspx" Height="30px" Width="70px" Style="margin-left:10px;" Text="Sign Up" class="buttonBorderSmall"/>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" style="color: black" Text=""></asp:Label>
            </div>
        </div>
            </div>
    </body>

</asp:Content>
