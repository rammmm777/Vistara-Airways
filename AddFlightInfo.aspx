<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFlightInfo.aspx.cs" Inherits="AIRLINES_PROJECT.AddFlightInfo_aspx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add Flight’s Information</title>
    <style>
        body {
            background: linear-gradient(to right, #f8a5c2, #dff9fb);
            font-family: 'Segoe UI', sans-serif;
            padding: 20px;
        }
        .container {
            width: 80%;
            margin: auto;
            background: linear-gradient(to right, #ffffff, #c8f7c5);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        .form-section {
            margin-bottom: 20px;
        }
        .form-section label {
            width: 150px;
            display: inline-block;
            font-weight: bold;
        }
        .form-section input, .form-section select {
            padding: 5px;
            width: 200px;
        }
        .form-buttons {
            margin-top: 20px;
        }
        .form-buttons input {
            padding: 10px 20px;
            margin-right: 10px;
            font-weight: bold;
            cursor: pointer;
        }
        .success, .error {
            margin-top: 15px;
            font-weight: bold;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
        .navbar {
            text-align: right;
            margin-bottom: 20px;
        }
        .navbar a {
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
            color: darkblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
           <a href="AdminDashboard.aspx">Home</a>
           <a href="Menu.aspx">Menu</a>
           <a href="Contact.aspx">Contact Us</a>
           <a href="Login.aspx">SignOut</a>
        </div>

        <div class="container">
            <h2>Add Flight’s Information</h2>

            <div class="form-section">
                <label>Flight Code:</label>
                <asp:TextBox ID="txtFlightCode" runat="server" />
            </div>

            <div class="form-section">
                <label>Source:</label>
                <asp:TextBox ID="txtSource" runat="server" />
            </div>

            <div class="form-section">
                <label>Destination:</label>
                <asp:TextBox ID="txtDestination" runat="server" />
            </div>

            <div class="form-section">
                <label>Arrival Time:</label>
                <asp:TextBox ID="txtArrival" runat="server" placeholder="HH:MM" TextMode="Time" />
            </div>

            <div class="form-section">
                <label>Departure Time:</label>
                <asp:TextBox ID="txtDeparture" runat="server" placeholder="HH:MM" TextMode="Time" />
            </div>

            <div class="form-section">
                <label>Flight Name:</label>
                <asp:TextBox ID="txtFlightName" runat="server" />
            </div>

            <div class="form-section">
                <label>Executive Seats:</label>
                <asp:TextBox ID="txtExecSeats" runat="server" />
                <label style="margin-left: 40px;">Executive Fare:</label>
                <asp:TextBox ID="txtExecFare" runat="server" />
            </div>

            <div class="form-section">
                <label>Economy Seats:</label>
                <asp:TextBox ID="txtEcoSeats" runat="server" />
                <label style="margin-left: 40px;">Economy Fare:</label>
                <asp:TextBox ID="txtEcoFare" runat="server" />
            </div>

            <div class="form-section">
                <label>General Seats:</label>
                <asp:TextBox ID="txtGenSeats" runat="server" />
                <label style="margin-left: 40px;">General Fare:</label>
                <asp:TextBox ID="txtGenFare" runat="server" />
            </div>

            <div class="form-buttons">
                <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="Menu.aspx" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="success" Visible="false" />
        </div>
    </form>
</body>
</html>