<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BTL_TuDienTraCuuu.Login" %>

<!DOCTYPE html>
<html lang="vi">
<head runat="server">
    <meta charset="utf-8" />
    <title>Đăng Nhập Quản Trị</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #000000;
            display: flex;
            justify-content: center;
            padding-top: 100px;
            margin: 0;
        }
        .login-container {
            width: 100%;
            max-width: 350px;
            border: 2px solid #000000;
            padding: 20px 30px;
        }
        h2 {
            text-align: center;
            text-transform: uppercase;
            border-bottom: 2px solid #000000;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .input-group input {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            border: 2px solid #000000;
            font-size: 16px;
        }
        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: #000000;
            color: #ffffff;
            border: 2px solid #000000;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn-login:hover {
            background-color: #ffffff;
            color: #000000;
        }
        .error-message {
            color: red;
            font-weight: bold;
            display: block;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Đăng Nhập</h2>
            
            <div class="input-group">
                <label>Tài khoản:</label>
                <asp:TextBox ID="txtUsername" runat="server" placeholder="Nhập tài khoản"></asp:TextBox>
            </div>
            
            <div class="input-group">
                <label>Mật khẩu:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Nhập mật khẩu"></asp:TextBox>
            </div>
            
            <asp:Button ID="btnLogin" runat="server" Text="VÀO TRANG QUẢN TRỊ" CssClass="btn-login" OnClick="btnLogin_Click" />
            
            <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>
