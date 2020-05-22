<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="MedicalStore.Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script  type="text/javascript">

        function ValidateForm() {
            var Date = document.getElementById('<%=Date.ClientID%>').value;
            var Quantity = document.getElementById('<%=Quantity.ClientID%>').value;
            var DealerName = document.getElementById('<%=Dealer.ClientID%>').value;
            var oldmedicine = document.getElementById('<%=MedicineList.ClientID%>').value;
            var newmedicine = document.getElementById('<%=Medicine.ClientID%>').value;
            var newprice = document.getElementById('<%=Price.ClientID%>').value;
            var newmfd = document.getElementById('<%=MFD.ClientID%>').value;
            var newexp = document.getElementById('<%=EXP.ClientID%>').value;
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
                    if (DealerName != "0" && oldmedicine != "0") {
                        //check others
                        if (dateValidator(Date)) {
                            //date is fine check quantity
                            if (numberValidator(Quantity)) {
                                //Quantity is fine too. Rerturn
                                return true;
                            }
                            else {
                                document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Quantity.";
                                 enableDisable();
                                 return false;
                             }
                         }
                         else {
                             document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid date in 'DD/MM/YYYY' format.";
                             enableDisable();
                             return false;
                         }
                     }
                     else {
                         document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please select medicine and dealer.";
                         enableDisable();
                         return false;
                     }
                 }

                 //if selected yes
                 else {
                     if (DealerName != "0") {
                         if (dateValidator(Date)) {
                             //date is fine check quantity
                             if (numberValidator(Quantity)) {
                                 //Quantity is fine.
                                 if (textWithNumberValidator(newmedicine)) {
                                     //Medicine name is fine.
                                     if (decimalValidator(newprice)) {
                                         //Price is fine.
                                         if (dateValidator(newmfd)) {
                                             //MFD is fine.
                                             if (dateValidator(newexp)) {
                                                 //EXP is fine
                                                     return true;
                                             }
                                             else {
                                                 document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid EXP in 'DD/MM/YYYY' format..";
                                                 enableDisable();
                                                 return false;
                                             }
                                         }
                                         else {
                                             document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid MFD in 'DD/MM/YYYY' format.";
                                             enableDisable();
                                             return false;
                                         }
                                     }
                                     else {
                                         document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Price.";
                                         enableDisable();
                                         return false;
                                     }
                                 }
                                 else {
                                     document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Medicine Name.";
                                     enableDisable();
                                     return false;
                                 }
                             }
                             else {
                                 document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Quantity.";
                                 enableDisable();
                                 return false;
                             }
                         }
                         else {
                             document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid date in 'DD/MM/YYYY' format.";
                             enableDisable();
                             return false;
                         }
                     }
                     else {
                         document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please select a dealer.";
                         enableDisable();
                         return false;
                     }
                 }
             }
             else {
                 document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please select medicine type.";
                enableDisable();
                return false;
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
         <nav class="menu-navigation-round">
                <div class="menuCustom">
                <a href="Home.aspx"  accesskey="1" >Home</a>
                <a href="Medicine.aspx" accesskey="2">Medicines</a>
                <a href="Employee.aspx"   accesskey="3">Employees</a>
                <a href="Purchase.aspx" class="selected" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>
         </nav>
    <br>
    <br>
             <div class="whitepanel purchasepanel">
                 <div class="row">
                <div class="col-md-5 offset-1" style="padding-top:2px;padding-left:10px;font-size:16px;" align="right">New Medicine:</div>
                <div class="col-md-4">
                <asp:RadioButtonList ID="NewFlag" name="NewFlag" CssClass="radioButtonList" runat="server" OnClick="enableDisable()" RepeatDirection="Horizontal">
                           <asp:ListItem >Yes</asp:ListItem>
                           <asp:ListItem>No</asp:ListItem>
                       </asp:RadioButtonList>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-11 offset-1">
                    <asp:Label ID="ErrorLabel" runat="server" Style="color: red" Text=""></asp:Label>
                </div>
            </div>
           <table id="table1" align="center">
               <tr id="oldMedicine">
                   <td align="right">Medicine:</td>
                   <td>
                    <asp:DropDownList ID="MedicineList" runat="server" AppendDataBoundItems="True"
                    DataTextField="MedicineName" DataValueField="Price" Height="25px"
                    Width="181px">
                    <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                </asp:DropDownList>
                   </td>
               </tr>

               <tr>
                   <td align="right">Dealer ID:</td>
                   <td>
                       <asp:DropDownList ID="Dealer" runat="server" AppendDataBoundItems="True"
                    DataTextField="Name" DataValueField="DealerID" Height="25px"
                    Width="181px">
                    <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                </asp:DropDownList>
                   </td>
               </tr>
         
               <tr>
                   <td align="right">Purchase Date:</td>
                   <td>
                       <asp:TextBox ID="Date" placeholder="DD/MM/YYYY" runat="server" Style="margin-left: 0px"></asp:TextBox>
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
                        <asp:TextBox ID="MFD" placeholder="DD/MM/YYYY" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
                <tr id ="newEXP">
                   <td align="right">EXP:</td>
                   <td>
                       <asp:TextBox ID="EXP" placeholder="DD/MM/YYYY" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
          </table>
            <br>
            <hr>
            <div class="row">
                <div class="col-md-8 offset-4">
                    <asp:Button ID="Button1" Text="Generate Bill" runat="server" data-target="#myModal" class="buttonBorderSmall" Font-Size="Larger" Height="35px" Width="140px" OnClientClick="return ValidateForm();" OnClick="GenerateBill" />
                </div>
            </div>
       </div>   


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
                                    Company: <asp:Label ID="companybill" runat="server" Text=""></asp:Label><br>
                                    Contact: <asp:Label ID="contactbill" runat="server" Text=""></asp:Label><br>
                                    Email: <asp:Label ID="emailbill" runat="server" Text=""></asp:Label>
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
                                    <table class="table table-condensed" style="color: #405A67;font-size:12px;">
                                        <thead>
                                            <tr>
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
                            <asp:Button ID="Sell" Text="Confirm" runat="server" data-target="#myModal" class="buttonBorderSmall" Font-Bold="true" Height="38px" Width="100px" OnClick="PurchaseClick" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
