<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="MedicalStore.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
        <div style="padding-bottom:100px;padding-top:40px;">

        <div class="whitepanel signup">
            <div class="div" style="color:black">
                Full Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>

            <div class="div" style="color: black">
                Contact No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>

            <div class="div" style="color: black; padding-right: 10px;">
                House Address&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </div>

            <div class="div" style="color: black">
                Designation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </div>

            <div class="div" style="color: black">
                Salary&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </div>

            <div class="div" style="color: black">
                Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </div>

            <div class="div" style="color: black">
                Password &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox8" TextMode="password" runat="server"></asp:TextBox>
            </div>

            <div class="div" style="color: black;">
                Confirm Password&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox9" TextMode="password" runat="server"></asp:TextBox>
            </div>

            <div class="div" style="color: black">
                Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </div>

            <div class="div" style="padding-left: 27px; padding-right: 7px; height: 15px;">
                <asp:Button runat="server" ID="button1" Text="Sign Up" Height="30px" Width="70px" Style="margin-top:5px; margin-left:50px;" class="buttonBorderSmall" OnClick="button2_Click" />              
                <asp:Button ID="Button2" runat="server" PostBackUrl="~/Login.aspx" Height="30px" Width="70px" Style="margin-left:10px;" Text="Exist User" class="buttonBorderSmall"/>
                &nbsp;&nbsp;&nbsp;
            <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" style="color: black" Text=""></asp:Label>
            </div>

        </div>
</asp:Content>
