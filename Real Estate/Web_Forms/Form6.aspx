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
        <h3 class="h3">Visa hur mycket mäklaren har tjänat i en viss stad under en viss tidsperiod.</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="realEstateDB" CssClass="table table-hover table-striped">
            <Columns>
                <asp:BoundField DataField="Agent full name" HeaderText="Agent full name" SortExpression="Agent full name" ReadOnly="True" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Profit" HeaderText="Profit" SortExpression="Profit" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="realEstateDB" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateContext %>" SelectCommand="AgentEarn" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="City" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="salePeriodStart" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Calendar2" DbType="Date" Name="salePeriodStop" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateContext %>" SelectCommand="SELECT [CityName] FROM [City]"></asp:SqlDataSource>
        City
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityName">
        </asp:DropDownList>
        <br/>
        Sale Start
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <br/>
        Sale End
        <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
    </div>
    <div class=" divider nav-divider">
        <hr />
    </div>
</form>
</body>
</html>
