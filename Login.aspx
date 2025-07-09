<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AIRLINES_PROJECT.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vistara Airways Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f8cdd9, #dbeeff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            width: 300px;
            text-align: center;
        }

        .container h2 {
            margin-bottom: 20px;
        }

        .container input[type="text"],
        .container input[type="password"],
        .container input[type="email"] {
            width: 90%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .container input[type="submit"],
        .container button {
            background-color: #007bff;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .container a {
            display: block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }

        .container a:hover {
            text-decoration: underline;
        }

        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <asp:Image ID="imgPlane" runat="server" ImageUrl="~/Content/Images/plane2.png" CssClass="airplane-img" Height="220px" Width="249px" />
            <h2>Vistara Airways</h2>

            <asp:RadioButtonList ID="rblRole" runat="server" AutoPostBack="true" 
                OnSelectedIndexChanged="rblRole_SelectedIndexChanged" RepeatDirection="Horizontal">
                <asp:ListItem Text="Administration" Value="Admin"></asp:ListItem>
                <asp:ListItem Text="Employee" Value="Employee"></asp:ListItem>
            </asp:RadioButtonList>

            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                
                <!-- Admin Login -->
                <asp:View ID="ViewAdmin" runat="server">
                    <asp:TextBox ID="txtAdminUsername" runat="server" placeholder="Username"></asp:TextBox><br />
                    <asp:TextBox ID="txtAdminPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox><br />
                    <asp:Button ID="btnAdminLogin" runat="server" Text="Login" OnClick="btnAdminLogin_Click" />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                </asp:View>

                <!-- Employee Section -->
                <asp:View ID="ViewEmployee" runat="server">
                    <asp:MultiView ID="MultiViewEmployee" runat="server" ActiveViewIndex="0">

                        <!-- Employee Sign In -->
                        <asp:View ID="ViewEmpSignIn" runat="server">
                            <asp:TextBox ID="txtEmpUsername" runat="server" placeholder="Username"></asp:TextBox><br />
                            <asp:TextBox ID="txtEmpPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox><br />
                            <asp:Button ID="btnEmpLogin" runat="server" Text="Sign In" OnClick="btnEmpLogin_Click" /><br />
                            <asp:LinkButton ID="lnkGoToSignUp" runat="server" OnClick="lnkGoToSignUp_Click">New user? Sign Up</asp:LinkButton>
                        </asp:View>

                        <!-- Employee Sign Up -->
                        <asp:View ID="ViewEmpSignUp" runat="server">
                            <asp:TextBox ID="txtNewEmpUsername" runat="server" placeholder="Username"></asp:TextBox><br />
                            <asp:TextBox ID="txtNewEmpEmail" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox><br />
                            <asp:TextBox ID="txtNewEmpPassword" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox><br />
                            <asp:Button ID="btnEmpSignUp" runat="server" Text="Sign Up" OnClick="btnEmpSignUp_Click" /><br />
                            <asp:LinkButton ID="lnkGoToSignIn" runat="server" OnClick="lnkGoToSignIn_Click">Back to Sign In</asp:LinkButton>
                        </asp:View>

                    </asp:MultiView>
                </asp:View>

            </asp:MultiView>

        </div>
    </form>
</body>
</html>