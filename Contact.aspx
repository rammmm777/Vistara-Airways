<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AIRLINES_PROJECT.Contact" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us - Vistara Airways</title>
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

        label, input, textarea {
            display: block;
            width: 90%;
            margin: 10px auto;
            font-size: 16px;
        }

        input, textarea {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .submitBtn {
            background-color: #007bff;
            color: white;
            padding: 10px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .submitBtn:hover {
            background-color: #0056b3;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/Images/airplane.png" Width="80" />
            <h2>Contact Us</h2>
            <asp:Label ID="lblName" runat="server" Text="Name:" AssociatedControlID="txtName"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" />

            <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />

            <asp:Label ID="lblMessage" runat="server" Text="Message:" AssociatedControlID="txtMessage"></asp:Label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" />

            <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="submitBtn" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>