<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AIRLINES_PROJECT.AboutUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - Vistara Airways</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #dfefff, #ffffff);
            animation: fadeIn 1s ease-in;
        }

        .card {
            background-color: #ffffff;
            width: 600px;
            margin: 100px auto;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            color: #003366;
            margin-bottom: 20px;
        }

        p {
            color: #333;
            font-size: 18px;
            line-height: 1.6;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/Images/air.png" Width="80" />
            <h2>About Vistara Airways</h2>
            <p>
                Vistara Airways is committed to providing world-class travel experiences.<br />
                Our operations are streamlined with real-time access to flights, crew, and passengers.<br />
                We aim to deliver excellence through innovative aviation solutions.
            </p>
        </div>
    </form>
</body>
</html>