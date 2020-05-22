<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="MedicalStore.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <nav class="menu-navigation-round">
                <div class="menuCustom">
                <a href="Home.aspx"  accesskey="1" >Home</a>
                <a href="Medicine.aspx" accesskey="2">Medicines</a>
                <a href="Employee.aspx" accesskey="3">Employees</a>
                <a href="Purchase.aspx" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" accesskey="5">Dealers</a>
                <a href="About.aspx" class="selected" accesskey="6">About Us</a>
            </div>
            </nav>
    <div style="padding-top:5%;">
        <div style="color: #38c0e5;  text-align: center;" class="whitepanel aboutpanel">
            <p>PHOENIX PHARMACY IS AN INNOVATIONAL IDEA OF WEB BASED DATABASE INTERNATIONAL PROJECT. IT INCLUDES SOLUTION OF EVERY KIND OF MAJOR AND MINOR ISSUES.THIS PROJECT INCLUDE PARTICIPATION OF BELOW MEMBER:: </p>
            <p>1. SALMAN LAYEK  (L16-4348)  </p>
            <p></p>
            <p></p>
            <p>FOR ANY QUERIES AND SUGGESTIONS, KINDLY CONTACT US AT "PHOENIX@GMAIL.COM" </p>
            <p></p>
            <p></p>
        </div>
        </div>
</asp:Content>
