<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="MedicalStore.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ValidateForm() {
           var Name = document.getElementById('<%=Name.ClientID%>').value;
            var DOB = document.getElementById('<%=dob.ClientID%>').value;

            var Geneder = document.getElementById('<%=Gender.ClientID%>');
            var inputs = Geneder.getElementsByTagName("input");
            var GenderSelected;
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked) {
                    GenderSelected = inputs[i];
                    break;
                }
            }
          var Designation = document.getElementById('<%=Designation.ClientID%>').value;
          var Salary = document.getElementById('<%=Salary.ClientID%>').value;
          var address = document.getElementById('<%=Address.ClientID%>').value;
          var contact = document.getElementById('<%=Contact.ClientID%>').value;
          var Email = document.getElementById("<%= Email.ClientID%>").value;
          var Uname = document.getElementById("<%= UName.ClientID%>").value;
          var Password = document.getElementById("<%= Password.ClientID%>").value;
            var ConfPassword = document.getElementById("<%= ConfPassword.ClientID%>").value;

            if (textWithSpaceValidator(Name)) {
                if (phoneNoValidator(contact)) {
                    if (textWithSpaceValidator(address)) {
                        if (GenderSelected) {
                            if (dateValidator(DOB)) {
                                if (textOnlyValidator(Designation)) {
                                    if (numberBigValidator(Salary)) {
                                        if (emailValidator(Email)) {
                                            if (textwithNumberOnly(Uname)) {
                                                if (textwithNumberOnly(Password)) {
                                                    if (Password == ConfPassword) {
                                                        return true;
                                                    }
                                                    else {
                                                        document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Password and confirm password didn't match";
                                                        return false;
                                                    }
                                                }
                                                else {
                                                    document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter valid Password";
                                                    return false;
                                                }
                                            }
                                            else {
                                                document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter valid UserName";
                                                return false;
                                            }
                                        }
                                        else {
                                            document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid Email";
                                            return false;
                                        }
                                    }
                                    else {
                                        document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter valid salary";
                                        return false;
                                    }
                                }
                                else {
                                    document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter valid designation";
                                    return false;
                                }

                            }
                            else {
                                document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter valid DOB in 'DD/MM/YYYY' format.";
                                return false;
                            }
                        }
                        else {
                            document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please select a gender";
                            return false;
                        }

                    }
                    else {
                        document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid address";
                        return false;
                    }
                }
                else {
                    document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid contact number";
                    return false;
                }
            }
            else {
                document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter a valid name";
                return false;
            }

        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div style="padding-top:60px;">  
        <div class="whitepanel signup">
            <div class="row">
                <div class="col-md-11 offset-1">
                     <asp:Label ID="ErrorLabel" runat="server" Style="color: red" Text=""></asp:Label>
                </div>
            </div>
           <table id="table1" align="center">
              <tr>
                   <td align="right">Full Name:</td>
                   <td>
                       <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align="right">Contact No:</td>
                   <td>
                       <asp:TextBox ID="Contact" runat="server"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align="right">Address:</td>
                   <td>
                       <asp:TextBox ID="Address" runat="server"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align="right">Gender:</td>
                   <td>
                       <asp:RadioButtonList ID="Gender" style="margin-top:7px;" CssClass="radioButtonList" runat="server" RepeatDirection="Horizontal">
                           <asp:ListItem>M</asp:ListItem>
                           <asp:ListItem>F</asp:ListItem>
                       </asp:RadioButtonList>
                   </td>
               </tr>
               <tr>
                   <td align="right">Date of Birth:</td>
                   <td>
                       <asp:TextBox ID="dob"  placeholder="DD/MM/YYYY" runat="server"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align="right">Designation:</td>
                   <td>
                       <asp:TextBox ID="Designation" runat="server"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align="right">Salary:</td>
                   <td>
                       <asp:TextBox ID="Salary" runat="server"></asp:TextBox>
                   </td>
               </tr>               
               <tr>
                   <td align="right">Email:</td>
                   <td>
                       <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                       <br />
                   </td>
               </tr>
               <tr>
                   <td align="right">Username:</td>
                   <td>
                       <asp:TextBox ID="UName" runat="server"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align="right">Password:</td>
                   <td>
                       <asp:TextBox ID="Password" TextMode="password" runat="server"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align="right">Confirm password:</td>
                   <td>
                       <asp:TextBox ID="ConfPassword" TextMode="password" runat="server"></asp:TextBox>
                   </td>
               </tr>
           </table>
            <br>
            <hr>
            <div class="row">
                <div class="col-md-9 offset-3">
                    <asp:Button runat="server" ID="button1" Text="Sign Up" Height="30px" Width="90px" Style="margin-top: 5px;margin-left: 5px;" class="buttonBorderSmall"  OnClientClick="return ValidateForm();" OnClick="button2_Click" />
                    <asp:Button ID="Button2" runat="server" PostBackUrl="~/Login.aspx" Height="30px" Width="100px" Style="margin-left: 15px;" Text="Exist User" class="buttonBorderSmall" />
                </div>
            </div>
        </div>
  </div>
</asp:Content>
