using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_edit_customer : System.Web.UI.Page
{
    private static SqlConnection conn;
    private static SqlCommand command;
    private static SqlDataAdapter da;
    static page_edit_customer()
    {
        //
        // TODO: Add constructor logic here
        //
        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
        da = new SqlDataAdapter("", conn);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       String firstname = "" + Session["Username"];
      String lastname = "" + Session["Password"];
       String address = "" + Session["address"];
  String district = "" + Session["district"];
  String sub_district = "" + Session["sub_district"];
   String posttel = "" + Session["postal"];
   String tel = "" + Session["Tel"];
    String email = "" + Session["email"];

     txt_firstname.Text = firstname;
     txt_lastname.Text = lastname;
   txt_address.Text = address;
 ddl_district.Text = district;
  ddl_subdistrict.Text = sub_district;
     txt_postal.Text = posttel;
  txt_tel.Text = tel;
 txt_email.Text = email;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
   try
        {

            //เริ่มอัพเดตข้อมูล
        String firstname = txt_firstname.Text;
        String lastname = txt_lastname.Text;
        String address = txt_address.Text;
        String district = ddl_district.Text;
        String subdistrict = ddl_subdistrict.Text;

        String postal = txt_postal.Text;
        String tel = txt_tel.Text;
        String email = txt_email.Text;
            
          String  query = "Update customer set firstname = '" + firstname + "'" +
                           ",lastname = '" + lastname + "',address='" + address + "'," +
                           "district='" + district + "',sub_district='" + subdistrict + "'," +
                           "postal='" + postal + "',tal='" + tel + "',email='" + email + "'" +
                           " where customer_id = '" + Session["customerid"] + "'";

            conn.Open();
            command.CommandText = query;

            da.UpdateCommand = command;

            command.ExecuteNonQuery();

            conn.Close();
            lblerror.Text = "อัพเดตสำเร็จ";
 //Server.Transfer("index.aspx");
        }catch(Exception ex)
        {
            lblerror.Text = ex.Message;
        }
     
    }
}