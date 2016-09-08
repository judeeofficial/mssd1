using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for stafflocation
/// </summary>
public class stafflocation
{
    private static SqlConnection conn;
    private static SqlCommand command;
    public int staff_id { get; set; }
    public int district_id { get; set; }

    static stafflocation()
    {
     
        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }
    public stafflocation(int staff_id,int district_id)
    {
        this.staff_id = staff_id;
        this.district_id = district_id;
    }
    public static string stafflocation_add(stafflocation staff)
    {
        string query = String.Format("SELECT COUNT(*) FROM Stafflocation WHERE staff_id = {0}", staff.staff_id);

        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUsers = (int)command.ExecuteScalar();
            if (amountOfUsers < 1)
            {
                query = String.Format("INSERT INTO Stafflocation (staff_id,district_id) VALUES ({0}, {1})"
            , staff.staff_id,staff.district_id
                   );
                command.CommandText = query;
                command.ExecuteNonQuery();
                return "Add staff finish";
            }
            else
            {
                return "";
            }
        }
        finally
        {
            conn.Close();
        }
    }
}