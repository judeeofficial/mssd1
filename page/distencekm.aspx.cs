using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_distencekm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String distance = Request.Form["distance"];
        int disway = Int32.Parse(distance);
        float km = disway/1000f;
        Session["calway"] = km;
        string kn =km.ToString("####.###");
        Response.Write(Session["calway"]);
    }
}