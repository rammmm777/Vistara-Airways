<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlightDetails.aspx.cs" Inherits="AIRLINES_PROJECT.WebForm2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Flight Details</title>
    <style>
        body {
            background: linear-gradient(to right, #ccffff, #ccffcc);
            font-family: 'Segoe UI', sans-serif;
            padding: 20px;
        }
        .container {
            width: 95%;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 10px gray;
        }
        h2 {
            text-align: center;
            color: darkgreen;
        }
        .gridview-style {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .gridview-style th, .gridview-style td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        .gridview-style th {
            background-color: #00cc99;
            color: white;
        }
        .back-link {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            font-weight: bold;
            background-color: coral;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>All Flight Details</h2>
            <asp:GridView ID="gvFlightDetails" runat="server" AutoGenerateColumns="True" CssClass="gridview-style"></asp:GridView>
            <br />
            <a href="Menu.aspx" class="back-link">← Back to Menu</a>
        </div>
    </form>
</body>
</html>