<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MedicalStore.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script  type="text/javascript">
            function showContact() {
                var list = document.getElementById("<%= Customerlist.ClientID%>");
                if (list.value) {
                    document.getElementById("contactNo").innerHTML = "ContactNo: "+ list.value;
                }
                else {
                    document.getElementById("contactNo").innerHTML = ""
                }
            }
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
                    document.getElementById("oldCustomer").style.visibility = 'visible';
                    document.getElementById("oldCustomerNo").style.visibility = 'visible';
                    document.getElementById("newCustomer").style.visibility = 'hidden';
                    document.getElementById("newAddress").style.visibility = 'hidden';
                    document.getElementById("newContact").style.visibility = 'hidden';
                }
                else {
                    document.getElementById("oldCustomer").style.visibility = 'hidden';
                    document.getElementById("oldCustomerNo").style.visibility = 'hidden';
                    document.getElementById("newCustomer").style.visibility = 'visible';
                    document.getElementById("newAddress").style.visibility = 'visible';
                    document.getElementById("newContact").style.visibility = 'visible';
                }
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <div class="menu-navigation-round">
        <nav >
            <div style="padding-left:26%; padding-top:30px;">
                <a href="Home.aspx" class="selected" accesskey="1" >Home</a>
                <a href="Medicine.aspx" accesskey="2">Medicines</a>
                <a href="Employ.aspx" accesskey="3">Employees</a>
                <a href="Purchase.aspx" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>           
            </nav>
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
                        <asp:RadioButtonList ID="NewFlag" runat="server" OnClick="enableDisable()" RepeatDirection="Horizontal">
                           <asp:ListItem>Yes</asp:ListItem>
                           <asp:ListItem>No</asp:ListItem>
                       </asp:RadioButtonList>
                   </td>
               </tr>  
                <tr id="oldCustomer">
                   <td align="right">Customer:</td>
                    <td>
                        <asp:DropDownList ID="Customerlist" runat="server" AppendDataBoundItems="True" OnChange="showContact()"
                            DataTextField="CustomerName" DataValueField="ContactNo" Height="16px"
                            Width="118px">
                            <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                        </asp:DropDownList>
                    </td>
               </tr> 
                <tr id="oldCustomerNo">
                    <td></td>
                    <td> <p id="contactNo"></p></td>
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
               <tr id="newCustomer">
                   <td align="right">Enter Customer Name:</td>
                   <td>
                    <asp:TextBox ID="Customer" runat="server" Style="margin-left: 0px"></asp:TextBox>                    
                   </td>
               </tr>
                <tr id="newAddress">
                   <td align="right">Address:</td>
                   <td>
                       <asp:TextBox ID="Address" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
                <tr id="newContact">
                   <td align="right">Contact:</td>
                   <td>
                       <asp:TextBox ID="Contact" runat="server" Style="margin-left: 0px"></asp:TextBox>
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
     </div>
 </body>
 <br />
    
</asp:Content>
