<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Medicine.aspx.cs" Inherits="MedicalStore.Medicine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 111px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

             <nav class="menu-navigation-round">
                <div class="menuCustom">
                <a href="Home.aspx"  accesskey="1" >Home</a>
                <a href="Medicine.aspx"  class="selected" accesskey="2">Medicines</a>
                <a href="Employee.aspx"   accesskey="3">Employees</a>
                <a href="Purchase.aspx" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>
            </nav>
    <br>
    <br>
     <div style="font-size: large; padding-left:40%;">
         <asp:Button ID="AllMedicine" runat="server" class="buttonBorder"  Font-Size="Large" Text="Show All Medicines" Height="40px" Width="180px" OnClick="All_Click" />
                &nbsp;
                <asp:Button ID="OutOfStock" runat="server" class="buttonBorder"  Font-Size="Large" Text="Show Out Of Stock" Height="40px" Width="180px" OnClick="OutOfStock_Click" />
                &nbsp;
                <asp:Button ID="Expired" runat="server" class="buttonBorder"  Font-Size="Large" Text="Show All Expired" Height="40px" Width="180px" OnClick="Expired_Click" />
          
    </div>
    <br>
    <br>
    <div class="whitepanel employpanel">
        <div class="row">
            <div class="col-6 pl-4 pr-0">
                Find Medicine by Selecting Medicine ID :
            </div>
            <div class="col-3 pl-0">
               <asp:TextBox ID="Pricebyid" runat="server"></asp:TextBox>
            </div>
            <div class="col-3  pr-4">
                <asp:Button ID="Button2" Text="Search" runat="server" class="buttonBorderSmall" Font-Size="Large" Height="30px" Width="80px" OnClick="Button4_Click" />
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-6 pl-4 pr-0">
                Find Medicine by Entering Medicine Name :
            </div>
            <div class="col-3 pl-0">
                       <asp:TextBox ID="Expirybyid" runat="server"></asp:TextBox>
            </div>
            <div class="col-3 pr-4">
                <asp:Button ID="Button3" Text="Search" runat="server" class="buttonBorderSmall" Font-Size="Large" Height="30px" Width="80px" OnClick="Button5_Click" />
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-6 pl-4 pr-0">
                Medicine sell history :
            </div>
            <div class="col-3 pl-0">
                       <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
            <div class="col-3 pr-4">
                <asp:Button ID="Button1" Text="Show" runat="server" class="buttonBorderSmall" Font-Size="Large" Height="30px" Width="80px" OnClick="Button5_Click" />
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-6 pl-4 pr-0">
               Medicine purchase history :
            </div>
            <div class="col-3 pl-0">
                       <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
            <div class="col-3 pr-4">
                <asp:Button ID="Button4" Text="Show" runat="server" class="buttonBorderSmall" Font-Size="Large" Height="30px" Width="80px" OnClick="Button5_Click" />
            </div>
        </div>
    </div>        

</asp:Content>
