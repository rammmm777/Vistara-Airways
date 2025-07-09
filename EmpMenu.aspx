<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpMenu.aspx.cs" Inherits="AIRLINES_PROJECT.EmpMenu" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vistara Airways - Employee Menu</title>

    <!-- Google Fonts + Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(to right, #d4f1f4, #d4fddf);
        }

        .navbar {
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 1rem 2rem;
        }

        .navbar-nav .nav-link {
            font-weight: 600;
            color: #0b235a !important;
            margin-left: 20px;
        }

        .nav-link:hover {
            color: #ff6600 !important;
        }

        .menu-title {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #004d40;
            margin-top: 50px;
        }

        .menu-buttons {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 30px;
        }

        .btn-menu {
            width: 260px;
            margin: 10px;
            padding: 12px;
            font-size: 18px;
            border-radius: 12px;
            background-color: white;
            color: #cc3300;
            font-weight: 600;
            border: none;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .btn-menu:hover {
            transform: translateY(-2px);
            background-color: #ffe0cc;
            color: #b30000;
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }

        .plane-icon {
            display: block;
            width: 100px;
            margin: 50px auto 0;
            filter: drop-shadow(2px 4px 6px rgba(0,0,0,0.2));
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="#">Vistara Airways</a>
                <div class="collapse navbar-collapse justify-content-end">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <asp:HyperLink NavigateUrl="~/Home.aspx" CssClass="nav-link" runat="server">Home</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink NavigateUrl="~/EmpMenu.aspx" CssClass="nav-link" runat="server">Menu</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink NavigateUrl="~/Contact.aspx" CssClass="nav-link" runat="server">Contact Us</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink NavigateUrl="~/Login.aspx" CssClass="nav-link" runat="server">SignOut</asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Content -->
        <div class="menu-title">Employee Menu</div>

        <div class="menu-buttons">
            <asp:Button ID="btnBook" runat="server" Text="Book Ticket" CssClass="btn-menu" PostBackUrl="~/BookTicket.aspx" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel Ticket" CssClass="btn-menu" PostBackUrl="~/CancelTicket.aspx" />
            <asp:Button ID="btnHome" runat="server" Text="Back to Home" CssClass="btn-menu" PostBackUrl="~/EmployeeDashboard.aspx" />
            <asp:Button ID="btnMyBookings" runat="server" Text="Flight Details" CssClass="btn-menu" PostBackUrl="~/FDetails.aspx" />
        </div>

        
        
    </form>
</body>
</html>