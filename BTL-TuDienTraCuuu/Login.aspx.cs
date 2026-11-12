using System;

namespace BTL_TuDienTraCuuu
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"] == true)
            {
                Response.Redirect("Admin.aspx");
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUsername.Text.Trim();
            string pass = txtPassword.Text.Trim();

            if (user == "admin" && pass == "123456")
            {
                Session["IsAdmin"] = true;
                Response.Redirect("Admin.aspx");
            }
            else
            {
                lblError.Text = "Sai tài khoản hoặc mật khẩu!";
            }
        }
    }
}