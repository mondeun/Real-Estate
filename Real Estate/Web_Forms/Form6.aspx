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
        <h3 class="h3">Lista alla mäklare för en viss stad.</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="realEstateDB" CssClass="table table-hover table-striped">
            <Columns>
                <asp:BoundField DataField="AgentID" HeaderText="AgentID" SortExpression="AgentID" />
                <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" />
                <asp:BoundField DataField="Profit" HeaderText="Profit" SortExpression="Profit" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="realEstateDB" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateContext %>" SelectCommand="AgentEarn" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="City" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="salePeriodStart" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Calendar2" DbType="Date" Name="salePeriodStop" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
        City
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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
