<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
                   body {
         background: radial-gradient(circle, #000000, #333333);
            color: white;
             font-family: "Times New Roman", Times, serif;
            
        }
    </style>
</head>
<body style="background: radial-gradient(circle, #FFFFFF, #87CEEB);  ">
    <form id="form1" runat="server">
     
            <asp:Label ID="Label1" style=" position:absolute;color:black; font-size:100px; top: 128px; left: 196px; height: 272px; width: 1071px; font-weight: 700;" runat="server" Text="WELCOME TO HOME"></asp:Label>
     
            <p>
     

            </p>
     
            <p>
     
            <asp:Button ID="Button1" style="position:absolute; top: 334px; left: 657px;"  OnClick="Button1_Click"  runat="server" Text="VIEW ALL CUSTOMERS" />
     
            </p>
     
    </form>
</body>
</html>
