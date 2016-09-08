using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// Summary description for Staff
/// </summary>
public class Staff
{
    private static SqlConnection conn;
    private static SqlCommand command;
    public int idstaff{ get; set; }
    public string staffname { get; set; }
    public string password { get; set; }
    public string firstname { get; set; }
    public string lastname { get; set; }
    public DateTime startdate { get; set; }


    static Staff()
    {
        //
        // TODO: Add constructor logic here
        //
        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }

    public Staff(int idstaff, string staffname, string password, string firstname, string lastname, DateTime startdate)
    {
        //
        // TODO: Add constructor logic here
        //

        this.idstaff = idstaff;
        this.staffname = staffname;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.startdate = startdate;

    }

    public Staff(string staffname, string password, string firstname, string lastname)
    {
        //
        // TODO: Add constructor logic here
        //
        
        this.staffname = staffname;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
       
    }
    public Staff(string staffname, string password, string firstname, string lastname, DateTime startdate)
    {
        //
        // TODO: Add constructor logic here
        //

        this.staffname = staffname;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.startdate = startdate;
    }
    public static int LoginStaffMobile(string Staffname, string password)
    {
        string query = String.Format("SELECT COUNT(*) FROM Staff  WHERE Staffname = '{0}' and password = '{1}'", Staffname, password);
        command.CommandText = query;
        try
        {
            conn.Open();
            int countuser = (int)command.ExecuteScalar();
            if (countuser == 0)
            {


                return 0;



            }
            else
            {
                return 1;
            }
        }
        finally
        {
            conn.Close();
        }

        return 0;
    }
    public static Staff LoginStaff(string staffname, string password)
    {
        string query = String.Format("SELECT COUNT(*) FROM staff WHERE staffname = '{0}'", staffname);
        command.CommandText = query;
        try
        {
            conn.Open();
            int countuser = (int)command.ExecuteScalar();
            if (countuser == 1)
            {
                query = String.Format("select password from staff where staffname = '{0}'", staffname);
                command.CommandText = query;
                string dbpassword = command.ExecuteScalar().ToString();
                if (dbpassword == password)
                {
                    query = String.Format("select firstname,lastname from staff where staffname = '{0}' ", staffname);
                    command.CommandText = query;
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                   
                        string firstname = reader.GetString(0);
                        string lastname = reader.GetString(1);
                   


                        Staff staff = new Staff(staffname, password, firstname, lastname);
                        return staff;

                    }
                    return null;
                }
                return null;

            }
            else
            {
                return null;
            }

        }
        finally
        {
            conn.Close();
        }

        return null;
    }

    public static string Registerstaff(Staff staff)
    {
        string query = String.Format("SELECT COUNT(*) FROM staff WHERE staffname = '{0}'", staff.staffname);

        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUsers = (int)command.ExecuteScalar();
            if (amountOfUsers < 1)
            {
                query = String.Format("INSERT INTO staff (staffname,password,firstname,lastname,startdate) VALUES ('{0}', '{1}', '{2}', '{3}','{4}')",
                    staff.staffname,staff.password,staff.firstname,staff.lastname,staff.startdate
                   );
                command.CommandText = query;
                command.ExecuteNonQuery();
                return "User registered!";
            }
            else
            {
                return "This name is already used!";
            }
        }
        finally
        {
            conn.Close();
        }
    }

}