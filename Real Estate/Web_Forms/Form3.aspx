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
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="realEstateDB" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateContext %>" SelectCommand="ViewingForACertainCity" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="city" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList2" Name="zipCode" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="Calendar1" Name="viewingDate" PropertyName="SelectedDate" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateContext %>" SelectCommand="SELECT * FROM [City]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateContext %>" SelectCommand="SELECT [ZipCodeID], [ZipCodes] FROM [ZipCode]"></asp:SqlDataSource>
        City

        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityName">
        </asp:DropDownList>

        <br/>
        Zip Code 
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ZipCodes" DataValueField="ZipCodeID">
        </asp:DropDownList>
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
