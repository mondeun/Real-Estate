<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookViewForm.aspx.cs" Inherits="Real_Estate.Web_Forms.BookView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>

    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlView" runat="server" DataSourceID="Viewings" DataTextField="View" DataValueField="ViewingID">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlCust" runat="server" DataSourceID="Customers" DataTextField="Full Name" DataValueField="PersonID" Height="16px" Width="157px">
            </asp:DropDownList>
            <asp:Button ID="Submit" runat="server" OnClick="Button1_Click" Text="Submit" />
            <br />
            <asp:Label ID="Output" runat="server"></asp:Label>

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
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="/Viewings/Index">Back</a></li>
                        <li><a href="/">Home</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <br />
    </form>

</body>
</html>
