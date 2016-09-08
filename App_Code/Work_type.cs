using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections;
/// <summary>
/// Summary description for Work_type
/// </summary>
public class Work_type
{
    private static SqlConnection conn;
    private static SqlCommand command;
    public int type_id { get; set; }
    public string type_name { get; set; }
    public string type_desc { get; set; }
    public string display_order { get; set; }


    static Work_type()
    {

        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }

    public Work_type(int type_id,string type_name,string type_desc,string display_order)
    {
        this.type_id = type_id;
        this.type_name = type_name;
        this.type_desc = type_desc;
        this.display_order = display_order;
    }
    public Work_type(int type_id, string type_name)
    {
        this.type_id = type_id;
        this.type_name = type_name;
    }


    public static Work_type gettypeid(string typename)
    {
        string query = String.Format("select type_id,type_name from WorkType where type_name = '{0}'", typename);

        try
        {
            conn.Open();

            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int type_id = reader.GetInt32(0);
                string type_name = reader.GetString(1);
                Work_type type = new Work_type(type_id, type_name);
                return type;
            }
            return null;
        }
        finally
        {
            conn.Close();
        }
    }
    public static ArrayList worktypemobile(string typename)
    {
        ArrayList List = new ArrayList();
        string query = String.Format("select type_id,type_name from WorkType where type_name LIKE '{0}' order by type_id desc", typename);

        try
        {
            conn.Open();

            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int type_id = reader.GetInt32(0);
                string type_name = reader.GetString(1);
                Work_type type = new Work_type(type_id, type_name);
                List.Add(type);
            }
            
        }
        finally
        {
            conn.Close();
        }
        return List;
    }


}