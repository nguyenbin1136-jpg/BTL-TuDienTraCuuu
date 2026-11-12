using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace BTL_TuDienTraCuuu
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string queryWord = Request.QueryString["word"];

                if (!string.IsNullOrEmpty(queryWord))
                {
                    txtSearch.Text = queryWord; 
                    SearchAndDisplay(queryWord); 
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            SearchAndDisplay(keyword);
        }
        private void SearchAndDisplay(string keyword)
        {
            if (string.IsNullOrEmpty(keyword))
            {
                litResult.Text = "Vui lòng nhập từ khóa để tra cứu.";
                return;
            }

            var dictionaryData = Application["DictionaryData"] as Dictionary<string, WordItem>;

            if (dictionaryData != null && dictionaryData.ContainsKey(keyword))
            {
                string meaning = dictionaryData[keyword].Meaning;

                string crossReferencedMeaning = ApplyCrossReference(meaning, dictionaryData, keyword);

                litResult.Text = $"Nghĩa của <b>{keyword}</b>: {crossReferencedMeaning}";
            }
            else
            {
                litResult.Text = $"Không tìm thấy từ <b>{keyword}</b> trong hệ thống.";
            }
        }

        private string ApplyCrossReference(string meaning, Dictionary<string, WordItem> dict, string currentKeyword)
        {
            string result = meaning;

            foreach (var word in dict.Keys)
            {
                if (word.Equals(currentKeyword, StringComparison.OrdinalIgnoreCase))
                    continue;

                string pattern = $@"\b({word})\b";
                result = Regex.Replace(result, pattern, "<a href='?word=$1'>$1</a>", RegexOptions.IgnoreCase);
            }

            return result;
        }
    }
}