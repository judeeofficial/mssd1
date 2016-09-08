using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_get_location : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String latitude = Request.Form["lat"];
        String longitude = Request.Form["lng"];
        Session["lat"] = latitude;
        Session["long"] = longitude;
        Response.Write(Session["lat"]+","+ Session["long"]);
    }
}