<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelTicket.aspx.cs" Inherits="AIRLINES_PROJECT.WebForm3" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Cancel Ticket</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #ffb6c1, #e0ffe0, #e0ffff);
            font-family: Arial, sans-serif;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            margin: 60px auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            width: 600px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 20px;
        }

        input[type=text] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .form-buttons {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            background-color: #dc3545;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            margin: 0 10px;
        }

        .btn:hover {
            background-color: #c82333;
        }

        .status-label {
            text-align: center;
            font-weight: bold;
            color: green;
            margin-top: 20px;
        }

        .nav-links {
            text-align: right;
            padding: 10px 30px;
        }

        .nav-links a {
            margin-left: 15px;
            font-weight: bold;
            color: #0033cc;
            text-decoration: none;
        }

        .nav-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="nav-links">
            <a href="EmployeeDashboard.aspx">Home</a>
            <a href="EmpMenu.aspx">Menu</a>
            <a href="Contact.aspx">Contact Us</a>
            <a href="Logout.aspx">SignOut</a>
        </div>

        <div class="form-container">
            <h2>Cancel Ticket</h2>

            <label>Enter Seat Number to Cancel</label>
            <asp:TextBox ID="txtSeatNo" runat="server" />

            <div class="form-buttons">
                <asp:Button ID="btnCancelTicket" runat="server" Text="Cancel Ticket"
                    CssClass="btn"
                    OnClientClick="return confirm('Are you sure you want to cancel this ticket?');"
                    OnClick="btnCancelTicket_Click" />
            </div>

            <asp:Label ID="lblStatus" runat="server" CssClass="status-label" />
        </div>
    </form>
</body>
</html>