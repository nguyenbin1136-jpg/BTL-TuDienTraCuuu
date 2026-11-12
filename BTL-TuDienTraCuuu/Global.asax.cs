using System;
using System.Collections.Generic;
using System.Web;

namespace BTL_TuDienTraCuuu
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            Dictionary<string, WordItem> dictionaryData = new Dictionary<string, WordItem>(StringComparer.OrdinalIgnoreCase);

            dictionaryData.Add("HTML", new WordItem("HTML", "Ngôn ngữ đánh dấu siêu văn bản, thường dùng chung với CSS."));
            dictionaryData.Add("CSS", new WordItem("CSS", "Ngôn ngữ tạo kiểu, làm đẹp cho HTML."));

            Application["DictionaryData"] = dictionaryData;
        }
    }
}