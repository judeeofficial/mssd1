using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for requestwork
/// </summary>
public class requestwork
{
    private static SqlConnection conn;
    private static SqlCommand command;

    private DateTime work_date;
    private int cus_id;
    private int sub_id;
    private int idsmall_pood;

    public int work_id { get; set; }
  
    public string work_desc { get; set; }
    public int status { get; set; }
    public int type_id { get; set; }
    public int aday { get; set; }
    public int amonth { get; set; }
    public int ayear { get; set; }
    public DateTime date_work { get; set;}
    public string work_time { get; set;}
    public int customer_id { get; set; }
    public string address { get; set; }
    public int district_id { get; set; }
    public int sub_district_id { get; set; }
    public string latitude { get; set; }
    public string longtitude { get; set; }
    public string distance { get; set; }
    public int car_no { get; set; }
    public string tel { get; set; }
    public int idsmall_poond { get; set; }

    static requestwork()
    {

        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);

    }

    public requestwork(int work_id,string work_title,string work_desc, int status, int type_id, 
        int aday ,int amonth, int ayear, DateTime date_work ,string work_time ,int customer_id
        ,string address ,int district_id, int sub_district_id ,string latitude, string longtitude
       ,string distance, int car_no, string tel,int idsmall_poond)
    {
        this.work_id = work_id;
       // this.work_title = work_title;
        this.work_desc = work_desc;
        this.status = status;
        this.type_id = type_id;
        this.aday = aday;
        this.amonth = amonth;
        this.ayear = ayear;
        this.date_work = date_work;
        this.work_time = work_time;
        this.customer_id = customer_id;
        this.address = address;
        this.district_id = district_id;
        this.sub_district_id = sub_district_id;
        this.latitude = latitude;
        this.longtitude = longtitude;
        this.distance = distance;
        this.car_no = car_no;
        this.tel = tel;
        this.idsmall_poond = idsmall_poond;

    }
    public requestwork(int work_id)
    {
        this.work_id = work_id;
    }
    public requestwork(string work_desc, int status, int type_id,
     DateTime date_work, string work_time, int customer_id
      , string address, int district_id, int sub_district_id
     , string distance, int car_no, string tel,int idsmall_poond)
    {
       
 
        this.work_desc = work_desc;
        this.status = status;
        this.type_id = type_id;
        this.date_work = date_work;
        this.work_time = work_time;
        this.customer_id = customer_id;
        this.address = address;
        this.district_id = district_id;
        this.sub_district_id = sub_district_id;
        this.distance = distance;
        this.car_no = car_no;
        this.tel = tel;
        this.idsmall_poond = idsmall_poond;
    }
    public requestwork(string work_desc, int status, int type_id,
   DateTime date_work, string work_time, int customer_id
    , string address, int district_id, int sub_district_id,
  string latitude,string longtitude, string distance, int car_no, string tel, int idsmall_poond)
    {


        this.work_desc = work_desc;
        this.status = status;
        this.type_id = type_id;
        this.date_work = date_work;
        this.work_time = work_time;
        this.customer_id = customer_id;
        this.address = address;
        this.district_id = district_id;
        this.sub_district_id = sub_district_id;
        this.latitude = latitude;
        this.longtitude = longtitude;
        this.distance = distance;
        this.car_no = car_no;
        this.tel = tel;
        this.idsmall_poond = idsmall_poond;
    }
    public requestwork(string work_desc, int status, int type_id,
       int aday, int amonth, int ayear, DateTime date_work, string work_time, int customer_id
       , string address, int district_id, int sub_district_id, string latitude, string longtitude
      , string distance, int car_no, string tel, int idsmall_poond)
    {
  
        this.work_desc = work_desc;
        this.status = status;
        this.type_id = type_id;
        this.aday = aday;
        this.amonth = amonth;
        this.ayear = ayear;
        this.date_work = date_work;
        this.work_time = work_time;
        this.customer_id = customer_id;
        this.address = address;
        this.district_id = district_id;
        this.sub_district_id = sub_district_id;
        this.latitude = latitude;
        this.longtitude = longtitude;
        this.distance = distance;
        this.car_no = car_no;
        this.tel = tel;
        this.idsmall_poond = idsmall_poond;

    }
    public requestwork(int district_id, string latitude, string longtitude)
    {


        this.district_id = district_id;

        this.latitude = latitude;
        this.longtitude = longtitude;
    

    }
    public requestwork(DateTime date_work)
    {
   
        this.date_work = date_work;

  
    }

    public requestwork(int work_id,string work_desc, int status, int type_id,
 DateTime date_work, string work_time, int customer_id
  , string address, int district_id, int sub_district_id
 , string distance, int car_no, string tel, int idsmall_poond)
    {

        this.work_id = work_id;
        this.work_desc = work_desc;
        this.status = status;
        this.type_id = type_id;
        this.date_work = date_work;
        this.work_time = work_time;
        this.customer_id = customer_id;
        this.address = address;
        this.district_id = district_id;
        this.sub_district_id = sub_district_id;
        this.distance = distance;
        this.car_no = car_no;
        this.tel = tel;
        this.idsmall_poond = idsmall_poond;
    }
    public requestwork(int work_id,string work_desc, int status, int type_id,
      int aday, int amonth, int ayear, DateTime date_work, string work_time, int customer_id
      , string address, int district_id, int sub_district_id, string latitude, string longtitude
     , string distance, int car_no, string tel, int idsmall_poond)
    {
        this.work_id = work_id;
        this.work_desc = work_desc;
        this.status = status;
        this.type_id = type_id;
        this.aday = aday;
        this.amonth = amonth;
        this.ayear = ayear;
        this.date_work = date_work;
        this.work_time = work_time;
        this.customer_id = customer_id;
        this.address = address;
        this.district_id = district_id;
        this.sub_district_id = sub_district_id;
        this.latitude = latitude;
        this.longtitude = longtitude;
        this.distance = distance;
        this.car_no = car_no;
        this.tel = tel;
        this.idsmall_poond = idsmall_poond;

    }
    public static requestwork queuescustomer(int customerid)
    {

       
        string query = string.Format("Select work_id,work_desc,status,type_id,date_work,work_time,customer_id,address,district_id,sub_district_id,distance,car_no,tel,idsmall_poond from RequiretWork WHERE customer_id = {0} order by date_work, work_time, work_id desc", customerid);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

                int work_id = reader.GetInt32(0);
                string work_desc = reader.GetString(1);
                int status = reader.GetInt32(2);
                int type_id = reader.GetInt32(3);
                DateTime work_date = reader.GetDateTime(4);
                string work_time = reader.GetString(5);
                int cus_id = reader.GetInt32(6);
                string address = reader.GetString(7);
                int district_id = reader.GetInt32(8);
                int sub_id = reader.GetInt32(9);
                string distance = reader.GetString(10);
                int car_no = reader.GetInt32(11);
                string tel = reader.GetString(12);
                int idsmall_pood = reader.GetInt32(13);
                requestwork r = new requestwork(work_id,work_desc, status, type_id, work_date, work_time, cus_id
                    , address, district_id, sub_id, distance, car_no, tel, idsmall_pood);
                return r;
            }
            return null;
        }
        finally
        {
            conn.Close();
        }

        return null;
    }
    public static ArrayList requestworkgetdatamobile(string work_desc1)
    {

        ArrayList list = new ArrayList();
        string query = string.Format("Select work_id,work_desc,status,type_id,date_work,work_time,customer_id,address,district_id,sub_district_id,distance,car_no,tel,idsmall_poond from RequiretWork WHERE work_desc LIKE '{0}' order by date_work, work_time, work_id desc ", work_desc1);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {


                int work_id = reader.GetInt32(0);
                string work_desc = reader.GetString(1);
                int status = reader.GetInt32(2);
                int type_id = reader.GetInt32(3);
                DateTime work_date = reader.GetDateTime(4);
                string work_time = reader.GetString(5);
                int cus_id = reader.GetInt32(6);
                string address = reader.GetString(7);
                int district_id = reader.GetInt32(8);
                int sub_id = reader.GetInt32(9);
                string distance = reader.GetString(10);
                int car_no = reader.GetInt32(11);
                string tel = reader.GetString(12);
                int idsmall_pood = reader.GetInt32(13);
                requestwork r = new requestwork(work_id,work_desc, status, type_id, work_date, work_time, cus_id
                    , address, district_id, sub_id, distance, car_no, tel, idsmall_pood);
                list.Add(r);
            }
        }
        finally
        {
            conn.Close();
        }

        return list;
    }
    
  /* public Boolean checkrequestwork(DateTime date_work1,string time_work,int car_no)
    {
        string query = string.Format("select work_desc,status,type_id,date_work,work_time,customer_id,address,district_id,sub_district_id,latitude,longtitude,distance,car_no,tel,idsmall_poond from RequiretWork where date_work = '{0}' and work_time = '{1}' and car_no = {2}", date_work1,time_work,car_no);
        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string work_desc = reader.GetString(0);
                int status = reader.GetInt32(1);
                int type_id = reader.GetInt32(2);
                DateTime work_date = reader.GetDateTime(3);
                string work_time = reader.GetString(4);
                int cus_id = reader.GetInt32(5);
                string address = reader.GetString(6);
                int district_id = reader.GetInt32(7);
                int sub_id = reader.GetInt32(8);
                string lat = reader.GetString(9);
                string lng = reader.GetString(10);
                string distance = reader.GetString(11);
                int car_no1 = reader.GetInt32(12);
                string tel = reader.GetString(13);
                int idsmall_pood = reader.GetInt32(14);
                requestwork r = new requestwork(work_desc, status, type_id, work_date, work_time, cus_id
                    , address, district_id, sub_id, lat, lng, distance, car_no1, tel, idsmall_pood);
                return true;
            }
        }
        finally
        {
            conn.Close();
        }
        return false;
    } */
    public static ArrayList requestworkgetdata(string date, int sta,int districtid)
    {

        ArrayList list = new ArrayList();
        string query = string.Format("Select work_desc,status,type_id,date_work,work_time,customer_id,address,district_id,sub_district_id,latitude,longtitude,distance,car_no,tel,idsmall_poond from RequiretWork WHERE date_work = '{0}' and status = {1} and district_id = {2}", date, sta,districtid);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

          
                string work_desc = reader.GetString(0);
                int status = reader.GetInt32(1);
                int type_id = reader.GetInt32(2);
                DateTime work_date = reader.GetDateTime(3);
                string work_time = reader.GetString(4);
                int cus_id = reader.GetInt32(5);
                string address = reader.GetString(6);
                int district_id = reader.GetInt32(7);
                int sub_id = reader.GetInt32(8);
                string lat = reader.GetString(9);
                string lng = reader.GetString(10);
                string distance = reader.GetString(11);
                int car_no = reader.GetInt32(12);
                string tel = reader.GetString(13);
                int idsmall_pood = reader.GetInt32(14);
                requestwork r = new requestwork(work_desc, status, type_id, work_date, work_time, cus_id
                    , address, district_id, sub_id,lat,lng, distance, car_no, tel,idsmall_pood);
                list.Add(r);
            }
        }
        finally
        {
            conn.Close();
        }

        return list;
    }

    public static ArrayList reportdata(string desc_work)
    {

        ArrayList list = new ArrayList();
        string query = string.Format("Select work_desc,status,type_id,date_work,work_time,customer_id,address,district_id,sub_district_id,latitude,longtitude,distance,car_no,tel,idsmall_poond from RequiretWork WHERE work_desc = '{0}'", desc_work);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {


                string work_desc = reader.GetString(0);
                int status = reader.GetInt32(1);
                int type_id = reader.GetInt32(2);
                DateTime work_date = reader.GetDateTime(3);
                string work_time = reader.GetString(4);
                int cus_id = reader.GetInt32(5);
                string address = reader.GetString(6);
                int district_id = reader.GetInt32(7);
                int sub_id = reader.GetInt32(8);
                string lat = reader.GetString(9);
                string lng = reader.GetString(10);
                string distance = reader.GetString(11);
                int car_no = reader.GetInt32(12);
                string tel = reader.GetString(13);
                int idsmall_pood = reader.GetInt32(14);
                requestwork r = new requestwork(work_desc, status, type_id, work_date, work_time, cus_id
                    , address, district_id, sub_id, lat, lng, distance, car_no, tel, idsmall_pood);
                list.Add(r);
            }
        }
        finally
        {
            conn.Close();
        }

        return list;
    }
    public static ArrayList requestworkdistrictmaker(int districtid)
    {

        ArrayList list = new ArrayList();
        string query = string.Format("Select district_id,latitude,longtitude from RequiretWork WHERE  district_id = {0}", districtid);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {


           
                int district_id = reader.GetInt32(0);
           
                string lat = reader.GetString(1);
                string lng = reader.GetString(2);
      
                requestwork r = new requestwork(district_id,  lat, lng);
                list.Add(r);
            }
        }
        finally
        {
            conn.Close();
        }

        return list;
    }

    public static string Requestworkcustomer(requestwork requesttitle)
    {
        string query = String.Format("SELECT COUNT(*) FROM RequiretWork WHERE work_desc = '{0}'", requesttitle.work_desc);

        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUsers = (int)command.ExecuteScalar();
            if (amountOfUsers < 1)
            {
                query = String.Format("INSERT INTO RequiretWork (work_desc,status,type_id,aday,amonth,ayear,date_work,work_time,customer_id,address,district_id,sub_district_id,latitude,longtitude,distance,car_no,tel,idsmall_poond) VALUES ('{0}', '{1}', '{2}', '{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}')",
                    requesttitle.work_desc, requesttitle.status, requesttitle.type_id, requesttitle.aday, requesttitle.amonth
                    , requesttitle.ayear, requesttitle.date_work, requesttitle.work_time, requesttitle.customer_id, requesttitle.address,
                    requesttitle.district_id,requesttitle.sub_district_id,requesttitle.latitude,requesttitle.longtitude,requesttitle.distance,
                    requesttitle.car_no,requesttitle.tel,requesttitle.idsmall_poond);
                command.CommandText = query;
                command.ExecuteNonQuery();
                return "บันทึกสำเร็จ!";
            }
            else
            {
                return "ไม่สำเร็จ!";
            }
        }
        finally
        {
            conn.Close();
        }




    }

    /*   public static string test(requestwork requesttitle)
       {
           string query = String.Format("SELECT COUNT(*) FROM RequiretWork WHERE work_title = '{0}'", requesttitle.work_title);

           try
           {
               conn.Open();
               command.CommandText = query;
               int amountOfUsers = (int)command.ExecuteScalar();
               if (amountOfUsers < 1)
               {
                   query = String.Format("INSERT INTO RequiretWork (date_work) VALUES ('"+requesttitle.date_work+"')" 
                     );
                   command.CommandText = query;
                   command.ExecuteNonQuery();
                   return "บันทึกสำเร็จ!";
               }
               else
               {
                   return "ไม่สำเร็จ!";
               }
           }
           finally
           {
               conn.Close();
           }




       }*/




}
 