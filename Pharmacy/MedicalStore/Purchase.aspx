<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="MedicalStore.Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script  type="text/javascript">
        function enableDisable() {
            var list = document.getElementById("<%= NewFlag.ClientID%>");
            var inputs = list.getElementsByTagName("input");
            var selected;
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked) {
                    selected = inputs[i];
                    break;
                }
            }
            if (selected) {
                if (selected.value == "No") {
                    document.getElementById("oldMedicine").style.visibility = 'visible';
                    document.getElementById("newMedicine").style.visibility = 'hidden';
                    document.getElementById("newPrice").style.visibility = 'hidden';
                    document.getElementById("newMFD").style.visibility = 'hidden';
                    document.getElementById("newEXP").style.visibility = 'hidden';
                }
                else {
                    document.getElementById("oldMedicine").style.visibility = 'hidden';
                    document.getElementById("newMedicine").style.visibility = 'visible';
                    document.getElementById("newPrice").style.visibility = 'visible';
                    document.getElementById("newMFD").style.visibility = 'visible';
                    document.getElementById("newEXP").style.visibility = 'visible';
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body onkeydown="return (event.keyCode!=13)">
         <nav class="menu-navigation-round">
                <div class="menuCustom">
                <a href="Home.aspx"  accesskey="1" >Home</a>
                <a href="Medicine.aspx" accesskey="2">Medicines</a>
                <a href="Employ.aspx"   accesskey="3">Employees</a>
                <a href="Purchase.aspx" class="selected" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>
         </nav>
        <div style="padding-top: 20px; padding-bottom: 10%;">
             <div class="whitepanel purchasepanel">
           <table id="table1" align="center">
               <tr>
                   <td></td>
                   <td>
                       <asp:Label ID="ErrorLabel" runat="server" Style="color: red" Text=""></asp:Label>
                   </td>
               </tr>               
               <tr>
                   <td align="right">New Medicine?:</td>
                   <td>
                        <asp:RadioButtonList ID="NewFlag" name="NewFlag" runat="server" OnClick="enableDisable()" RepeatDirection="Horizontal">
                           <asp:ListItem>Yes</asp:ListItem>
                           <asp:ListItem>No</asp:ListItem>
                       </asp:RadioButtonList>
                   </td>
               </tr>
               
               <tr id="oldMedicine">
                   <td align="right">Medicine:</td>
                   <td>
                    <asp:DropDownList ID="MedicineList" runat="server" AppendDataBoundItems="True"
                    DataTextField="MedicineName" DataValueField="MedicineName" Height="16px"
                    Width="118px">
                    <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                </asp:DropDownList>
                   </td>
               </tr>

               <tr>
                   <td align="right">Dealer ID:</td>
                   <td>
                       <asp:DropDownList ID="Dealer" runat="server" AppendDataBoundItems="True"
                    DataTextField="Name" DataValueField="DealerID" Height="16px"
                    Width="118px">
                    <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                </asp:DropDownList>
                   </td>
               </tr>
         
               <tr>
                   <td align="right">Purchase Date:</td>
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
               <tr id="newMedicine">
                   <td  align="right">Enter Medicine name:</td>
                   <td>
                       <asp:TextBox ID="Medicine" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
               <tr id ="newPrice">
                   <td align="right">Price:</td>
                   <td>
                       <asp:TextBox ID="Price" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
               <tr id ="newMFD">
                   <td align="right">MFD:</td>
                   <td>
                        <asp:TextBox ID="MFD" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
                <tr id ="newEXP">
                   <td align="right">EXP:</td>
                   <td>
                       <asp:TextBox ID="EXP" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td></td>
                   <td>
                       <div class="div" style="padding-right: 7px; height: 15px;">
                           <asp:Button ID="Button1" Text="Creat Bill" runat="server" Style="margin-left: 80px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="38px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="PurchaseClick" />
                       </div>
                   </td>
               </tr>
          </table>
       </div>              
    </body>

</asp:Content>
