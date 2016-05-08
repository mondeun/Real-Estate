<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookViewForm.aspx.cs" Inherits="Real_Estate.Web_Forms.BookView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Book Viewing</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet"/>
</head>

<body style="background: #fff">
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="/">Real Estate Management System</a></li>
                        <li><a href="/Viewings/Index">Back</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div>
            <h3>Book a viewing</h3>
            <asp:Label ID="ViewLabel" runat="server" Text="Viewing: "></asp:Label>
            <asp:DropDownList ID="ddlView" runat="server" DataSourceID="Viewings" DataTextField="View" DataValueField="ViewingID">
            </asp:DropDownList>
            <asp:Label ID="CustLabel" runat="server" Text="Customer: "></asp:Label>
            <asp:DropDownList ID="ddlCust" runat="server" DataSourceID="Customers" DataTextField="Full Name" DataValueField="PersonID">
            </asp:DropDownList>
            <asp:Button ID="Submit" runat="server" OnClick="Button1_Click" Text="Submit" />
            <br />
            <asp:Label ID="Output" runat="server"></asp:Label>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="BookedViewings" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="Viewing" HeaderText="Viewing" ReadOnly="True" SortExpression="Viewing" />
                    <asp:BoundField DataField="Customer" HeaderText="Customer" ReadOnly="True" SortExpression="Customer" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="BookedViewings" runat="server" ConnectionString="Data Source=.;Initial Catalog=RealEstateSystemDB;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT reo.[Address] + ' | ' + CONVERT(VARCHAR, v.ViewingStart,121) AS [Viewing],
(p.FirstName + ' ' + p.LastName) as [Customer]
FROM [ViewingCustomer] AS vc
INNER JOIN [Person] AS p ON vc.CustomerID = p.PersonID
INNER JOIN Viewing AS v ON vc.ViewingID = v.ViewingID
INNER JOIN RealEstateObject AS reo ON v.RealEstateObjectID = reo.RealEstateObjectID"></asp:SqlDataSource>

        </div>
        <div>
            <asp:SqlDataSource ID="Viewings" runat="server" ConnectionString="Data Source=.;Initial Catalog=RealEstateSystemDB;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT v.[ViewingID], v.[RealEstateObjectID], (reo.[Address] + ' | ' +CONVERT(VARCHAR,v.[ViewingStart],121)) AS [View] FROM [Viewing] AS v
INNER JOIN RealEstateObject AS reo ON v.RealEstateObjectID = reo.RealEstateObjectID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Customers" runat="server" ConnectionString="Data Source=.;Initial Catalog=RealEstateSystemDB;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT ([FirstName] +' '+ [LastName]) as [Full Name], [Discriminator], [PersonID] FROM [Person] WHERE ([Discriminator] = @Discriminator) ORDER BY [LastName]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Customer" Name="Discriminator" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>

</body>
</html>
