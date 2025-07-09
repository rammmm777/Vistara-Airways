<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="AIRLINES_PROJECT.EmployeeDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vistara Employee DashBoard</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(to right, #1e3c72, #2a5298);
            color: #fff;
        }

        .navbar {
            background-color: #1b1440;
            padding: 1rem 2rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 22px;
            color: white;
        }

        .navbar-nav .nav-link {
            color: #fff;
            margin-right: 20px;
            font-weight: 500;
        }

        .navbar-nav .nav-link:hover {
            color: #ffcc00;
        }

        .main-section {
            text-align: center;
            margin-top: 80px;
        }

        .main-section h2 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .main-section p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        .btn-menu {
            display: block;
            width: 200px;
            margin: 10px auto;
            padding: 12px 0;
            font-size: 18px;
            font-weight: 600;
            color: #fff;
            background-color: #4b0082;
            border: none;
            border-radius: 8px;
            transition: 0.3s ease;
        }

        .btn-menu:hover {
            background-color: #6a0dad;
            color: #ffe600;
        }

        .plane-img {
            width: 420px;
            margin: 40px 0;
            filter: drop-shadow(0px 5px 10px rgba(0,0,0,0.4));
        }

        @media (max-width: 576px) {
            .plane-img {
                width: 100%;
            }

            .btn-menu {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand" href="#">Vistara Employee Dashboard</a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <asp:HyperLink NavigateUrl="~/EmployeeDashboard.aspx" CssClass="nav-link" runat="server">Home</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink NavigateUrl="~/EmpMenu.aspx" CssClass="nav-link" runat="server">Menu</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink NavigateUrl="~/Contact.aspx" CssClass="nav-link" runat="server">Contact Us</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink NavigateUrl="~/Login.aspx" CssClass="nav-link" runat="server">Sign Out</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="main-section">
            <h2>Welcome, Employee!</h2>
            <p>Use the buttons below to manage ticket operations.</p>

            <asp:Image ID="imgPlane" runat="server" ImageUrl="~/Content/Images/plane.png" CssClass="plane-img" />

            
        </div>
    </form>
</body>
</html>