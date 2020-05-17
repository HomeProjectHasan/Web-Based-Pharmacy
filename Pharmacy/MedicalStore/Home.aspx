<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MedicalStore.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
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
        
        <div style="padding-top:20px; padding-bottom:10%;">
            <div class="whitepanel homepanel">
            <table id="table1" align="center">
               <tr>
                   <td></td>
                   <td>
                       <asp:Label ID="ErrorLabel" runat="server" Style="color: red" Text=""></asp:Label>
                   </td>
               </tr>
               
               <tr>
                   <td align="right">New Customer?:</td>
                   <td>
                        <asp:RadioButtonList ID="NewFlag" runat="server" RepeatDirection="Horizontal">
                           <asp:ListItem>Y</asp:ListItem>
                           <asp:ListItem>N</asp:ListItem>
                       </asp:RadioButtonList>
                   </td>
               </tr>
               <tr>
                   <td align="right">Customer:</td>
                   <td>
                       <asp:TextBox ID="Customer" runat="server" Style="margin-left: 0px"></asp:TextBox>
                <asp:DropDownList ID="Customerlist" runat="server" AppendDataBoundItems="True"
                    DataTextField="CustomerName" DataValueField="CustomerName" Height="16px"
                    Width="118px">
                    <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                </asp:DropDownList>
                   </td>
               </tr>
                <tr>
                   <td align="right">Address:</td>
                   <td>
                       <asp:TextBox ID="Address" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr><tr>
                   <td align="right">Contact:</td>
                   <td>
                       <asp:TextBox ID="Contact" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align="right">medicine Name:</td>
                   <td>
                       <asp:DropDownList ID="MedicineList" runat="server" AppendDataBoundItems="True"
                    DataTextField="MedicineName" DataValueField="MedicineID" Height="16px"
                    Width="118px">
                    <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                   </asp:DropDownList>
                   </td>
               </tr>
               <tr>
                   <td align="right">Sell Date:</td>
                   <td>
                       <asp:TextBox ID="Date" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>

               <tr>
                   <td align="right">Quantity:</td>
                   <td>
                        <asp:TextBox ID="Quantity" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
               
               
               <tr>
                   <td></td>
                   <td>
                       <div class="div" style="padding-right: 7px; height: 15px;">
                           <asp:Button ID="Sell" Text="Generate Bill" runat="server" Style="margin-left: 80px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="38px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="SellClick" />
                       </div>
                   </td>
               </tr>
          </table>
  </div>
 </body>
 <br />
    
</asp:Content>
