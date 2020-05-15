<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="Outputpage3.aspx.cs" Inherits="MedicalStore.Outputpage3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
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
                <div style="padding-bottom:400px;">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
               <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" style="margin-left: 663px; margin-right: 0px" Width="290px">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>

            </div>

        </div>
    
</asp:Content>
