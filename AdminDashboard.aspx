<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="AIRLINES_PROJECT.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vistara Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1a1a40;
            padding: 15px 30px;
            color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        .navbar h2 {
            margin: 0;
            font-size: 24px;
        }
        .nav-links a,
        .nav-links asp\:LinkButton {
            color: white;
            text-decoration: none;
            margin-left: 25px;
            font-weight: 600;
            font-size: 16px;
            transition: all 0.3s ease-in-out;
        }
        .nav-links a:hover,
        .nav-links asp\:LinkButton:hover {
            color: #f39c12;
            transform: scale(1.05);
        }
        .dashboard-content {
            padding: 40px;
            text-align: center;
            color: white;
        }
        .dashboard-content h3 {
            font-size: 32px;
            margin-bottom: 10px;
            text-shadow: 1px 1px 3px #000;
        }
        .dashboard-content p {
            font-size: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <h2>Vistara Admin Dashboard</h2>
            <div class="nav-links">
                <a href="AdminDashboard.aspx">Home</a>
                <a href="Menu.aspx">Menu</a>
                <a href="Contact.aspx">Contact Us</a>
                <asp:LinkButton ID="lnkSignOut" runat="server" OnClick="lnkSignOut_Click" CssClass="link">Sign Out</asp:LinkButton>
            </div>
        </div>

        <div class="dashboard-content">
            <h3>Welcome, Administrator!</h3>
            <p>Use the navigation above to manage the Vistara Operations Portal.</p>
            <asp:Image ID = "imgPlane" runat="server" ImageUrl="~/Content/Images/admin_dashboard.png" CssClass="airplane-img" />
        </div>
    </form>
</body>
</html>
