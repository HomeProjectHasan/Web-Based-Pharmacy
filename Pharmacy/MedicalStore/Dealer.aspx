<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Dealer.aspx.cs" Inherits="MedicalStore.Dealer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body onkeydown="return (event.keyCode!=13)">

        <div style="font-size: large; padding-left:40%;">
                    <a href="Home.aspx" accesskey="1" title="" style="color: #d4fbff">Home</a> &nbsp;&nbsp;&nbsp; 
                <a href="Medicine.aspx" accesskey="2" title="" style="color: #d4fbff">Medicines</a> &nbsp;&nbsp;&nbsp;
                <a href="Employ.aspx" accesskey="3" title="" style="color: #d4fbff">Employees</a>
                        &nbsp;&nbsp;&nbsp;
                <a href="Purchase.aspx" accesskey="4" title="" style="color: #d4fbff">Purchase</a> &nbsp;&nbsp;&nbsp;
                <a href="Dealer.aspx" accesskey="5" title="" style="color: #d4fbff">Dealers</a>
                        &nbsp;&nbsp;&nbsp;
                <a href="About.aspx" accesskey="6" title="" style="color: #d4fbff">About Us</a> &nbsp;&nbsp;&nbsp;
                <a href="Frontpage.aspx" accesskey="7" title="" style="color: #d4fbff">Sign Out</a>
            </div>
    </body>
    <br />
    <br />
    <br />
  <p>
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;  &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
            <asp:Button ID="Button1" runat="server" Style="border: 2px solid white; padding-left: 10px; padding-right: 10px; border-radius: 8px; box-shadow: 0 10px 50px #d4fbff;" Font-Size="Larger" Font-Bold="true" Text="Show All Dealers" Height="40px" Width="200px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" OnClick="Button1_Click" />
                &nbsp;
                <asp:Button ID="Button2" runat="server" Style="border: 2px solid white; padding-left: 10px; padding-right: 10px; border-radius: 8px; box-shadow: 0 10px 50px #d4fbff;" Font-Size="Larger" Font-Bold="true" Text="Show All Companies" Height="40px" Width="200px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" OnClick="Button2_Click" />
                &nbsp;
                <asp:Button ID="Button3" runat="server" Style="border: 2px solid white; padding-left: 10px; padding-right: 10px; border-radius: 8px; box-shadow: 0 10px 50px #d4fbff;" Font-Size="Larger" Font-Bold="true" Text="Show All purchases" Height="40px" Width="200px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" OnClick="Button3_Click" />
                 &nbsp;
                <asp:Button ID="Button4" runat="server" Style="border: 2px solid white; padding-left: 10px; padding-right: 10px; border-radius: 8px; box-shadow: 0 10px 50px #d4fbff;" Font-Size="Larger" Font-Bold="true" Text="Show All Sales" Height="40px" Width="200px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" OnClick="Button4_Click" />
            </p>
    <p style="margin-left: 60px">
        &nbsp;
    </p>
    <p style="margin-left: 60px">
        &nbsp;
    </p>
    <div class="div" style="color: white; padding-top:20px; padding-left:300px; padding-bottom:20px;">
    <p style="margin-left: 60px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;
        Find Dealer of Pharmacy by Entering Dealer ID : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Textbox1" runat="server"></asp:TextBox>

        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button5" runat="server" Font-Size="Larger" Style="border: 2px solid white; padding-left: 10px; padding-right: 10px; border-radius: 8px; box-shadow: 0 10px 50px ; margin-left: 50px; margin-top: 22px;" Font-Bold="true" Text="Submit" Width="118px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" Height="31px" OnClick="Button5_Click" />
    </p>
    <p style="margin-left: 60px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;
        Get The Dealer Name  By Providing Company ID :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="Textbox2" runat="server"></asp:TextBox>

        &nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Button ID="Button6" runat="server" Font-Size="Larger" Style="border: 2px solid white; padding-left: 10px; padding-right: 10px; border-radius: 8px; box-shadow: 0 10px 50px ; margin-left: 50px; margin-top: 22px;" Font-Bold="true" Text="Submit" Width="118px" BorderColor="White" BorderStyle="Solid" ForeColor="Black" Height="31px" OnClick="Button6_Click" />

        <asp:Label ID="errorLabel" runat="server" Text="" Visible="false"></asp:Label>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
