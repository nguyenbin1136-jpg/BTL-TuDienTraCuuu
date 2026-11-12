<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BTL_TuDienTraCuuu.Admin" %>

<!DOCTYPE html>
<html lang="vi">
<head runat="server">
    <meta charset="utf-8" />
    <title>Quản Trị Từ Điển</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #ffffff; color: #000000; }
        .container { max-width: 800px; margin: 0 auto; border: 2px solid #000000; padding: 30px; }
        h1, h2 { text-transform: uppercase; border-bottom: 2px solid #000000; padding-bottom: 10px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 5px; }
        .form-group input, .form-group textarea { width: 100%; padding: 10px; border: 2px solid #000000; box-sizing: border-box; font-size: 16px; font-family: Arial, sans-serif; }
        .btn { padding: 10px 20px; background: #000000; color: #ffffff; border: 2px solid #000000; cursor: pointer; font-weight: bold; font-size: 16px; }
        .btn:hover { background: #ffffff; color: #000000; }
        .logout-link { float: right; color: #000000; font-weight: bold; font-size: 16px; padding-top: 10px; }
        .message { font-weight: bold; margin-bottom: 20px; display: block; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 2px solid #000000; }
        th, td { padding: 12px; text-align: left; }
        th { background-color: #f0f0f0; }
        a { color: #000000; font-weight: bold; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:LinkButton ID="btnLogout" runat="server" CssClass="logout-link" OnClick="btnLogout_Click">Đăng xuất</asp:LinkButton>
            
            <h1>Trang Quản Trị Hệ Thống</h1>

            <h2>Thêm Từ Mới</h2>
            <div class="form-group">
                <label>Từ khóa (Word):</label>
                <asp:TextBox ID="txtWordKey" runat="server" placeholder="VD: JavaScript"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Định nghĩa (Meaning):</label>
                <asp:TextBox ID="txtMeaning" runat="server" TextMode="MultiLine" Rows="4" placeholder="Nhập giải nghĩa của từ..."></asp:TextBox>
            </div>
            <asp:Button ID="btnAdd" runat="server" Text="THÊM TỪ VỰNG" CssClass="btn" OnClick="btnAdd_Click" />
            <br /><br />
            
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <h2>Kho Từ Vựng</h2>
            <asp:GridView ID="gvDictionary" runat="server" AutoGenerateColumns="False" 
                          DataKeyNames="WordKey" OnRowDeleting="gvDictionary_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="WordKey" HeaderText="Từ khóa" />
                    <asp:BoundField DataField="Meaning" HeaderText="Định nghĩa" />
                    <asp:CommandField ShowDeleteButton="True" DeleteText="[Xóa]" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>