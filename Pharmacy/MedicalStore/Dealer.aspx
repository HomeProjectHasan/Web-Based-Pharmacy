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
  
   
        <div style="padding-top: 30px;">
        <div class="whitepanel dealerpanel1 ">
               <table id="table1" align="center">
               <tr>
                   <td></td>
                   <td>
                       <asp:Label ID="ErrorLabel" runat="server" Style="color: red" Text=""></asp:Label>
                   </td>
               </tr>               
               

               <tr>
                   <td align="right">Dealer Name:</td>
                  <td>
                       <asp:TextBox ID="Dealername" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
         
               <tr>
                   <td align="right">Dealer Contact No:</td>
                   <td>
                       <asp:TextBox ID="Dealercontactno" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>

               <tr>
                   <td align="right">Dealer Address:</td>
                   <td>
                        <asp:TextBox ID="Dealeraddress" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
                    <tr>
                   <td align="right">Dealer Email:</td>
                   <td>
                        <asp:TextBox ID="Dealeremail" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
                   <tr>
                   <td align="right">New Company?:</td>
                   <td>
                        <asp:RadioButtonList ID="NewFlag" name="NewFlag" runat="server" OnClick="enableDisable()" RepeatDirection="Horizontal">
                           <asp:ListItem>Yes</asp:ListItem>
                           <asp:ListItem>No</asp:ListItem>
                       </asp:RadioButtonList>
                   </td>
               </tr>
               
               <tr id="oldcompany">
                   <td align="right">Company:</td>
                   <td>
                    <asp:DropDownList ID="CompanyList" runat="server" AppendDataBoundItems="True"
                    DataTextField="CompanyName" DataValueField="CompanyName" Height="16px"
                    Width="118px">
                    <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                </asp:DropDownList>
                   </td>
               </tr>
               <tr id="newCompanyname">
                   <td  align="right">Enter Company name:</td>
                   <td>
                       <asp:TextBox ID="Companyname" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>             
               <tr>
                      <tr id="newCompanylocation">
                   <td  align="right">Company Location:</td>
                   <td>
                       <asp:TextBox ID="Companyaddress" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>             
               <tr>
                      <tr id="newCompanycontactno">
                   <td  align="right">Company Contact Number:</td>
                   <td>
                       <asp:TextBox ID="Companycontactno" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>             
               <tr>
                   <td></td>
                   <td>
                       <div class="div" style="padding-right: 7px; height: 15px;">
                           <asp:Button ID="Button2" Text="Submit" runat="server" Style="margin-left: 80px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="38px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Submit" />
                       </div>
                   </td>
               </tr>
          </table>
         </body>
</asp:Content>
