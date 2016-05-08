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
        <h3 class="h3">Lista alla objekt över ett visst pris.</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="realEstateDB" CssClass="table table-hover table-striped">
            <Columns>
                <asp:BoundField DataField="Contract" HeaderText="Contract" SortExpression="Contract" />
                <asp:BoundField DataField="Estate type" HeaderText="Estate type" SortExpression="Estate type" />
                <asp:BoundField DataField="Agent full name" HeaderText="Agent full name" SortExpression="Agent full name" ReadOnly="True" />
                <asp:BoundField DataField="Customer full name" HeaderText="Customer full name" SortExpression="Customer full name" ReadOnly="True" />
                <asp:BoundField DataField="Square meters" HeaderText="Square meters" SortExpression="Square meters" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Zip code" HeaderText="Zip code" SortExpression="Zip code" />
                <asp:BoundField DataField="Date on Market" HeaderText="Date on Market" SortExpression="Date on Market" />
                <asp:BoundField DataField="Sale Date" HeaderText="Sale Date" SortExpression="Sale Date" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="realEstateDB" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateContext %>" SelectCommand="AllObjectOverACertainPrice" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="price" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        Price
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
    <div class=" divider nav-divider">
        <hr />
    </div>
</form>
</body>
</html>
