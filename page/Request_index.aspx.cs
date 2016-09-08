using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_Request_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblusername.Text = "" + Session["Username"] + "  " + Session["Password"];
        //lbladdress.Text = "" + Session["address"];
    //    lbltel.Text = "" + Session["Tel"];
        //   String sta = "" + Session["sta"];

        Status.Text = "" + Session["status"];
        //  String status1 = Convert.ToString(sta);
        lblqueue.Text = "" + Session["queue"];
        lbldate.Text = "" + Session["datetime"];


    }

    protected void btnRequest_Click(object sender, EventArgs e)
    {
        Server.Transfer("Request_work.aspx");
    }
}