using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class staff_Request_callcenter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Calendar1.Visible = false;
 
      
    }

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

    }

 


    protected void btn_request_Click(object sender, EventArgs e)
    {
        String work_desc = txtdetail.Text;
        int status = 0;
        DateTime work_date = ((DateTime)Calendar1.SelectedDate);
        String work_type = ddlwork_type.Text;
        int type_id = Int32.Parse(work_type);

        int day = work_date.Day;
        int month = work_date.Month;
        int year = work_date.Year;
        String Work_time = ddl_time.Text;
        String customer_name = "" + Session["cusid"];

        int cus_id1 = Int32.Parse(customer_name);
        String Address = txtaddress.Text;
        String district = ddl_district.Text;
        int dis_id = Int32.Parse(district);

        String sub = ddl_subdistrict.Text;
        int sub_id = Int32.Parse(sub);
        String latitude = "" + Session["lat"];
        String longitude = "" + Session["long"];
        String distance = "" + Session["calway"];
        String tel = txttel.Text;
        String small_pood = Rpool.Text;
        int idsmall_pood = Int32.Parse(small_pood);
        small_pond_location small = small_pond_location.chengequeuecar(idsmall_pood);
        int carser = small.idcar;
        requestwork re = new requestwork(work_desc, status, type_id, day, month, year, work_date, Work_time, cus_id1, Address, dis_id, sub_id, latitude, longitude, distance, carser, tel, idsmall_pood);
        requestwork.Requestworkcustomer(re);

        Server.Transfer("../page/Index.aspx");
    }



    protected void btn_savedata_Click(object sender, EventArgs e)
    {
        try
        {
             String firstname = txtfirstname.Text;
               String lastname = txtlastname.Text;
               String address = txtaddress.Text;
               String tel = txttel.Text;
               String province = "กรุงเทพมหานคร";
               String email = txtemail.Text;


               customer cus = new customer("","",firstname, lastname, address,"","", province,"", tel, email);

            customer.Registercustomer(cus);
            customer customerid = customer.getcustomerid(firstname);
               if(customerid != null)
               {
                   Session["cusid"] = customerid.idcustomer;
               }
            lblidcustomer.Text = "" + Session["cusid"];
        }
        catch (Exception ex)
        {
             lblstatus.Text = ex.Message;
        }
    }

  
}