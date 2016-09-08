using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
public partial class page_Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String data1 =  Request.Form["strA"];
        String data2 = Request.Form["strB"];
         // Response.Write("ข้อมูลที่ 1" + data1);

    //Response.Write("ข้อมูลที่ 2" + data2);
        JavaScriptSerializer js = new JavaScriptSerializer();
        IDictionary<string, string> str = new Dictionary<string, string>();
        str["Hello"] = data1;
        str["HI"] = data2;
        //    Response.Write("Arrey" + str);
      String str1 = js.Serialize(str);
      Response.Write(str1);
    }
}