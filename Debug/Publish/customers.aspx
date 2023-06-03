<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customers.aspx.cs" Inherits="courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <style>
        body {
                 background:black;
            color: white;
             font-family: "Times New Roman", Times, serif;
             height:1500px;
            
        }
        .MyGridView {
    width: 100%;
    border-collapse: collapse;
    font-family: Arial, sans-serif;
            
        }

          .table-title {
            text-align: center;
            padding-top: 20px;
            font-size: 1.5em;
            color: white;
            padding-bottom:20px;
            text-decoration: underline;
        }

.MyGridView th, .MyGridView td {
    border: 1px solid #ddd;
    padding: 8px;
    
}

.HeaderStyle {
    background-color: white;
    color: black;
}

.RowStyle {
    background-color: grey;
}

.AltRowStyle {
    background-color: black;
}

          .table-title {
            text-align: center;
            padding-top: 20px;
            font-size: 1.5em;
            color: white;
            padding-bottom:20px;
            text-decoration: underline;
        }
</style>

</head>
<body>
    <form id="form1" runat="server">
          <div class="table-title">
            CURRENT CUSTOMERS
        </div>
           <div>
    
          
            <asp:GridView ID="GridView1" runat="server" CssClass="MyGridView">
    <HeaderStyle CssClass="HeaderStyle" />
    <RowStyle CssClass="RowStyle" />
    <AlternatingRowStyle CssClass="AltRowStyle" />
</asp:GridView>

             </div>
         <div>
    
            <asp:Label ID="Label1" style="position:absolute; top: 675px; left: 38px; font-weight: 700; text-decoration: underline;" runat="server" Text="ENTER CUSTOMER ID FROM WHICH TO TRANSFER"></asp:Label>
    
            <asp:TextBox ID="TextBox1" style="position:absolute; top: 807px; left: 601px;" runat="server"></asp:TextBox>
    
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="position:absolute; top: 888px; left: 457px; font-weight: 700;" Text="TRANSFER" BackColor="#999999" />
    
            <asp:GridView ID="GridView2" runat="server" CssClass="MyGridView">
    <HeaderStyle CssClass="HeaderStyle" />
    <RowStyle CssClass="RowStyle" />
    <AlternatingRowStyle CssClass="AltRowStyle" />
</asp:GridView>
    
             <asp:Label ID="LabelError" style="position:absolute; top: 853px; left: 473px; height: 27px;" runat="server" CssClass="error-message" ForeColor="Red"></asp:Label>
    
            <asp:TextBox ID="TextBox11" style="position:absolute; top: 676px; left: 602px;" runat="server"></asp:TextBox>
    
            
    
            <asp:Label ID="Label8" style="position:absolute; top: 805px; left: 224px; font-weight: 700; text-decoration: underline;" runat="server" Text="ENTER AMOUNT TO TRANSFER"></asp:Label>
    
        </div>
        <div>
    
            <asp:Label ID="Label9" style="position:absolute; top: 744px; left: 202px; font-weight: 700; text-decoration: underline;" runat="server" Text="ENTER RECIEVING CUSTOMER ID"></asp:Label>
    
            <asp:TextBox ID="TextBox12" style="position:absolute; top: 741px; left: 603px;" runat="server"></asp:TextBox>
    
        </div>
    </form>
</body>
</html>
