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
        <h3 class="h3">Lista aktuella visningar för en viss stad.</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="realEstateDB" CssClass="table table-hover table-striped" DataKeyNames="RealEstateObjectID,CityID1,ZipCodeID1,ViewingID">
            <Columns>
                <asp:BoundField DataField="RealEstateObjectID" HeaderText="RealEstateObjectID" SortExpression="RealEstateObjectID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Contract" HeaderText="Contract" SortExpression="Contract" />
                <asp:BoundField DataField="EstateType" HeaderText="EstateType" SortExpression="EstateType" />
                <asp:BoundField DataField="AgentID" HeaderText="AgentID" SortExpression="AgentID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                <asp:BoundField DataField="Sqm" HeaderText="Sqm" SortExpression="Sqm" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="CityID" HeaderText="CityID" SortExpression="CityID" />
                <asp:BoundField DataField="ZipCodeID" HeaderText="ZipCodeID" SortExpression="ZipCodeID" />
                <asp:BoundField DataField="DateOnMarket" HeaderText="DateOnMarket" SortExpression="DateOnMarket" />
                <asp:BoundField DataField="SaleDate" HeaderText="SaleDate" SortExpression="SaleDate" />
                <asp:BoundField DataField="CityID1" HeaderText="CityID1" InsertVisible="False" ReadOnly="True" SortExpression="CityID1" />
                <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" />
                <asp:BoundField DataField="ZipCodeID1" HeaderText="ZipCodeID1" InsertVisible="False" ReadOnly="True" SortExpression="ZipCodeID1" />
                <asp:BoundField DataField="ZipCodes" HeaderText="ZipCodes" SortExpression="ZipCodes" />
                <asp:BoundField DataField="PricePerSqm" HeaderText="PricePerSqm" SortExpression="PricePerSqm" />
                <asp:BoundField DataField="ViewingID" HeaderText="ViewingID" InsertVisible="False" ReadOnly="True" SortExpression="ViewingID" />
                <asp:BoundField DataField="RealEstateObjectID1" HeaderText="RealEstateObjectID1" SortExpression="RealEstateObjectID1" />
                <asp:BoundField DataField="AgentID1" HeaderText="AgentID1" SortExpression="AgentID1" />
                <asp:BoundField DataField="ViewingStart" HeaderText="ViewingStart" SortExpression="ViewingStart" />
                <asp:BoundField DataField="ViewingStop" HeaderText="ViewingStop" SortExpression="ViewingStop" />
                <asp:BoundField DataField="MaximumNoCustomerPerViewing" HeaderText="MaximumNoCustomerPerViewing" SortExpression="MaximumNoCustomerPerViewing" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="realEstateDB" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateContext %>" SelectCommand="ViewingForACertainCity" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TxtBoxCity" Name="city" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TxtBoxZip" Name="zipCode" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="Calendar1" Name="viewingDate" PropertyName="SelectedDate" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
        City

        <asp:TextBox ID="TxtBoxCity" runat="server"></asp:TextBox>

        <br/>
        Zip Code 
        <asp:TextBox ID="TxtBoxZip" runat="server"></asp:TextBox>
        <br/>
        Viewing Date
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
    </div>
    <div class=" divider nav-divider">
        <hr />
    </div>
</form>
</body>
</html>
