<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MedicalStore.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function ValidateForm() {

            var uName = document.getElementById('<%=username.ClientID%>').value;
            var Pwd = document.getElementById('<%=password.ClientID%>').value;

            if (uName && Pwd) {
                return true;
            }
            else {
                document.getElementById("<%= ErrorLabel.ClientID%>").innerHTML = "Please enter userid and password";
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top: 200px;">

        <div class="whitepanel login">
            <div class="row">
                <div class="col-md-11 offset-1">
                    <asp:Label ID="ErrorLabel" runat="server" Style="color: red" Text=""></asp:Label>
                </div>
            </div>
            <table id="table1" align="center">
                <tr>
                    <td>Username:
                    </td>
                    <td>
                        <asp:TextBox ID="username" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="password" TextMode="password" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                    <asp:Button ID="Button2" runat="server" PostBackUrl="~/Signup.aspx" Height="30px" Width="80px" Style="margin-right: 10px;" Text="Sign Up" class="buttonBorderSmall" />
                    <asp:Button runat="server" ID="button1" Text="Login" Height="30px" Width="70px" Style="margin-top: 8px;" class="buttonBorderSmall" OnClientClick="return ValidateForm();" OnClick="login" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
