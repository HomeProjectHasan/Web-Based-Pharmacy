<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Medicine.aspx.cs" Inherits="MedicalStore.Medicine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 111px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

             <nav class="menu-navigation-round">
                <div class="menuCustom">
                <a href="Home.aspx"  accesskey="1" >Home</a>
                <a href="Medicine.aspx"  class="selected" accesskey="2">Medicines</a>
                <a href="Employee.aspx"   accesskey="3">Employees</a>
                <a href="Purchase.aspx" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>
            </nav>
    <br>
    <br>
     <div style="font-size: large; padding-left:40%;">
         <asp:Button ID="AllMedicine" runat="server" class="buttonBorder"  Font-Size="Large" Text="Show All Medicines" Height="40px" Width="180px" OnClick="All_Click" />
                &nbsp;
                <asp:Button ID="OutOfStock" runat="server" class="buttonBorder"  Font-Size="Large" Text="Show Out Of Stock" Height="40px" Width="180px" OnClick="OutOfStock_Click" />
                &nbsp;
                <asp:Button ID="Expired" runat="server" class="buttonBorder"  Font-Size="Large" Text="Show All Expired" Height="40px" Width="180px" OnClick="Expired_Click" />
          
    </div>
    <br>
    <br>
    <div class="whitepanel medicinepanel">
        <div class="row">
            <div class="col-4 pl-3 pr-0">
                Search by Medicine ID :
            </div>
            <div class="col-3 pl-0">
               <asp:TextBox ID="MedicineID" runat="server"></asp:TextBox>
            </div>
            <div class="col-4 pr-4">
                <asp:Button ID="Button2" Text="Search" runat="server" class="buttonBorderSmall" Font-Size="Large" Height="30px" Width="80px" OnClick="SearchByID" />
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-4 pl-3 pr-0">
                Search by Medicine Name :
            </div>
            <div class="col-3 pl-0">
                       <asp:TextBox ID="MedicineName" runat="server"></asp:TextBox>
            </div>
            <div class="col-4 pr-4">
                <asp:Button ID="Button3" Text="Search" runat="server" class="buttonBorderSmall" Font-Size="Large" Height="30px" Width="80px" OnClick="SearchByName" />
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-4 offset-2 pl-5 pr-0">
               Select Medicine :
            </div>
            <div class="col-3 pl-0 pr-2">
                <asp:DropDownList ID="MedicinePurchase" runat="server" AppendDataBoundItems="True"
                    DataTextField="MedicineName" DataValueField="MedicineID" Height="25px"
                    Width="160px">
                    <asp:ListItem Value="0">--Select Medicine--</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-3">                
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-4 offset-2 pl-5">     
            <asp:Button ID="Button4" Text="Purchase History" runat="server" class="buttonBorderSmall" Font-Size="Large" Height="30px" Width="160px" OnClick="ShowPurchaseHistory" />
</div>
            <div class="col-4 pl-4">     
            <asp:Button ID="Button1" Text="Sell History" runat="server" class="buttonBorderSmall" Font-Size="Large" Height="30px" Width="120px" OnClick="ShowSellHistory" />
        </div>
            </div>
    </div>   
</asp:Content>
