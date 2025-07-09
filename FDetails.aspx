<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FDetails.aspx.cs" Inherits="AIRLINES_PROJECT.BookingDetails" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Flight and Booking Details</title>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #e0f9f1, #ffe5ec);
        }

        .container {
            margin: 40px auto;
            width: 90%;
            text-align: center;
        }

        h2 {
            color: #0d3b66;
        }

        .grid-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 30px;
        }

        .grid-box {
            width: 48%;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .grid-box h3 {
            margin-bottom: 15px;
            color: #dc143c;
        }

        .styled-grid {
            width: 100%;
            border: 1px solid #ddd;
            border-collapse: collapse;
        }

        .styled-grid th, .styled-grid td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .styled-grid th {
            background-color: #f0f0f0;
            color: #333;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Flight Details</h2>
            <div class="grid-container">
                <div class="grid-box">
                    <h3>Flight Details</h3>
                    
                    <asp:GridView ID="gvFlights" runat="server" CssClass="styled-grid" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                
               
                    <asp:Button ID="btnBack" runat="server" Text="Back to Employee Menu" 
    OnClick="btnBack_Click" 
    Style="margin-top: 30px; padding: 10px 20px; font-size: 16px; background-color:#ff6a00; color: white; border: none; border-radius: 5px; cursor: pointer;" />
               
            
        </div>
    </form>
</body>
</html>