<%@ Page Title="" Language="C#" MasterPageFile="~/MedicalStore.Master" AutoEventWireup="true" CodeBehind="DealerOutput.aspx.cs" Inherits="MedicalStore.DealerOutput" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             BindGridView();
         });
         function BindGridView() {
             $.ajax({
                 type: "POST",
                 url: "DealerOutput.aspx/ShowAllDealers",
                 data: "{}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: OnSuccess,
                 failure: function (response) {
                     alert(response);
                 },
                 error: function (response) {
                     alert(JSON.stringify(response));
                 }
             });
         }
         function OnSuccess(response) {
             $("[id*=grdModel]").DataTable(
                 {
                     bLengthChange: true,
                     lengthMenu: [[5, 10, -1], [5, 10, "All"]],
                     bFilter: true,
                     bSort: true,
                     bPaginate: true,
                     data: response.d,
                     columns: [{ 'data': 'DealerID' },
                        
                         { 'data': 'DealerName' },
                         { 'data': 'DealerContact' },
                         { 'data': 'DealerEmail' },
                         { 'data': 'DealerAddress' },
                         { 'data': 'CompanyName' },
                         { 'data': 'ServedBy' },
                         { 'data': 'DateTime' }]
                 });
        };
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <nav class="menu-navigation-round">
                <div class="menuCustom">
                <a href="Home.aspx"  accesskey="1" >Home</a>
                <a href="Medicine.aspx" accesskey="2">Medicines</a>
                <a href="Employee.aspx"   accesskey="3">Employees</a>
                <a href="Purchase.aspx" accesskey="4">Purchase</a>
                <a href="Dealer.aspx" accesskey="5">Dealers</a>
                <a href="About.aspx" accesskey="6">About Us</a>
            </div>
         </nav><div class="pt-5 pr-4">
        <div class="content-wrapper whitepanel pt-3 pb-3 pr-3 pl-3 col-8 offset-4">
            <asp:GridView ID="grdModel" runat="server" CssClass="display compact tablepanel" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="DealerID" HeaderText="ID" />
                    <asp:BoundField DataField="DealerName" HeaderText="Name" />
                    <asp:BoundField DataField="DealerContact" HeaderText="Contact" />
                    <asp:BoundField DataField="DealerEmail" HeaderText="Email" />
                    <asp:BoundField DataField="DealerAddress" HeaderText="Address" />
                    <asp:BoundField DataField="CompanyName" HeaderText="Company" />
                    <asp:BoundField DataField="ServedBy" HeaderText="ServedBy" />
                    <asp:BoundField DataField="DateTime" HeaderText="ServedOn" />                  
                </Columns>               
            </asp:GridView>         
        </div>
     </div>   
</asp:Content>
