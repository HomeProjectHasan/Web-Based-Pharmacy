<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="MedicalStore.Employ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <nav class="menu-navigation-round">
                <div class="menuCustom">
                <a href="Home.aspx"  accesskey="1" >Home</a>
                <a href="Medicine.aspx" accesskey="2">Medicines</a>
                <a href="Employee.aspx"  class="selected"  accesskey="3">Employees</a>
                <a href="Purchase.aspx" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>
            </nav>
    <br>
    <br>
     <div style="font-size: large; padding-left:40%;">
         <asp:Button ID="Button1" runat="server" class="buttonBorder"  Font-Size="Large" Height="40px" Width="200px" Text="Show All Employees" OnClick="Button1_Click" />
    </div>
    <br>
    <br>
    <div class="whitepanel employpanel">
        <div class="row">
            <div class="col-6 pl-4 pr-0">
                Find Employee by Selecting Employee ID  :
            </div>
            <div class="col-3 pl-0">
                <asp:TextBox ID="Employbyid" runat="server"></asp:TextBox>
            </div>
            <div class="col-3  pr-4">
                <asp:Button ID="Button2" Text="Submit" runat="server" class="buttonBorderSmall" Font-Size="Large" Height="30px" Width="80px" OnClick="Button2_Click" />
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-6 pl-4 pr-0">
                Find Employee by Entering Employee Name :
            </div>
            <div class="col-3 pl-0">
                <asp:TextBox ID="Employbyname" runat="server"></asp:TextBox>
            </div>
            <div class="col-3 pr-4">
                <asp:Button ID="Button3" Text="Submit" runat="server" class="buttonBorderSmall" Font-Size="Large" Height="30px" Width="80px" OnClick="Button3_Click" /></td>
            </div>
        </div>
    </div>        
</asp:Content>

