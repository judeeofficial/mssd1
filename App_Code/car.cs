using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for car
/// </summary>
public class car
{
    private static SqlConnection conn;
    private static SqlCommand command;
    public int idcar { get; set; }
    public string car_type { get; set; }
    static car()
    {

        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }
    public car(int idcar , string car_type)
    {
        this.idcar = idcar;
        this.car_type = car_type;
    }
    public car(string car_type)
    {
        
        this.car_type = car_type;
    }
    public static ArrayList chengequeuecar(int carid)
    {

        ArrayList list = new ArrayList();
        string query = string.Format("Select car_type from car where idcar = {0}", carid);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {


                string car_type = reader.GetString(0);
           
               
                car small = new car(car_type);

                list.Add(small);
           
            }
        }
        finally
        {
            conn.Close();
        }

        return list;
    }

    public static car car_name(int carid)
    {

        ArrayList list = new ArrayList();
        string query = string.Format("Select idcar,car_type from car where idcar = {0}", carid);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

                int IDCar = reader.GetInt32(0);
                string car_type = reader.GetString(1);


                car small = new car(IDCar,car_type);

                return small;

            }
        }
        finally
        {
            conn.Close();
        }

        return null;
    }
}