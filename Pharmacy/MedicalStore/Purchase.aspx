<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="MedicalStore.Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script  type="text/javascript">
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
                    document.getElementById("<%= Price.ClientID%>").disabled = true;
                    document.getElementById("<%= MFD.ClientID%>").disabled = true;
                    document.getElementById("<%= EXP.ClientID%>").disabled = true;
                    document.getElementById("<%= Medicine.ClientID%>").style.visibility = 'hidden';
                    document.getElementById("<%= MedicineList.ClientID%>").style.visibility = 'visible';
                }
                else {
                    document.getElementById("<%= Price.ClientID%>").disabled = false;
                    document.getElementById("<%= MFD.ClientID%>").disabled = false;
                    document.getElementById("<%= EXP.ClientID%>").disabled = false;
                    document.getElementById("<%= Medicine.ClientID%>").style.visibility = 'visible';
                    document.getElementById("<%= MedicineList.ClientID%>").style.visibility = 'hidden';
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body onkeydown="return (event.keyCode!=13)">
        <div style="font-size: large; padding-left: 40%;">
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
        <div style="padding-top: 20px; padding-bottom: 12%;">
             <div class="whitepanel signup">
           <table id="table1" align="center">
               <tr>
                   <td></td>
                   <td>
                       <asp:Label ID="ErrorLabel" runat="server" Style="color: red" Text=""></asp:Label>
                   </td>
               </tr>
               <tr>
                   <td align="right">Dealer ID:</td>
                   <td>
                       <asp:DropDownList ID="Dealer" runat="server" AppendDataBoundItems="True"
                    DataTextField="Name" DataValueField="DealerID" Height="16px"
                    Width="118px">
                    <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                </asp:DropDownList>
                   </td>
               </tr>
               <tr>
                   <td align="right">New Medicine?:</td>
                   <td>
                        <asp:RadioButtonList ID="NewFlag" name="NewFlag" runat="server" OnClick="enableDisable()" RepeatDirection="Horizontal">
                           <asp:ListItem>Yes</asp:ListItem>
                           <asp:ListItem>No</asp:ListItem>
                       </asp:RadioButtonList>
                   </td>
               </tr>
               
               <tr id="listid">
                   <td align="right">Medicine:</td>
                   <td>
                    <asp:DropDownList ID="MedicineList" runat="server" AppendDataBoundItems="True"
                    DataTextField="MedicineName" DataValueField="MedicineName" Height="16px"
                    Width="118px">
                    <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                </asp:DropDownList>
                   </td>
               </tr>
         
               <tr>
                   <td align="right">Purchase Date:</td>
                   <td>
                       <asp:TextBox ID="Date" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>

               <tr>
                   <td align="right">Quantity:</td>
                   <td>
                        <asp:TextBox ID="Quantity" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
               <tr id="id">
                   <td  align="right"><div ID="textMedicine" >New medicine name:</div></td>
                   <td>
                       <asp:TextBox ID="Medicine" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align="right">Price:</td>
                   <td>
                       <asp:TextBox ID="Price" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td align="right">MFD:</td>
                   <td>
                        <asp:TextBox ID="MFD" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
                <tr>
                   <td align="right">EXP:</td>
                   <td>
                       <asp:TextBox ID="EXP" runat="server" Style="margin-left: 0px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td></td>
                   <td>
                       <div class="div" style="padding-right: 7px; height: 15px;">
                           <asp:Button ID="Button1" Text="Creat Bill" runat="server" Style="margin-left: 94px;" class="buttonBorderSmall" Font-Size="Larger" Font-Bold="true" Height="38px" Width="100px" BorderColor="#d4fbff" BorderStyle="Solid" ForeColor="Black" OnClick="PurchaseClick" />
                       </div>
                   </td>
               </tr>
          </table>
       </div>              
    </body>

</asp:Content>
