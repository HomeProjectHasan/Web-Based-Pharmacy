<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Dealer.aspx.cs" Inherits="MedicalStore.Dealer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body onkeydown="return (event.keyCode!=13)">
        <nav class="menu-navigation-round">
                <div class="menuCustom">
                <a href="Home.aspx"  accesskey="1" >Home</a>
                <a href="Medicine.aspx" accesskey="2">Medicines</a>
                <a href="Employ.aspx" accesskey="3">Employees</a>
                <a href="Purchase.aspx" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" class="selected" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>
            </nav>
  
    <br />
    <br />
    <br />
             <div style="font-size: large; padding-left:38%;">
            <asp:Button ID="Button1" runat="server" Style="border: 2px solid white; padding-left: 10px; padding-right: 20px; border-radius: 8px; box-shadow: 0 10px 50px #d4fbff;" Font-Size="Larger" Font-Bold="true" Text="Show All Dealers" Height="30px" Width="200px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" OnClick="Button1_Click" />
                &nbsp;
                <asp:Button ID="Button2" runat="server" Style="border: 2px solid white; padding-left: 10px; padding-right: 20px; border-radius: 8px; box-shadow: 0 10px 50px #d4fbff;" Font-Size="Larger" Font-Bold="true" Text="Show All Companies" Height="30px" Width="230px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" OnClick="Button2_Click" />
                &nbsp;
                <asp:Button ID="Button3" runat="server" Style="border: 2px solid white; padding-left: 10px; padding-right: 20px; border-radius: 8px; box-shadow: 0 10px 50px #d4fbff;" Font-Size="Larger" Font-Bold="true" Text="Show All purchases" Height="30px" Width="230px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" OnClick="Button3_Click" />
                 &nbsp;
                <asp:Button ID="Button4" runat="server" Style="border: 2px solid white; padding-left: 10px; padding-right: 20px; border-radius: 8px; box-shadow: 0 10px 50px #d4fbff;" Font-Size="Larger" Font-Bold="true" Text="Show All Sales" Height="30px" Width="200px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" OnClick="Button4_Click" />
                 </div>
        <br />
        <br />
        <div style="padding-top:20px; padding-bottom:10%;">
                <div class="whitepanel dealerpanel1">
           <table id="table1">
                
               <tr>
                   <td align="right">Find Dealer of Pharmacy by Entering Dealer ID :</td> 
                     <td>  
                         <asp:TextBox ID="findDealerbyid" runat="server"></asp:TextBox>
                   </td>
                  <td><asp:Button ID="Button5" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button5_Click" /></td>
               </tr>
               <tr>
                   <td align="right"> Get The Dealer Name  By Providing Company ID :  </td>
                   <td>
                       <asp:TextBox ID="getdealnmbyid" runat="server"></asp:TextBox>
                   </td>
                   <td><asp:Button ID="Button6" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button6_Click" /></td>
               </tr>
               </table>
                    </div>
           

        <asp:Label ID="errorLabel" runat="server" Text="" Visible="false"></asp:Label>
    </div>
        </body>
</asp:Content>
