<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Real_Estate.Web_Forms.Test" %>

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
    </form>
</body>
</html>
