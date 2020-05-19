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
    <nav class="menu-navigation-round">
        <div class="menuCustom">
            <a href="Home.aspx" class="selected" accesskey="1">Home</a>
            <a href="Medicine.aspx" accesskey="2">Medicines</a>
            <a href="Employ.aspx" accesskey="3">Employees</a>
            <a href="Purchase.aspx" accesskey="4">Purchase</a>
            <a href="Dealer.aspx" accesskey="5">Dealers</a>
            <a href="About.aspx" accesskey="6">About Us</a>
        </div>
    </nav>

    <div style="padding-top: 20px;">
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
                           <asp:Button ID="Button1" Text="Generate Bill" runat="server" data-target="#myModal" Style="margin-left: 80px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="38px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="GenerateBill" />
                       </div>
                   </td>
               </tr>
          </table>
        </div>
     </div>

<!-- The button -->

<!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="container">
                        <div class="invoice-title">
                            <h2>Invoice</h2>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <address>
                                    <strong>Billed To:</strong><br>
                                    Name: <asp:Label ID="namebill" runat="server" Text=""></asp:Label><br>
                                    Contact No: <asp:Label ID="contactbill" runat="server" Text=""></asp:Label>
                                </address>
                            </div>
                            <div class="col-md-6 text-right">
                                <address>
                                    <strong>Order Date:</strong><br>
                                    <asp:Label ID="datebill" runat="server" Text=""></asp:Label><br>
                                </address>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="row">
                            <div class="panel panel-default col-12">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><strong>Order summary</strong></h3>
                                </div>
                                <br>
                                <div class="panel-body">
                                    <table class="table table-condensed" style="color: #405A67;">
                                        <thead>
                                            <tr>
                                                <td><strong>ID</strong></td>
                                                <td class="text-center"><strong>Name</strong></td>
                                                <td class="text-center"><strong>Price</strong></td>
                                                <td class="text-center"><strong>Quantity</strong></td>
                                                <td class="text-right"><strong>Total</strong></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- foreach ($order->lineItems as $line) or some such thing here -->
                                            <tr>
                                                <td>
                                                    <asp:Label ID="medicineidbill" runat="server" Text=""></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="medicinenamebill" runat="server" Text=""></asp:Label></td>
                                                <td class="text-center">
                                                    <asp:Label ID="medicinepricebill" runat="server" Text=""></asp:Label>
                                                <td class="text-center">
                                                    <asp:Label ID="medicineqtybill" runat="server" Text=""></asp:Label></td>
                                                <td class="text-right">
                                                    <asp:Label ID="medicinetotalbill" runat="server" Text=""></asp:Label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <address>
                                            <strong>Prepared By:</strong>
                                            <asp:Label ID="servedbybill" runat="server" Text=""></asp:Label>
                                        </address>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" class="buttonBorderSmall" data-dismiss="modal" style="margin-right: 80px; height: 38px;" aria-hidden="true">Cancel</button>
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="Sell" Text="Confirm" runat="server" data-target="#myModal" class="buttonBorderSmall" Font-Bold="true" Height="38px" Width="100px" OnClick="SellClick" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
