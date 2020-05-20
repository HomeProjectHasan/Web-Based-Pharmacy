<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Frontpage.aspx.cs" Inherits="MedicalStore.Frontpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div" style="text-align: center; padding-top: 200px; padding-bottom: 220px;">
        <asp:Button ID="Button1" runat="server" class="buttonBorder" style="margin-right:25px;" Font-Size="Larger" Font-Bold="true" Text="Sign Up" Height="50px" Width="140px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" PostBackUrl="~/Signup.aspx" />
        <asp:Button ID="Button2" runat="server" Font-Size="Larger"  class="buttonBorder" Font-Bold="true" Text="Login" Height="50px" Width="140px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" PostBackUrl="~/Login.aspx" />
    </div>
</asp:Content>
