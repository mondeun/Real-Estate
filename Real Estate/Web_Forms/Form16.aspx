<%@ Page Language="C#" %>

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
        <h3 class="h3">Lista alla objekt som har visning på ett visst datum.</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="realEstateDB" CssClass="table table-hover table-striped" DataKeyNames="ViewingID,RealEstateObjectID1">
            <Columns>
                <asp:BoundField DataField="ViewingID" HeaderText="ViewingID" SortExpression="ViewingID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="ViewingStart" HeaderText="ViewingStart" SortExpression="ViewingStart" />
                <asp:BoundField DataField="ViewingStop" HeaderText="ViewingStop" SortExpression="ViewingStop" />
                <asp:BoundField DataField="AgentID" HeaderText="AgentID" SortExpression="AgentID" />
                <asp:BoundField DataField="RealEstateObjectID" HeaderText="RealEstateObjectID" SortExpression="RealEstateObjectID" />
                <asp:BoundField DataField="MaximumNoCustomerPerViewing" HeaderText="MaximumNoCustomerPerViewing" SortExpression="MaximumNoCustomerPerViewing" />
                <asp:BoundField DataField="RealEstateObjectID1" HeaderText="RealEstateObjectID1" InsertVisible="False" ReadOnly="True" SortExpression="RealEstateObjectID1" />
                <asp:BoundField DataField="Contract" HeaderText="Contract" SortExpression="Contract" />
                <asp:BoundField DataField="EstateType" HeaderText="EstateType" SortExpression="EstateType" />
                <asp:BoundField DataField="sqm" HeaderText="sqm" SortExpression="sqm" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="DateOnMarket" HeaderText="DateOnMarket" SortExpression="DateOnMarket" />
                <asp:BoundField DataField="SaleDate" HeaderText="SaleDate" SortExpression="SaleDate" />
                <asp:BoundField DataField="AgentID1" HeaderText="AgentID1" SortExpression="AgentID1" />
                <asp:BoundField DataField="CityID" HeaderText="CityID" SortExpression="CityID" />
                <asp:BoundField DataField="ZipCodeID" HeaderText="ZipCodeID" SortExpression="ZipCodeID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="realEstateDB" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateContext %>" SelectCommand="ViewingOnCertainDate" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="date" PropertyName="SelectedDate" DbType="Date" />
            </SelectParameters>
        </asp:SqlDataSource>
        Date
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    </div>
    <div class=" divider nav-divider">
        <hr />
    </div>
</form>
</body>
</html>
