<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="MedicalStore.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div style="padding-bottom:210px;padding-top:100px;">  
        <div class="whitepanel signup">
           <table id="table1" align="center">
               <tr>
                   <td></td>
                   <td>
                       <asp:Label ID="ErrorLabel" runat="server" Style="color: red" Text=""></asp:Label>
                   </td>
               </tr>
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

                       <asp:RadioButtonList ID="Gender" runat="server" RepeatDirection="Horizontal">
                           <asp:ListItem>M</asp:ListItem>
                           <asp:ListItem>F</asp:ListItem>
                       </asp:RadioButtonList>

                   </td>
               </tr>
               <tr>
                   <td align="right">Date of Birth:</td>
                   <td>
                       <asp:TextBox ID="dob" runat="server"></asp:TextBox>
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
               <tr>
                   <td></td>
                   <td>
                       <div class="div" style="padding-right: 7px; height: 15px;">
                           <asp:Button runat="server" ID="button1" Text="Sign Up" Height="30px" Width="70px" Style="margin-top: 5px;" class="buttonBorderSmall" OnClick="button2_Click" />
                           <asp:Button ID="Button2" runat="server" PostBackUrl="~/Login.aspx" Height="30px" Width="80px" Style="margin-left: 10px;" Text="Exist User" class="buttonBorderSmall" />
                       </div>
                   </td>
               </tr>
          </table>
       </div>
      </div>
</asp:Content>
