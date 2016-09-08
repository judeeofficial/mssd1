using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void txtName_TextChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);
        int valuesMassage = customer.valid_username(txt_username.Text);
        if (valuesMassage == 1)
        {
            txt_username.Text = "";
            lblCheck.Text = "ชื่อซ้ำ !!! กรุณากรอกชื่อใหม่";
        }
        else
        {
            lblCheck.Text = "OK ชื่อนี้ใช้ได้";
        }
    }

    protected void Save_Click(object sender, EventArgs e)
    {
        String username = txt_username.Text;
        String password = txt_password.Text;
        String firstname = txt_firstname.Text;
        String lastname = txt_lastname.Text;
        String address = txt_address.Text;
        String district = ddl_district.Text;
        String subdistrict = ddl_subdistrict.Text;
        String province = Label3.Text;
        String postal = txt_postal.Text;
        String tel = txt_tel.Text;
        String email = txt_email.Text;
       // String latitude = ""+Session["lat"];
      //  String longtitude = ""+Session["long"];
    
         customer cus = new customer(username,password,firstname,lastname,address,district,subdistrict,province,postal,tel,email);
        customer.Registercustomer(cus);
        Server.Transfer("login.aspx");
    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        String username = txt_username.Text;
        String password = txt_password.Text;
        String firstname = txt_firstname.Text;
        String lastname = txt_lastname.Text;
        String address = txt_address.Text;

        String postal = txt_postal.Text;
        String tel = txt_tel.Text;
        String email = txt_email.Text;

        username = "";
        password = "";
        firstname = "";
        lastname = "";
        address = "";
        postal = "";
        tel = "";
        email = "";
    }
}