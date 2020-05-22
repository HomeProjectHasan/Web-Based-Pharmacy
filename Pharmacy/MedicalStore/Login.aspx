<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MedicalStore.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body onkeydown = "return (event.keyCode!=13)">
       <div style="padding-bottom:344px;padding-top:200px;">
          
          <div class="whitepanel login">
          <div class="row">
              <div class="col-md-6">
                  <asp:Label ID="Label1" runat="server" Style="color: red" Text=""></asp:Label>
              </div>
          </div>
            <table id="table1" align="center">
                <tr>
                    <td>Username:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="password" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
          <div class="row">
              <div class="col-md-3"></div>
                  <div class="col-md-9">
                      <asp:Button ID="Button2" runat="server" PostBackUrl="~/Signup.aspx" Height="30px" Width="80px" Style="margin-right: 10px;" Text="Sign Up" class="buttonBorderSmall" />
                      <asp:Button runat="server" ID="button1" Text="Login" Height="30px" Width="70px" Style="margin-top: 8px;" class="buttonBorderSmall" OnClick="button1_Click1" />
                            
                  </div>
          </div>
          </div>
        </div>          
    </body>
</asp:Content>
