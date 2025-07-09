<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="AIRLINES_PROJECT.Payment" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UPI Payment - Vistara Airways</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #4a00e0, #8e2de2);
            color: white;
            text-align: center;
            padding: 50px;
        }

        .payment-container {
            background-color: rgba(0, 0, 0, 0.4);
            padding: 30px;
            border-radius: 15px;
            display: inline-block;
        }

        .qr-image {
            margin-top: 20px;
        }

        label {
            font-size: 18px;
            margin-bottom: 10px;
            display: block;
        }
        .styled-button {
            background: linear-gradient(to right, #28a745, #218838);
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
            margin-top: 20px;
        }
            .styled-button:hover {
                background: linear-gradient(to right, #218838, #1e7e34);
            }
            .styled-button:active {
                transform: scale(0.98);
            }
    
        
    

       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="payment-container">
            <h2>Vistara Airways UPI Payment</h2>
            <asp:Label ID="lblPassenger" runat="server" /><br />
            <asp:Label ID="lblEmail" runat="server" /><br />
            <asp:Label ID="lblBookingID" runat="server" /><br />
            <asp:Label ID="lblAmount" runat="server" Font-Size="Large" ForeColor="Yellow" /><br />

            <div class="qr-image">
                <asp:Image ID="imgQRCode" runat="server" Width="250px" Height="250px" />
               
            </div>
                          <asp:Button ID="btnCompletePayment" runat="server" Text="Complete Payment"
    CssClass="styled-button" OnClick="btnCompletePayment_Click" />

            <p><asp:Label ID="lblStatus" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>

               </p>
        </div>
    </form>
</body>
</html>