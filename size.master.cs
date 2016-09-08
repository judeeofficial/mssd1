using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class size : System.Web.UI.MasterPage
{


    protected void Page_Load(object sender, EventArgs e)
    {
    
            usernamecustomer();


    }

    protected void logout_Click(object sender, ImageClickEventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/page/login.aspx");
    }

    private void usernamecustomer()
    {
        if (Session["Username"] != null)
        {
            lnk_LoginName.Text = "ยินดีต้อนรับคุณ  " + Session["username"];
            lnk_LoginName.Visible = true;
            NavigationMenu.Items.Add(new MenuItem
            {
                Text = "แก้ไขข้อมูลลูกค้า",
                NavigateUrl = "~/page/edit_customer.aspx"
            });
            NavigationMenu.Items.Add(new MenuItem
            {
                Text = "ขอรับบริการ",
                NavigateUrl = "~/page/Request_index.aspx"
            });
        }else if (Session["Staffname"] != null)
        {
            lnk_LoginName.Text = "ระบบของพนักงาน " + Session["Staffname"];
            lnk_LoginName.Visible = true;
            NavigationMenu.Items.Add(new MenuItem
            {
                Text = "เพิ่มรายการขอรับบริการ",
                NavigateUrl = "~/staff/Addwork.aspx"

            });
            NavigationMenu.Items.Add(new MenuItem
            {
                Text = "Call Center",
                NavigateUrl = "~/staff/Request_callcenter.aspx"

            });
            NavigationMenu.Items.Add(new MenuItem
            {
                Text = "จัดการข้อมูลพนักงาน",
                NavigateUrl = "~/staff/Add_staff.aspx"

            });
        }



    }
}