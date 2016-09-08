using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string a =  WebUtility.HtmlEncode("<input type='text' id='address' class='auto - style2' />");
        string b = WebUtility.HtmlDecode(a);
        Label1.Text = b;
    }
}