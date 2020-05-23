<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Dealer.aspx.cs" Inherits="MedicalStore.Dealer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script  type="text/javascript">

        function ValidateForm() {
            var DealerName = document.getElementById('<%=Dealername.ClientID%>').value;
            var DealerContact = document.getElementById('<%=Dealercontactno.ClientID%>').value;
            var DealerAddress = document.getElementById('<%=Dealeraddress.ClientID%>').value;
            var DealerEmail = document.getElementById('<%=Dealeremail.ClientID%>').value;
            var Oldcompany = document.getElementById('<%=CompanyList.ClientID%>').value;
            var Newcompany = document.getElementById('<%=Companyname.ClientID%>').value;
            var NewCompanyAddress = document.getElementById('<%=Companyaddress.ClientID%>').value;
            var NewCompanyContact = document.getElementById('<%=Companycontactno.ClientID%>').value;
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
                    if (Oldcompany != "0") {
                        //check others
                        if (textWithSpaceValidator(DealerName)) {
                            //DealerName is fine check DealerContact
                            if (phoneNoValidator(DealerContact)) {
                                //DealerContact is fine check DealerAddress
                                if (textWithSpaceValidator(DealerAddress)) {
                                    //DealerAddress is fine check DealerEmail
                                    if (emailValidator(DealerEmail)) {
                                        //DealerEmail is fine too. Return
                                        return true;
                                    }
                                    else {
                                        document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Email.";
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
                                document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Contact No.";
                                enableDisable();
                                return false;
                            }
                        }
                        else {
                            document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Name.";
                            enableDisable();
                            return false;
                        }
                    }
                    else {
                        document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please Select Company.";
                        enableDisable();
                        return false;
                    }
                }

                //if selected yes
                else {
                    if (textWithSpaceValidator(Newcompany)) {
                        //Newcompanyis fine check NewCompanyAddress
                        if (textWithSpaceValidator(NewCompanyAddress)) {
                            //NewCompanyAddress is fine check NewCompanyContact
                            if (phoneNoValidator(NewCompanyContact)) {
                                //NewCompanyContact is fine check DealerName
                                if (textWithSpaceValidator(DealerName)) {
                                    //DealerName is fine check DealerContact
                                    if (phoneNoValidator(DealerContact)) {
                                        //DealerContact is fine check DealerAddress
                                        if (textWithSpaceValidator(DealerAddress)) {
                                            //DealerAddress is fine check DealerEmail
                                            if (emailValidator(DealerEmail)) {
                                                //DealerEmail is fine too. Return
                                                return true;
                                            }
                                            else {
                                                document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid dealer Email.";
                                                enableDisable();
                                                return false;
                                            }
                                        }
                                        else {
                                            document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid dealer Address.";
                                            enableDisable();
                                            return false;
                                        }
                                    }
                                    else {
                                        document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid dealer Contact.";
                                        enableDisable();
                                        return false;
                                    }
                                }
                                else {
                                    document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Dealer Name.";
                                    enableDisable();
                                    return false;
                                }
                            }
                            else {
                                document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid company Contact.";
                                enableDisable();
                                return false;
                            }

                        }
                        else {
                            document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid company location.";
                            enableDisable();
                            return false;
                        }
                    }
                    else {
                        document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid company Name.";
                        enableDisable();
                        return false;

                    }
                }


            }
            else {
                document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please Select Company type.";
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
                    document.getElementById("Oldcompany").style.visibility = 'visible';
                    document.getElementById("Newcompany").style.visibility = 'hidden';
                    document.getElementById("NewCompanyAddress").style.visibility = 'hidden';
                    document.getElementById("NewCompanyContact").style.visibility = 'hidden';                  
                }
                else {
                    document.getElementById("Oldcompany").style.visibility = 'hidden';
                    document.getElementById("Newcompany").style.visibility = 'visible';
                    document.getElementById("NewCompanyAddress").style.visibility = 'visible';
                    document.getElementById("NewCompanyContact").style.visibility = 'visible';    
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
                <a href="Employee.aspx" accesskey="3">Employees</a>
                <a href="Purchase.aspx" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" class="selected" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>
            </nav>
            <br>
            <br>
             <div style="font-size: large; padding-left:40%;">
                 <asp:Button ID="AllDealer" runat="server" class="buttonBorder"  Font-Size="Large" Text="Show All Dealer" Height="40px" Width="220px" OnClick="ShowClick" />
          </div>
    <br>
    <br>
            <div class="whitepanel purchasepanel">
                 <div class="row"> 
                <div class="col-md-11 offset-1" style="font-size:16px;">To add dealer/company enter below details :</div>
                </div>            
            <hr>
                 <div class="row">
                <div class="col-md-11 offset-1">
                    <asp:Label ID="ErrorLabel" runat="server" Style="color: red" Text=""></asp:Label>
                </div>
               </div>
                 <div class="row">
                <div class="col-md-5 offset-1" style="padding-top:2px;padding-left:10px;font-size:15px;" align="right">New Company:</div>
                <div class="col-md-4">
                        <asp:RadioButtonList ID="NewFlag" name="NewFlag" runat="server" OnClick="enableDisable()" RepeatDirection="Horizontal">
                           <asp:ListItem>Yes</asp:ListItem>
                           <asp:ListItem>No</asp:ListItem>
                       </asp:RadioButtonList>
               
                  </div>
                     </div>
          
           <table id="table1" align="center">
               <tr id="Oldcompany">
                   <td align="right">Company:</td>
                   <td>
                    <asp:DropDownList ID="CompanyList" runat="server" AppendDataBoundItems="True"
                    DataTextField="CompanyName" DataValueField="CompanyName" Height="25px"
                    Width="181px">
                    <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                </asp:DropDownList>
                   </td>
               </tr>
               <tr id="Newcompany">
                   <td  align="right">Enter Company name:</td>
                   <td>
                       <asp:TextBox ID="Companyname" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>             
               <tr id="NewCompanyAddress">
                   <td  align="right">Company Location:</td>
                   <td>
                       <asp:TextBox ID="Companyaddress" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>             
               <tr id="NewCompanyContact">
                   <td  align="right">Company Contact Number:</td>
                   <td>
                       <asp:TextBox ID="Companycontactno" runat="server" Style="margin-left: 0px"></asp:TextBox>
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
               </table>
           <br>
            <hr>
                  <div class="row">
                <div class="col-md-8 offset-4">
                           <asp:Button ID="Button2" Text="Submit" runat="server" data-target="#myModal" class="buttonBorderSmall" Font-Size="Larger" Height="35px" Width="140px" OnClientClick="return ValidateForm();" OnClick="Submit" />
                       </div>
                  </div>
               </div>
</asp:Content>
