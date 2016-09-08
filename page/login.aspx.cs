using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Globalization;

public partial class page_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String Username = txtLogin.Text;

        String Password = txtPassword.Text;


        customer customer = customer.Logincustomer(Username, Password);
        Staff staff = Staff.LoginStaff(Username, Password);
        if (customer != null)
        {
            Session["customerid"] = customer.idcustomer;
            String customernumber = "" + Session["customerid"];
            int customer_id = Int32.Parse(customernumber);
            requestwork r = requestwork.queuescustomer(customer_id);
            if (r != null)
            {
                int work_id = r.work_id;
                int status = r.status;
                CultureInfo ThaiCulture = new CultureInfo("th-TH");
                CultureInfo UsaCulture = new CultureInfo("en-US");
                DateTime date = Convert.ToDateTime(r.date_work);
                String contime = date.ToString("yyyy-MM-dd", UsaCulture);
                if (status == 0)
                {
                    Session["status"] = "-None-";
                }else if(status == 1)
                {
                    Session["status"] = "รอดำเนินการ";
                }
                else if(status == 2)
                {
                    Session["status"] = "คิว";
                }
                else if(status == 3)
                {
                    Session["status"] = "ดำเนินการเสร็จสิ้น";
                }
                else if(status == 4)
                {
                    Session["status"] = "ยกเลิกงาน";
                }
                Session["queue"] = Convert.ToString(work_id);
                Session["datetime"] = contime;
            }
            Session["Username"] = customer.firstname;
            Session["Password"] = customer.lastname;
            Session["address"] = customer.address;
            Session["Tel"] = customer.tel;
            Session["district"] = customer.district;
            Session["sub_district"] = customer.sub_district;
            Session["province"] = customer.province;
            Session["postal"] = customer.postal;
            Session["email"] = customer.email;
 
            Server.Transfer("Index.aspx");
        }
        else if (staff != null)
        {
            Session["Staffname"] = staff.firstname;
            Session["lastname"] = staff.lastname;
            Server.Transfer("Index.aspx");
        }
        else
        {
            lblError.Text = "ชื่อผู้ใช้ หรือ รหัสผ่าน ไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง";
        }
      

      

    }


}





