﻿<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Search</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet"/>
</head>
<body style="background: #fff">
<form id="HtmlForm" runat="server">
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/Home/Search">Back</a></li>
                    <li><a href="/">Home</a></li>
                </ul>
            </div>
        </div>
    </div>
<br/>
<br/>

    <div class="container body-content">
        <h3 class="h3">Lista alla objekt från ett visst område.</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="realEstateDB" CssClass="table table-hover table-striped" DataKeyNames="RealEstateObjectID">
            <Columns>
                <asp:BoundField DataField="RealEstateObjectID" HeaderText="RealEstateObjectID" SortExpression="RealEstateObjectID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Contract" HeaderText="Contract" SortExpression="Contract" />
                <asp:BoundField DataField="EstateType" HeaderText="EstateType" SortExpression="EstateType" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="DateOnMarket" HeaderText="DateOnMarket" SortExpression="DateOnMarket" />
                <asp:BoundField DataField="SaleDate" HeaderText="SaleDate" SortExpression="SaleDate" />
                <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="realEstateDB" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateContext %>" SelectCommand="spAllObjCity" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="City" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        City
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
    <div class=" divider nav-divider">
        <hr />
    </div>
</form>
</body>
</html>