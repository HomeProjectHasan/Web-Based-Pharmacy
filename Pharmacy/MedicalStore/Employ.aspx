﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Employ.aspx.cs" Inherits="MedicalStore.Employ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body onkeydown="return (event.keyCode!=13)">
       <div style="font-size: large; padding-left:40%;">
                    <a href="Home.aspx" accesskey="1" title="" style="color: #d4fbff">Home</a> &nbsp;&nbsp;&nbsp; 
                <a href="Medicine.aspx" accesskey="2" title="" style="color: #d4fbff">Medicines</a> &nbsp;&nbsp;&nbsp;
                <a href="Employ.aspx" accesskey="3" title="" style="color: #d4fbff">Employees</a>
                        &nbsp;&nbsp;&nbsp;
                <a href="Purchase.aspx" accesskey="4" title="" style="color: #d4fbff">Purchase</a> &nbsp;&nbsp;&nbsp;
                <a href="Dealer.aspx" accesskey="5" title="" style="color: #d4fbff">Dealers</a>
                        &nbsp;&nbsp;&nbsp;
                <a href="About.aspx" accesskey="6" title="" style="color: #d4fbff">About Us</a> &nbsp;&nbsp;&nbsp;
                <a href="Frontpage.aspx" accesskey="7" title="" style="color: #d4fbff">Sign Out</a>
            </div>
   
    <br />
    <br />
    <br />
    
     <p>
     <div style="font-size: large; padding-left:60%;">
    <asp:Button ID="Button1" runat="server" Style="border: 2px solid white; padding-left: 10px; padding-right: 10px; border-radius: 8px; box-shadow: 0 10px 50px #d4fbff;" Font-Size="Larger" Font-Bold="true" Text="Show All Employees" Height="50px" Width="270px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" OnClick="Button1_Click" />
    </div>
         </p>
        <br />
        <br />
    <div style="padding-top:20px; padding-bottom:10%;">
                <div class="whitepanel employpanel">
           <table id="table1">
                
               <tr>
                   <td align="right">  Find Employee of Pharmacy by Entering Employee ID  :</td> 
                     <td>  
                         <asp:TextBox ID="Employbyid" runat="server"></asp:TextBox>
                   </td>
                  <td><asp:Button ID="Button2" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button2_Click" /></td>
               </tr>
               <tr>
                   <td align="right">Find Employee of Pharmacy by Entering Employee Name :  </td>
                   <td>
                       <asp:TextBox ID="Employbyname" runat="server"></asp:TextBox>
                   </td>
                   <td><asp:Button ID="Button3" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button3_Click" /></td>
               </tr>
               </table>
                    </div>
        
    </div>
        </body>
    <br />
    <br />
    <br />
    <br />
</asp:Content>

