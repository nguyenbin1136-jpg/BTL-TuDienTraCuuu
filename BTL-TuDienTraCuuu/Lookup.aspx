<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lookup.aspx.cs" Inherits="BTL_TuDienTraCuuu.Lookup" %>

<!DOCTYPE html>
<html lang="vi">
<head runat="server">
    <meta charset="utf-8" />
    <title>Module Tra Cứu (Widget)</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background-color: #ffffff; 
            color: #000000; 
            margin: 0; 
            padding: 10px; 
        }
        .widget-container { 
            border: 2px solid #000000; 
            padding: 10px; 
            font-size: 14px; 
            background-color: #ffffff; 
        }
        .widget-header { 
            font-weight: bold; 
            text-transform: uppercase; 
            border-bottom: 2px solid #000000; 
            padding-bottom: 5px; 
            margin-bottom: 10px; 
            text-align: center; 
        }
        .search-box { 
            display: flex; 
            gap: 5px; 
            margin-bottom: 10px; 
        }
        .search-input { 
            flex: 1; 
            padding: 5px; 
            border: 1px solid #000000; 
            font-size: 14px; 
            width: 100%;
            box-sizing: border-box;
        }
        .btn-search { 
            padding: 5px 10px; 
            background-color: #000000; 
            color: #ffffff; 
            border: 1px solid #000000; 
            cursor: pointer; 
            font-weight: bold; 
        }
        .btn-search:hover { 
            background-color: #ffffff; 
            color: #000000; 
        }
        .result-area { 
            line-height: 1.5; 
            margin-top: 10px; 
            border-top: 1px dashed #000000; 
            padding-top: 10px; 
        }
        a { color: #000000; font-weight: bold; text-decoration: underline; }
        a:hover { background-color: #000000; color: #ffffff; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="widget-container">
            <div class="widget-header">Tra Từ Điển</div>
            
            <div class="search-box">
                <asp:TextBox ID="txtWidgetSearch" runat="server" CssClass="search-input" Placeholder="Nhập từ..."></asp:TextBox>
                <asp:Button ID="btnWidgetSearch" runat="server" Text="Tra" CssClass="btn-search" OnClick="btnWidgetSearch_Click" />
            </div>
            
            <div class="result-area">
                <asp:Literal ID="litResult" runat="server" Text="Nhập từ để tra cứu."></asp:Literal>
            </div>
        </div>
    </form>
</body>
</html>