<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingDetails.aspx.cs" Inherits="AIRLINES_PROJECT.BookingDetails1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Booking Details</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            padding: 30px;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        .styled-gridview {
            width: 100%;
            border-collapse: collapse;
            margin: auto;
            background-color: white;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .styled-gridview th {
            background-color: #007BFF;
            color: white;
            padding: 10px;
            text-align: left;
        }

        .styled-gridview td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .styled-gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .styled-gridview tr:hover {
            background-color: #d0e7ff;
        }

        .delete-button {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 5px 12px;
            cursor: pointer;
            border-radius: 5px;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }
        .styled-button {
            background: linear-gradient(to right, #1e3c72, #2a5298);
            border: none;
            color: white;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

            .styled-button:hover {
                background: linear-gradient(to right, #2a5298, #1e3c72);
                transform: scale(1.05);
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Booking Details</h2>
        <asp:GridView ID="GridView1" runat="server" CssClass="styled-gridview"
            AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
            DataKeyNames="BookingID">
            <Columns>
                <asp:BoundField DataField="BookingID" HeaderText="Booking ID" />
                <asp:BoundField DataField="PassengerName" HeaderText="Passenger" />
                <asp:BoundField DataField="FlightName" HeaderText="Flight" />
                <asp:BoundField DataField="FlyDate" HeaderText="Date" />
                <asp:BoundField DataField="SeatNo" HeaderText="Seat" />
                <asp:BoundField DataField="Class" HeaderText="Class" />
                <asp:BoundField DataField="Fare" HeaderText="Fare" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete"
                            CommandName="DeleteBooking"
                            CommandArgument='<%# Eval("BookingID") %>'
                            CssClass="delete-button"
                            OnClientClick="return confirm('Are you sure you want to delete this booking?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
<asp:Button ID="btnReturn" runat="server" Text="⟵ Return to Menu" CssClass="styled-button" OnClick="btnReturn_Click" />
    </form>
</body>
</html>