<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BTL_TuDienTraCuuu.Default" %>

<!DOCTYPE html>
<html lang="vi">
<head runat="server">
    <meta charset="utf-8" />
    <title>Từ Điển Tra Cứu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #000000;
            margin: 0;
            padding: 0;
        }

        form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .navbar {
            width: 100%;
            background-color: #000000;
            color: #ffffff;
            display: flex;
            justify-content: space-between; 
            align-items: center;
            padding: 15px 30px; 
            box-sizing: border-box;
        }
        .navbar .logo {
            font-weight: bold;
            font-size: 18px;
            text-transform: uppercase;
        }
        .navbar .nav-links {
            display: flex;
            gap: 15px; 
        }
        .navbar .nav-links a {
            color: #ffffff;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            padding: 6px 12px;
            border: 1px solid transparent;
        }
        .navbar .nav-links a:hover {
            background-color: #ffffff;
            color: #000000;
            border: 1px solid #ffffff;
        }

        .container {
            width: 100%;
            max-width: 600px;
            border: 2px solid #000000;
            padding: 30px;
            margin-top: 50px;
            box-sizing: border-box;
        }
        h1 {
            text-align: center;
            font-size: 24px;
            text-transform: uppercase;
            border-bottom: 2px solid #000000;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .search-box {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .search-input {
            flex: 1;
            padding: 10px;
            border: 2px solid #000000;
            font-size: 16px;
        }
        .btn-search {
            padding: 10px 20px;
            background-color: #000000;
            color: #ffffff;
            border: 2px solid #000000;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        .btn-search:hover {
            background-color: #ffffff;
            color: #000000;
        }
        .result-area {
            min-height: 100px;
            padding: 15px;
            border: 1px dashed #000000;
            line-height: 1.6;
        }
        .result-area a {
            color: #000000;
            text-decoration: underline;
            font-weight: bold;
        }
        .result-area a:hover {
            background-color: #000000;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="navbar">
            <div class="logo">TỪ ĐIỂN CỦA TÔI</div>
            <div class="nav-links">
                <a href="Default.aspx">Trang chủ</a>
                <a href="Lookup.aspx" target="_blank" title="Mở thử Widget">Tiện ích Widget</a>
                <a href="Login.aspx">Đăng nhập Quản trị</a>
            </div>
        </div>

        <div class="container">
            <h1>Tra Cứu Từ Vựng</h1>
            
            <div class="search-box">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" Placeholder="Nhập từ cần tra (VD: HTML, CSS)..."></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="TÌM KIẾM" CssClass="btn-search" OnClick="btnSearch_Click" />
            </div>

            <div class="result-area">
                <asp:Literal ID="litResult" runat="server" Text="Kết quả tra cứu sẽ hiển thị ở đây."></asp:Literal>
            </div>
        </div>
    </form>
</body>
</html>