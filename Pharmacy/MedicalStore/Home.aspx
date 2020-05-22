<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MedicalStore.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script  type="text/javascript">

            function ValidateForm() {
                var Date = document.getElementById('<%=Date.ClientID%>').value;
                var Quantity = document.getElementById('<%=Quantity.ClientID%>').value;
                var MedicineName = document.getElementById('<%=MedicineList.ClientID%>').value;
                var oldCustomer = document.getElementById('<%=Customerlist.ClientID%>').value;
                var newCustomer = document.getElementById('<%=Customer.ClientID%>').value;
                var newaddress = document.getElementById('<%=Address.ClientID%>').value;
                var newcontact = document.getElementById('<%=Contact.ClientID%>').value;
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
                        if (MedicineName != "0" && oldCustomer != "0") {
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
                            document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please select customer and medicine.";
                            enableDisable();
                            return false;
                        }
                    }

                    //if selected yes
                    else {
                        if (MedicineName != "0") {
                            //medicine name selected
                            if (dateValidator(Date)) {
                                //date is fine check quantity                                       
                                if (numberValidator(Quantity)) {
                                    //Quantity is fine too. Rerturn
                                    if (textWithSpaceValidator(newCustomer)) {
                                        //new customer name fine
                                        if (textWithSpaceValidator(newaddress)) {
                                            //new address fine
                                            if (phoneNoValidator(newcontact)) {
                                                //contact no is fine too
                                                return true;
                                            }
                                            else {
                                                document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Contact No.";
                                                            enableDisable();
                                                            return false;
                                                        }
                                                    }
                                                    else {
                                                        document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Address.";
                                                        enableDisable();
                                                        return false;
                                                    }
                                                }
                                                else {
                                                    document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Customer Name.";
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
                            document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please select medicine.";
                            enableDisable();
                            return false;
                        }
                    }
                }
                else {
                    document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please select customer type.";
                    enableDisable();
                    return false;
                }
            }

            function showContact() {
                var list = document.getElementById("<%= Customerlist.ClientID%>");
                if (list.value) {
                    document.getElementById("contactNo").innerHTML = list.value;
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
            <a href="Employee.aspx" accesskey="3">Employees</a>
            <a href="Purchase.aspx" accesskey="4">Purchase</a>
            <a href="Dealer.aspx" accesskey="5">Dealers</a>
            <a href="About.aspx" accesskey="6">About Us</a>
        </div>
    </nav>

    <div style="padding-top: 20px;">
        <div class="whitepanel homepanel">
            <div class="row">
                <div class="col-md-5 offset-1" style="padding-top:2px;padding-left:10px;font-size:16px;" align="right">New Customer:</div>
                <div class="col-md-4">
                <asp:RadioButtonList ID="NewFlag" Height="25px" runat="server" OnClick="enableDisable()" RepeatDirection="Horizontal">
                           <asp:ListItem>Yes</asp:ListItem>
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
               <tr id="oldCustomer">
                   <td align="right">Customer:</td>
                    <td>
                        <asp:DropDownList ID="Customerlist" runat="server" AppendDataBoundItems="True" OnChange="showContact()"
                            DataTextField="CustomerName" DataValueField="ContactNo" Height="25px"
                            Width="181px">
                            <asp:ListItem Value="0">--Select Customer--</asp:ListItem>
                        </asp:DropDownList>
                    </td>
               </tr> 
                <tr id="oldCustomerNo">
                    <td align="right">Contact No:</td>
                    <td id="contactNo"></td>
                </tr>
               <tr>
                   <td align="right">medicine Name:</td>
                   <td>
                       <asp:DropDownList ID="MedicineList" runat="server" AppendDataBoundItems="True"
                    DataTextField="MedicineName" DataValueField="MedicineID" Height="25px"
                    Width="181px">
                    <asp:ListItem Value="0">--Select Medicine--</asp:ListItem>
                   </asp:DropDownList>
                   </td>
               </tr>
               <tr>
                   <td align="right">Date:</td>
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
               
            </table>
            <br>
            <hr>
            <div class="row">
                <div class="col-md-8 offset-4">
                    <asp:Button ID="Button1" Text="Generate Bill" runat="server" data-target="#myModal" class="buttonBorderSmall" Font-Size="Larger" Height="35px" Width="140px" OnClientClick="return ValidateForm();" OnClick="GenerateBill" />
                </div>
            </div>
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
                                    <table class="table table-condensed" style="color: #405A67;font-size:12px;">
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
