<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="AIRLINES_PROJECT.Menu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Vistara Airways - Admin Menu</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #e0ffe0);
        }

        .navbar {
            background-color: #ffffff;
            padding: 15px;
            text-align: right;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .navbar a {
            margin: 0 15px;
            text-decoration: none;
            color: #1a237e;
            font-weight: bold;
            padding: 6px 12px;
            transition: background 0.3s ease, color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #c8e6c9;
            border-radius: 6px;
            color: #004d40;
        }

        .content {
            padding: 40px 0;
            text-align: center;
        }

        .menu-title {
            font-size: 32px;
            font-weight: bold;
            color: #004d40;
            margin-bottom: 30px;
            animation: fadeIn 1s ease-in-out;
        }

        .menu-box-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        .menu-box {
            background-color: #ffffff;
            width: 280px;
            padding: 18px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: slideUp 0.6s ease-in-out;
        }

        .menu-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.25);
        }

        .menu-box a {
            text-decoration: none;
            font-size: 18px;
            color: #d84315;
            font-weight: 600;
        }

        .menu-box a:hover {
            color: #b71c1c;
        }

        .menu-image {
            margin-top: 35px;
            max-width: 400px;
            border-radius: 14px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in;
        }
        

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Navigation Bar -->
        <div class="navbar">
            <a href="AdminDashBoard.aspx">Home</a>
            <a href="Menu.aspx">Menu</a>
            <a href="Contact.aspx">Contact Us</a>
            <a href="Login.aspx">SignOut</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <div class="menu-title">Admin Menu</div>

            <div class="menu-box-container">
                
                <div class="menu-box">
                    <a href="AddFlightInfo.aspx" class="menu-button">Add Flights Information</a>
                </div>
                <div class="menu-box">
                    <a href="ModifyFlightInfo.aspx" class="modify-button">Modify Flights Information</a>
                </div>
                <div class="menu-box">

                    <a href="DeleteFlightInfo.aspx" class="delete-button">Delete Flights Information</a>
                </div>
                <div class="menu-box">
                    <a href="AdminDashBoard.aspx">Back to Home</a>
                </div>
                <div class="menu-box">
                    <a href="FlightDetails.aspx" class="Details-button">Flight Details</a>
                </div>
            </div>

            
        </div>
    </form>
</body>
</html>