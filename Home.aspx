<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AIRLINES_PROJECT.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vistara Operations Management Portal</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animate.css for animations -->

    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #ffe6e6, #e6f2ff);
            font-family: 'Segoe UI', sans-serif;
        }

        .navbar {
            background: #4b0082;
            padding: 1rem 2rem;
            box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.2);
        }

        .navbar-brand, .nav-link {
            color: white !important;
            font-weight: 600;
            font-size: 18px;
        }

        .nav-link:hover {
            color: #ffcc00 !important;
        }

        .main-content {
            text-align: center;
            padding: 80px 20px;
            animation: fadeIn 2s ease-in-out;
        }

        .main-content h2 {
            color: #4b0082;
            font-size: 36px;
            margin-bottom: 20px;
            animation: slideInDown 1s ease-in-out;
        }

        .main-content p {
            font-size: 20px;
            color: #333;
            animation: slideInUp 1s ease-in-out;
        }

        .airplane-img {
            width: 500px;
            margin-top: 30px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: zoomIn 1.5s ease;
        }

        
        

        .footer {
            background-color: #4b0082;
            color: white;
            text-align: center;
            padding: 12px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        @media (max-width: 576px) {
            .main-content {
                padding: 50px 10px;
            }

            .main-content h2 {
                font-size: 26px;
            }

            .airplane-img {
                width: 500px;
            }
        }

        /* Custom animation keyframes */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideInDown {
            from { transform: translateY(-30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes slideInUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes zoomIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand" href="#">✈ Vistara Portal</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <asp:HyperLink ID="hlLogin" NavigateUrl="~/Login.aspx" CssClass="nav-link" runat="server">Login</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="hlContact" NavigateUrl="~/Contact.aspx" CssClass="nav-link" runat="server">Contact Us</asp:HyperLink>
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="hlAbout" NavigateUrl="~/About.aspx" CssClass="nav-link" runat="server">About Us</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main Section -->
        <div class="main-content">
            <h2 class="animate__animated animate__fadeInDown">Welcome to Vistara Airways</h2>
            <p class="animate__animated animate__fadeInUp">Smoothly manage flight schedules, crew, and passengers in one place.</p>
            <asp:Image ID="imgPlane" runat="server" ImageUrl="~/Content/Images/plane.png" CssClass="airplane-img" />
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; 2025 Vistara Airways. Built with 💜 for seamless airline operations.
        </div>
    </form>
</body>
</html>