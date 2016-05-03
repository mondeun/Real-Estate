<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search</title>
</head>
<body>
<form id="HtmlForm" runat="server">
    <div>
        <a href="/">Back</a>
        <br />
    </div>
    <div>
        
        <asp:GridView ID="GridView1" runat="server" DataSourceID="test">
        </asp:GridView>
        <asp:SqlDataSource ID="test" runat="server"></asp:SqlDataSource>
        
    </div>
</form>
</body>
</html>
