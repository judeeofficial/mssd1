using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_testjson : System.Web.UI.Page
{
    private static SqlConnection conn;
    private static SqlCommand command;
    String username;
    String password;
    static page_testjson()
    {
        //
        // TODO: Add constructor logic here
        //
        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
        String inusername = Username.Text;
        String inpassword = Password.Text;
        inusername = Request.Form["username"];
        inpassword = Request.Form["password"];
        String query = String.Format("select * from customer where username = '"+ inusername + "' And password = '"+ inpassword + "'");
        try
        {
            conn.Open();
            command.CommandText = query;
          
          int amountOfUsers = (int)command.ExecuteScalar();
            if (amountOfUsers > 0)
            {//Name already used
                Label1.Text = "เข้าสู่ระบบสำเร็จ";
            }else
            {
                Label1.Text = "ผิด";
            }




        }
        catch(Exception)
        {

        }
    }
}