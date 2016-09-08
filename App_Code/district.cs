using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for district
/// </summary>
public class district
{
    private static SqlConnection conn;
    private static SqlCommand command;
    public int district_id { get; set; }
    public string district_name { get; set; }
    public string district_desc { get; set; }
    public string latitude { get; set; }
    public string longtitude { get; set; }
    public string tel { get; set; }

    static district()
    {
        //
        // TODO: Add constructor logic here
        //
        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }


    

    public district(int district_id,string district_name,string district_desc,string latitude,string longtitude,string tel)
    {
        this.district_id = district_id;
        this.district_name = district_name;
        this.district_desc = district_desc;
        this.latitude = latitude;
        this.longtitude = longtitude;
        this.tel = tel;
    }

    public district(string district_name)
    {

        this.district_name = district_name;
    
    }
    public district( string district_name ,string tel)
    {
        
        this.district_name = district_name;

        this.tel = tel;
    }
    public district(string district_name, string latitude, string longtitude)
    {

        this.district_name = district_name;
        this.latitude = latitude;
        this.longtitude = longtitude;
    }
    public district(int district_id,string district_name,string tel)
    {
        this.district_id = district_id;
        this.district_name = district_name;
        this.tel = tel;

    }
    public district(int district_id, string district_name)
    {
        this.district_id = district_id;
        this.district_name = district_name;
   
    }
    public static district showdistrict(int Dis_id)
    {
        string query = String.Format("select district_id, district_name from district where district_id = '{0}'", Dis_id);

        try
        {
            conn.Open();

            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int D_ID = reader.GetInt32(0);
                string dis_name = reader.GetString(1);

                district D = new district(D_ID,dis_name);
                return D;
            }
            return null;
        }
        finally
        {
            conn.Close();
        }
    }
    public static ArrayList Getteldistrict(string district_name)
    {

        ArrayList list = new ArrayList();
        string query = string.Format("Select district_name,tel from District WHERE district_name LIKE '{0}'", district_name);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
        
                string district_name1 = reader.GetString(0);
                string tel = reader.GetString(1);


                district dis = new district(district_name1, tel);
                list.Add(dis);
            }
        }
        finally
        {
            conn.Close();
        }

        return list;
    }
    public static ArrayList Getlocationdistrict(string district_name)
    {

        ArrayList list = new ArrayList();
        string query = string.Format("select district_name,latitude,longtitude from District WHERE district_name LIKE '{0}'", district_name);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

                string district_name1 = reader.GetString(0);
                string latitude = reader.GetString(1);
                string longtitude = reader.GetString(2);


                district dis = new district(district_name1, latitude, longtitude);
                list.Add(dis);
            }
        }
        finally
        {
            conn.Close();
        }

        return list;
    }
    public static ArrayList showdatadistrict(int district_id)
    {

        ArrayList list = new ArrayList();
        string query = string.Format("Select district_name from District WHERE district_id LIKE '{0}'", district_id);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

                string district_name1 = reader.GetString(0);


                district dis = new district(district_name1);
                list.Add(dis);
            }
        }
        finally
        {
            conn.Close();
        }

        return list;
    }






}