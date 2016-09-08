using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for sub_district
/// </summary>
public class sub_district
{
    private static SqlConnection conn;
    private static SqlCommand command;
    public int sub_district_id { get; set; }
    public string sub_district_name { get; set; }
    public int district_id { get; set; }
    public string province { get; set; }
    public string sub_district_desc { get; set; }

    static sub_district()
    {
        //
        // TODO: Add constructor logic here
        //
        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }


    public sub_district(int sub_district_id, string sub_district_name, int district_id,
        string province, string sub_district_desc)
    {
        this.sub_district_id = sub_district_id;
        this.sub_district_name = sub_district_name;
        this.district_id = district_id;
        this.province = province;
        this.sub_district_desc = sub_district_desc;
    }

    public sub_district(string sub_district_name, int district_id,
    string province, string sub_district_desc)
    {
 
        this.sub_district_name = sub_district_name;
        this.district_id = district_id;
        this.province = province;
        this.sub_district_desc = sub_district_desc;
    }

    public sub_district(int sub_district_id, string sub_district_name, string province)
    {
        this.sub_district_id = sub_district_id;
        this.sub_district_name = sub_district_name;
        this.province = province;
    }

    public sub_district(string sub_district_name, int district_id
     )
    {
      
        this.sub_district_name = sub_district_name;
        this.district_id = district_id;
      
    }


    public sub_district(int district_id,string sub_district_name
     )
    {
        this.district_id = district_id;
        this.sub_district_name = sub_district_name;
      

    }
    public static sub_district setsubdistrictid(string subdistrict)
    {
        string query = String.Format("select * from Sub_District where sub_district_name LIKE '{0}'", subdistrict);

        try
        {
            conn.Open();

            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int sub_district_id = reader.GetInt32(0);
                string sub_district_name = reader.GetString(1);
                string province = reader.GetString(2);
                sub_district sub_district = new sub_district(sub_district_id, sub_district_name,province);
                return sub_district;
            }
            return null;
        }
        finally
        {
            conn.Close();
        }
    }
    public static ArrayList GetDataSub_district(string subdistrict)
    {

        ArrayList list = new ArrayList();
        string query = string.Format("select sub_district_name ,district_id from Sub_District where sub_district_name LIKE '{0}'", subdistrict);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

             
                string sub_district_name = reader.GetString(0);
                int district_id = reader.GetInt32(1);
                sub_district sub_district = new sub_district(sub_district_name,district_id);
                list.Add(sub_district);
            }
        }
        finally
        {
            conn.Close();
        }

        return list;
    }
    public static sub_district showsubdistrict_name(int Sub_Dis_id)
    {
        string query = String.Format("select sub_district_id, sub_district_name from Sub_District where sub_district_id = {0}", Sub_Dis_id);

        try
        {
            conn.Open();

            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int Sub_D_ID = reader.GetInt32(0);
                string Sub_dis_name = reader.GetString(1);

                sub_district D = new sub_district(Sub_D_ID, Sub_dis_name);
                return D;
            }
            return null;
        }
        finally
        {
            conn.Close();
        }
    }



}