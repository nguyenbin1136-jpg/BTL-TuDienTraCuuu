using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace BTL_TuDienTraCuuu
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] == null || (bool)Session["IsAdmin"] == false)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        private void BindGrid()
        {
            var dictionaryData = Application["DictionaryData"] as Dictionary<string, WordItem>;
            if (dictionaryData != null)
            {
                gvDictionary.DataSource = dictionaryData.Values.ToList();
                gvDictionary.DataBind();
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string key = txtWordKey.Text.Trim();
            string meaning = txtMeaning.Text.Trim();

            if (string.IsNullOrEmpty(key) || string.IsNullOrEmpty(meaning))
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ từ khóa và định nghĩa!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            var dictionaryData = Application["DictionaryData"] as Dictionary<string, WordItem>;

            if (dictionaryData != null)
            {
                Application.Lock();

                if (dictionaryData.ContainsKey(key))
                {
                    lblMessage.Text = $"Từ khóa '{key}' đã tồn tại trong hệ thống!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    dictionaryData.Add(key, new WordItem(key, meaning));

                    lblMessage.Text = $"Đã thêm thành công từ '{key}'!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    txtWordKey.Text = "";
                    txtMeaning.Text = "";

                    BindGrid(); 
                }
                Application.UnLock();
            }
        }
        protected void gvDictionary_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string keyToDelete = gvDictionary.DataKeys[e.RowIndex].Value.ToString();
            var dictionaryData = Application["DictionaryData"] as Dictionary<string, WordItem>;

            if (dictionaryData != null && dictionaryData.ContainsKey(keyToDelete))
            {
                Application.Lock();
                dictionaryData.Remove(keyToDelete); 
                Application.UnLock();

                BindGrid(); 

                lblMessage.Text = $"Đã xóa từ '{keyToDelete}' thành công!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); 
            Response.Redirect("Default.aspx"); 
        }
    }
}