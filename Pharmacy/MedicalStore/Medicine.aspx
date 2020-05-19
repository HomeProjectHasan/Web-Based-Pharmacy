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
                <a href="Employ.aspx"   accesskey="3">Employees</a>
                <a href="Purchase.aspx" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>
            </nav>
            <br />
            <br />
           
            
            <p>
             <div style="font-size: large; padding-left:40%;">
            <asp:Button ID="Button1" runat="server" class="buttonBorder"  Font-Size="Large" Text="Show All Medicines" Height="40px" Width="200px" OnClick="Button1_Click" />
                &nbsp;
                <asp:Button ID="Button2" runat="server" class="buttonBorder"  Font-Size="Large" Text="Show Out Of Stock" Height="40px" Width="200px" OnClick="Button2_Click" />
                &nbsp;
                <asp:Button ID="Button3" runat="server" class="buttonBorder"  Font-Size="Large" Text="Show All Expired" Height="40px" Width="200px" OnClick="Button3_Click" />
            </div>
                 </p>
              <div style="padding-top:20px;">
                <div class="whitepanel medicinepanel1">
           <table id="table1">
                
               <tr>
                   <td align="right">Find Price of Medicine by Entering Medicine ID :</td> 
                     <td>  
                         <asp:TextBox ID="Pricebyid" runat="server"></asp:TextBox>
                   </td>
                  <td><asp:Button ID="Button4" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button4_Click" /></td>
               </tr>
               <tr>
                   <td align="right">Find Expiry Date(dd mm yyyy) of Medicine by Entering Medicine ID :</td>
                   <td>
                       <asp:TextBox ID="Expirybyid" runat="server"></asp:TextBox>
                   </td>
                   <td><asp:Button ID="Button5" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button5_Click" /></td>
               </tr>
               <tr>
                   <td align="right">Find Who Took These Medicine by Entering Medicine ID :</td>
                   <td>
                       <asp:TextBox ID="Takebyid" runat="server"></asp:TextBox>
                   </td>
                   <td><asp:Button ID="Button6" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button6_Click" /></td>
               </tr>
               <tr>
                   <td align="right">Find All Information of Medicine by Entering Medicine ID : </td>
                   <td>
                       <asp:TextBox ID="Informationbyid" runat="server"></asp:TextBox>
                   </td>
                   <td><asp:Button ID="Button7" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button7_Click" /></td>
               </tr>
               <tr>
                   <td align="right">Find Medicine Quantity left in stock by Entering Medicine ID :  </td>
                   <td>
                       <asp:TextBox ID="Quantitybyid" runat="server"></asp:TextBox>
                   </td>
                   <td><asp:Button ID="Button8" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button8_Click" /></td>
               </tr>
               <tr>
                   <td align="right">Find Purchase Date of Medicine from Dealer by Entering Medicine ID : </td>
                   <td>
                       <asp:TextBox ID="Purchasebyid" runat="server"></asp:TextBox>
                   </td>
                   <td><asp:Button ID="Button9" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button9_Click" /></td>
               </tr>
               <tr>
                   <td align="right">Find Number of Sales of Medicine by Entering Medicine ID : </td>
                   <td>
                       <asp:TextBox ID="Salesnobyid" runat="server"></asp:TextBox>
                   </td>
                   <td><asp:Button ID="Button10" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button10_Click" /></td>
               </tr>
               <tr>
                  <td align="right">Update Manufacturing Date(dd mm yyyy) by Entering Medicine ID : </td>
                   <td>
                       <asp:TextBox ID="Updatebyid" runat="server"></asp:TextBox>
                   </td>
                  </tr>
                   <tr>
                   <td align="right"> And Manufacturing date :  </td>
                      <td>
                       <asp:TextBox ID="manudate" runat="server"></asp:TextBox>
                   </td>
                       <td><asp:Button ID="Button11" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button11_Click" /></td>
               </tr>
               
               <tr>

                   <td align="right">Update Expiry Date of Medicine(dd mm yyyy) by Medicine ID :  </td>
                   <td>
                       <asp:TextBox ID="Expirydatebyid" runat="server"></asp:TextBox>
                   </td>
                 </tr>
                  <tr>
                   <td align="right"> And Expiry date :  </td>
                      <td>
                       <asp:TextBox ID="expirydate" runat="server"></asp:TextBox>
                   </td>
                      <td><asp:Button ID="Button12" Text="Submit" runat="server" style="margin-left:3px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="30px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="Button12_Click" /></td>
               </tr>
                </table>
              </div>
                  </div>

</asp:Content>
