<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Employ.aspx.cs" Inherits="MedicalStore.Employ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body onkeydown="return (event.keyCode!=13)">
        <nav class="menu-navigation-round">
                <div class="menuCustom">
                <a href="Home.aspx"  accesskey="1" >Home</a>
                <a href="Medicine.aspx" accesskey="2">Medicines</a>
                <a href="Employ.aspx"  class="selected"  accesskey="3">Employees</a>
                <a href="Purchase.aspx" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>
            </nav>
  
    
     <p>
     <div style="font-size: large; padding-left:60%;">
    <asp:Button ID="Button1" runat="server" class="buttonBorder"  Font-Size="Large" Height="40px" Width="200px" Text="Show All Employees" OnClick="Button1_Click" />
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
</asp:Content>

