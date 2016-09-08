using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for small_pond_location
/// </summary>
public class small_pond_location
{
    private static SqlConnection conn;
    private static SqlCommand command;
    public int idsmall_poond { get; set; }
    public string location_name { get; set; }
    public int idcar { get; set; }
    
    static small_pond_location()
    {

        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }

    public small_pond_location(int idsmall_poond, string location_name, int idcar)
    {
        this.idsmall_poond = idsmall_poond;
        this.location_name = location_name;
        this.idcar = idcar;
     
    }
    public small_pond_location(int idcar)
    {
        this.idcar = idcar;
  
       
    }

    public static small_pond_location chengequeuecar(int idsmallocation)
    {

        string query = string.Format("select idcar from small_pond_location where idsmall_poond = {0}"
                                      , idsmallocation);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {


                
             int carid = reader.GetInt32(0);

             
               small_pond_location small = new small_pond_location(carid);
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