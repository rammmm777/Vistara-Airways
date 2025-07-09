<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookTicket.aspx.cs" Inherits="AIRLINES_PROJECT.BookTicket" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Book Ticket</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #ffdde1, #eeffdd, #ddf1ff);
        }
        .form-container {
            background-color: #ffffffee;
            width: 700px;
            padding: 30px;
            margin: 60px auto;
            border-radius: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .form-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        label {
            width: 150px;
            font-weight: bold;
        }
        .row input, .row select, .row textarea {
            flex: 1;
            padding: 6px;
            border-radius: 6px;
            border: 1px solid #aaa;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button-container input {
            padding: 10px 20px;
            border: none;
            background-color: #2196F3;
            color: white;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            margin: 0 10px;
        }
        .button-container input:hover {
            background-color: #1976D2;
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
            <div class="form-title">Book Flight Ticket</div>

            <div class="row">
                <label>Flight Name:</label>
                <asp:DropDownList ID="ddlFlightName" runat="server" AutoPostBack="true"
    OnSelectedIndexChanged="ddlFlightName_SelectedIndexChanged" CssClass="form-control" />
            </div>
            <div class="row">
                <label>Fly Date:</label>
                <asp:TextBox ID="txtFlyDate" runat="server" TextMode="Date" />
            </div>
            <div class="row">
                <label>Passenger Name:</label>
                <asp:TextBox ID="txtPassenger" runat="server" />
            </div>
            <div class="row">
                <label>Address:</label>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2" />
            </div>
            <div class="row">
                <label>Phone No:</label>
                <asp:TextBox ID="txtPhone" runat="server" />
            </div>
            <div class="row">
                <label>Email ID:</label>
                <asp:TextBox ID="txtEmail" runat="server" />
            </div>
            <div class="row">
                <label>Class:</label>
                <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="true"
    OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" CssClass="form-control">
    <asp:ListItem Text="--Select Class--" Value="" />
    <asp:ListItem Text="Executive" Value="Executive" />
    <asp:ListItem Text="Economy" Value="Economy" />
    <asp:ListItem Text="General" Value="General" />
</asp:DropDownList>

            </div>
            <div class="row">
                <label>Seat No:</label>
                <asp:TextBox ID="txtSeatNo" runat="server" />
            </div>
            <div class="row">
                <label>Amount:</label>
                <asp:DropDownList ID="ddlAmount" runat="server" AutoPostBack="true" CssClass="form-control">
</asp:DropDownList>
<asp:RequiredFieldValidator ID="rfvAmount" runat="server"
    ControlToValidate="ddlAmount"
    InitialValue="--Select Amount--"
    ErrorMessage="Please select amount"
    ForeColor="Red" Display="Dynamic" />

            </div>
            <div class="row">
                <label>Fare:</label>
               <asp:DropDownList ID="ddlFare" runat="server" AutoPostBack="false" >
    <asp:ListItem Text="--Select Fare--" Value="0" />
</asp:DropDownList>
            </div>

            <div class="button-container">
                <asp:Button ID="btnBook" runat="server" Text="Book Ticket" OnClick="btnBook_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="window.location.href='EmpMenu.aspx'; return false;" />
            </div>
        </div>
        

    </form>
</body>
</html>