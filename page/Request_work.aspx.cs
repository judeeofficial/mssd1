using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_Request_work : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //  lblusername.Text = "  " + Session["Username"] + "  " + Session["Password"];

        //  lbltel.Text = " " +Session["Tel"]  ;

        Calendar1.Visible = false;
        

    }



    /*    protected void btn_request_Click(object sender, EventArgs e)
      {
           try
            {
             String work_title = txt_title.Text;
               String work_desc = txt_detail.Text;
             int status = 1;
          Session["sta"] = Convert.ToString(status);
              String work_type = ddlwork_type.Text;
               int type_id = Int32.Parse(work_type);
           DateTime work_date = ((DateTime)Calendar1.SelectedDate);
            int day = work_date.Day;
           int month = work_date.Month;
            int year = work_date.Year;
          String Work_time = ddl_time.Text;

          String district1 = ddl_district.Text;
            int dis_id = Int32.Parse(district1);




           String sub_district1 = ddl_subdistrict.Text;
           int sub_id = Int32.Parse(sub_district1);
            string province = "กรุงเทพมหานคร";

          String customer_name = "" + Session["Username"]; 

                customer cus_id = customer.getcustomerid(customer_name);
            int cus_id1 = cus_id.idcustomer;



         String address = "" + Session["address"];
            string tel = "" + Session["Tel"];
          requestwork request = new requestwork(work_title, work_desc, status,type_id,day,month,year, work_date, Work_time, cus_id1, address, dis_id, sub_id, province,1,tel);
          Response.Write(  requestwork.setrequestworkcustomer1(request));

             Server.Transfer("Request_index.aspx");

            }
          catch (Exception ex1)
           {
            lbl_error.Text = ex1.Message;
           }


            
}**/






    protected void Request_Work_Click(object sender, EventArgs e)
    {

        // try
        // {
        //String work_title = txt_title.Text;
        String work_desc = txt_detail.Text;
            int status = 1;
            DateTime work_date = ((DateTime)Calendar1.SelectedDate);
            String work_type = ddlwork_type.Text;
            int type_id = Int32.Parse(work_type);
          
            int day = work_date.Day;
            int month = work_date.Month;
            int year = work_date.Year;
            String Work_time = ddl_time.Text;
            String customer_name = "" + Session["Username"];
            customer cus_id = customer.getcustomerid(customer_name);
            int cus_id1 = cus_id.idcustomer;
            String Address = "" + Session["address"];
            String district = ddl_district.Text;
            int dis_id = Int32.Parse(district);

        String sub = ddl_subdistrict.Text;
            int sub_id = Int32.Parse(sub);
            String latitude = "" + Session["lat"];
            String longitude = "" + Session["long"];
            String distance= ""+ Session["calway"];
            String tel = ""+Session["Tel"];


        String small_pood = Rpool.Text;
        int idsmall_pood = Int32.Parse(small_pood);
        small_pond_location small = small_pond_location.chengequeuecar(idsmall_pood);
        int carser = small.idcar;
            requestwork re = new requestwork(work_desc,status,type_id,day,month,year,work_date, Work_time,cus_id1, Address, dis_id, sub_id, latitude, longitude, distance, carser, tel, idsmall_pood);
        requestwork.Requestworkcustomer(re);
    
        Server.Transfer("Request_index.aspx");
        String customernumber = "" + Session["customerid"];
        int customer_id = Int32.Parse(customernumber);
        requestwork r = requestwork.queuescustomer(customer_id);
        if (r != null)
        {
            int work_id = r.work_id;
            int status1 = r.status;
            CultureInfo UsaCulture = new CultureInfo("en-US");
            DateTime date = Convert.ToDateTime(r.date_work);
            String contime = date.ToString("yyyy-MM-dd", UsaCulture);
            if (status1 == 0)
            {
                Session["status"] = "-None-";
            }
            else if (status1 == 1)
            {
                Session["status"] = "รอดำเนินการ";
            }
            else if (status1 == 2)
            {
                Session["status"] = "คิว";
            }
            else if (status1 == 3)
            {
                Session["status"] = "ดำเนินการเสร็จสิ้น";
            }
            else if (status1 == 4)
            {
                Session["status"] = "ยกเลิกงาน";
            }
            Session["queue"] = Convert.ToString(work_id);
            Session["datetime"] = contime;
        }
        //}  catch (Exception ex1)
        // {
        //  lbl_error.Text = ex1.Message;
        //  } 

    }








    /*    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
      lblchareter.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
    } */


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        lblchareter.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
    }

    protected void ddl_district_SelectedIndexChanged(object sender, EventArgs e)
    {
        ArrayList List = new ArrayList();
        String dis = ddl_district.Text;
        int district1 = Int32.Parse(dis);
        List = district.showdatadistrict(district1);
        foreach (district dis11 in List)
        {
            String dis1 = dis11.district_name;

            Session["district"] = dis1;
            lbldistrict.Text = @"<input type='text' name='address2'id='address2' size='15' class='form-control' value = '" + Session["district"] + "' readonly>";
            lbldistrict.Visible = true;
           
        }
    }

    protected void Rpool_SelectedIndexChanged(object sender, EventArgs e)
    {
       // String small_pood = Rpool.Text;
      //  int idsmall_pood = Int32.Parse(small_pood);
      //  lbl_error.Text = ""+idsmall_pood;
    }
}
 