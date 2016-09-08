using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_Default : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {
       
    
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ArrayList List = new ArrayList();
     
        String f = DropDownList1.Text;
        int f1 = Int32.Parse(f); 
        List = district.showdatadistrict(f1);
       foreach(district dis in List)
        {
            String dis1 = dis.district_name;

            Label1.Text = @"<input type='text' id='address' class='auto - style2' value='"+dis1+"' />";
        }
        ScriptManager.RegisterStartupScript(this, GetType(), "YourUniqueScriptKey",
        "alert('This pops up');", true);
        Label2.Text = @"<input type='text' id='address' class='auto - style2' />";
    }
}