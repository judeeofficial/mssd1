using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class staff_Add_staff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            String username = txt_username.Text;
            String password = txt_password.Text;
            String firstname = txt_firstname.Text;
            String lastname = txt_lastname.Text;
            String Now = DateTime.Today.ToString("yyyy-MM-dd");
            DateTime today = DateTime.Parse(Now);

            Staff staff = new Staff(username, password, firstname, lastname, today);
            Staff.Registerstaff(staff);

        }
        catch(Exception ex)
        {
            lbl_error.Text = ex.Message;
        }

    }
  
    protected void btn_add_Click(object sender, EventArgs e)
    {
        String tablestaff =""+ gv_Staff.SelectedValue;
        int staff_id = Int32.Parse(tablestaff);
        String district = ddl_district.SelectedItem.Value;
        int dis_id = Int32.Parse(district);
        stafflocation loc = new stafflocation(staff_id,dis_id);
        stafflocation.stafflocation_add(loc);
    }
 
    protected void gv_Staff_SelectedIndexChanged(object sender, EventArgs e)
    {
        String gv = ""+gv_Staff.SelectedValue;
        if(gv != null)
        {
            panel_addLocation.Visible = true;
        }else
        {
            panel_addLocation.Visible = false;
        }
    }
}