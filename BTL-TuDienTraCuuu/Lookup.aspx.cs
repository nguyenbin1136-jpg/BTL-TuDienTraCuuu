using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace BTL_TuDienTraCuuu
{
    public partial class Lookup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string queryWord = Request.QueryString["word"];

                if (!string.IsNullOrEmpty(queryWord))
                {
                    txtWidgetSearch.Text = queryWord.Trim();
                    SearchWord(queryWord.Trim());
                }
            }
        }
        protected void btnWidgetSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtWidgetSearch.Text.Trim();

            if (!string.IsNullOrEmpty(keyword))
            {
                SearchWord(keyword);
            }
            else
            {
                litResult.Text = "Vui lòng nhập từ khóa.";
            }
        }
        private void SearchWord(string keyword)
        {
            var dictionaryData = Application["DictionaryData"] as Dictionary<string, WordItem>;

            if (dictionaryData != null && dictionaryData.ContainsKey(keyword))
            {
                string meaning = dictionaryData[keyword].Meaning;

                string crossReferencedMeaning = ApplyCrossReference(meaning, dictionaryData, keyword);

                litResult.Text = $"<b>{keyword}:</b> {crossReferencedMeaning}";
            }
            else
            {
                litResult.Text = $"Không tìm thấy: <b>{keyword}</b>";
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
                result = Regex.Replace(result, pattern, "<a href='Lookup.aspx?word=$1'>$1</a>", RegexOptions.IgnoreCase);
            }

            return result;
        }
    }
}