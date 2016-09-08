using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for customer1
/// </summary>
public class customer
{
    private static SqlConnection conn;
    private static SqlCommand command;


    public int idcustomer { get; set; }
    public string Username { get; set; }
    public string password { get; set; }
    public string firstname { get; set; }
    public string lastname { get; set; }
    public string address { get; set; }
    public string district { get; set; }
    public string sub_district { get; set; }
    public string province { get; set; }
    public string postal { get; set; }
    public string tel { get; set; }
    public string email { get; set; }

    static customer()
    {
        //
        // TODO: Add constructor logic here
        //
        string connectionString = ConfigurationManager.ConnectionStrings["Connectionstring"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    
    }

    public customer(int idcustomer, string Username, string password, string firstname, string lastname, string address, string district, string sub_district, string province, string postal, string tel, string email)
    {
        this.idcustomer = idcustomer;
        this.Username = Username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.address = address;
        this.district = district;
        this.sub_district = sub_district;
        this.province = province;
        this.postal = postal;
        this.tel = tel;
        this.email = email;
   
    }
    public customer(string Username, string password, string firstname, string lastname, string address, string district, string sub_district, string province, string postal, string tel, string email)
    {

        this.Username = Username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.address = address;
        this.district = district;
        this.sub_district = sub_district;
        this.province = province;
        this.postal = postal;
        this.tel = tel;
        this.email = email;
    
    }


    public customer(int idcustomer, string firstname, string lastname, string address, string district, string sub_district, string province, string postal, string tel, string email)
    {

        this.idcustomer = idcustomer;
        this.firstname = firstname;
        this.lastname = lastname;
        this.address = address;
        this.district = district;
        this.sub_district = sub_district;
        this.province = province;
        this.postal = postal;
        this.tel = tel;
        this.email = email;

    }

    public customer(int idcustomer, string firstname)
    {
        this.idcustomer = idcustomer;
        this.firstname = firstname;


    }
    public customer(int idcustomer)
    {
        this.idcustomer = idcustomer;
    }
    public customer(string firstname, string lastname, string address, string district, string sub_district,string postal, string tel, string email)
    {


        this.firstname = firstname;
        this.lastname = lastname;
        this.address = address;
        this.district = district;
        this.sub_district = sub_district;
        this.postal = postal;
        this.tel = tel;
        this.email = email;

    }


    public static string Updatecustomer(customer user)
    {
        string query = String.Format("SELECT COUNT(*) FROM Customer WHERE Username= '{0}'", user.Username);

        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUsers = (int)command.ExecuteScalar();
            if (amountOfUsers < 1)
            {
                query = "Update customer set firstname = '" + user.firstname + "'"+
                    ",lastname = '" + user.lastname + "',address='" + user.address + "',"+
                    "district='" + user.district + "',sub_district='" + user.sub_district + "',"+
                    "postal='" + user.postal + "',tal='" + user.tel + "',email='" + user.email + "'"+
                    " where Username  = '" + user.Username + "'"
              ;
                command.CommandText = query;
        
                command.ExecuteNonQuery();
                return "อัพเดตสำเร็จ";
            }
            else
            {
                return "ไม่สำเร็จ";
            }
        }
        finally
        {
            conn.Close();
        }
    }






    public static customer Logincustomer(string username, string password)
    {
        string query = String.Format("SELECT COUNT(*) FROM Customer WHERE username = '{0}'", username);
        command.CommandText = query;
        try
        {
            conn.Open();
            int countuser = (int)command.ExecuteScalar();
            if (countuser == 1)
            {
                query = String.Format("select password from Customer where username = '{0}'", username);
                command.CommandText = query;
                string dbpassword = command.ExecuteScalar().ToString();
                if (dbpassword == password)
                {
                    query = String.Format("select customer_id,firstname,lastname,address,district,sub_district,province,postal,tal,email from customer where username = '{0}' ", username);
                    command.CommandText = query;
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        int customer_id = reader.GetInt32(0);
                        string firstname = reader.GetString(1);
                        string lastname = reader.GetString(2);
                        string address = reader.GetString(3);
                        string district = reader.GetString(4);
                        string sub_district = reader.GetString(5);
                        string province = reader.GetString(6);
                        string postal = reader.GetString(7);
                        string tal = reader.GetString(8);
                        string email = reader.GetString(9);
                        customer cus = new customer(customer_id, firstname, lastname, address, district, sub_district, province,
                            postal, tal, email);
                        return cus;
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
    public static int valid_username(string name)
    {

        string query = String.Format("SELECT COUNT(*) FROM Customer WHERE username = '{0}'", name);
        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUsers = (int)command.ExecuteScalar();
            if (amountOfUsers > 0)
            {//Name already used
                return 1;
            }
            else
                return 0; //ok
        }
        finally
        {
            conn.Close();
        }
        return 0;
    }


    public static string Registercustomer(customer user)
    {
        string query = String.Format("SELECT COUNT(*) FROM Customer WHERE Username = '{0}'", user.Username);

        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUsers = (int)command.ExecuteScalar();
            if (amountOfUsers < 1)
            {
                query = String.Format("INSERT INTO Customer (Username, password, firstname,lastname,address,district,sub_district,province,postal,tal,email) VALUES ('{0}', '{1}', '{2}', '{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}')",
                    user.Username, user.password, user.firstname, user.lastname, user.address, user.district, user.sub_district, user.province, user.postal, user.tel, user.email);
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
    public static string RegisterUserStaff(customer user)
    {
        string query = String.Format("SELECT COUNT(*) FROM Customer WHERE Username = '{0}'", user.Username);

        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUsers = (int)command.ExecuteScalar();
            if (amountOfUsers < 1)
            {
                query = String.Format("INSERT INTO Customer (Username, password, firstname,lastname,address,province,tal,email) VALUES ('{0}', '{1}', '{2}', '{3}','{4}','{5}','{6}','{7}')",
                    user.Username, user.password, user.firstname, user.lastname, user.address,user.province, user.tel, user.email);
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





    public static int LoginUserMobile(string username, string password)
    {
        string query = String.Format("SELECT COUNT(*) FROM Customer WHERE username = '{0}' and password = '{1}'", username, password);
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
    public static customer getcustomerid(string first_name)
    {
        string query = String.Format("select * from customer where firstname = '{0}'", first_name);

        try
        {
            conn.Open();

            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int customer_id = reader.GetInt32(0);
                string customer_firstname = reader.GetString(1);

                customer cus = new customer(customer_id, customer_firstname);
                return cus;
            }
            return null;
        }
        finally
        {
            conn.Close();
        }
    }
    public static customer showcustomer_name(int CusID)
    {
        string query = String.Format("select customer_id,firstname from customer where customer_id = {0}", CusID);

        try
        {
            conn.Open();

            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int customer_id = reader.GetInt32(0);
                string customer_firstname = reader.GetString(1);

                customer cus = new customer(customer_id, customer_firstname);
                return cus;
            }
            return null;
        }
        finally
        {
            conn.Close();
        }
    }

    public static customer showcustomerid(string first_name)
    {
        string query = String.Format("select customer_id from customer where firstname = '{0}'", first_name);

        try
        {
            conn.Open();

            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int customer_id = reader.GetInt32(0);
       

                customer cus = new customer(customer_id);
                return cus;
            }
            return null;
        }
        finally
        {
            conn.Close();
        }
    }


}


