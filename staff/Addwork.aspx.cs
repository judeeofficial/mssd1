using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class staff_Addwork : System.Web.UI.Page
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

    protected void btn_Search_Click(object sender, EventArgs e)
    {
        String work_date = lblchareter.Text;
        String status = ddl_status.SelectedValue;
        int Status = Int32.Parse(status);
        String district1 = ddl_district.Text;
        int dis_id = Int32.Parse(district1);
        Session["districtid"] = district1;


        lbldistrict.Text = @"<input type='text' name='address2'id='address2' size='15' class='form-control' value = '" + Session["districtid"] + "' readonly>";
        lbldistrict.Visible = true;
            ArrayList list = new ArrayList();

              list = requestwork.requestworkgetdata(work_date, Status,dis_id);

            DataTable Addwork = new DataTable();
        
           Addwork.Columns.Add("รายละเอียดงาน", typeof(string));
           Addwork.Columns.Add("สถานะงาน", typeof(string));
           Addwork.Columns.Add("ประเภทงาน", typeof(string));
           Addwork.Columns.Add("วันที่ดำเนินงาน", typeof(DateTime));
           Addwork.Columns.Add("เวลา", typeof(string));
           Addwork.Columns.Add("ชื่อลูกค้า", typeof(string));
           Addwork.Columns.Add("ที่อยู่ลูกค้า", typeof(string));
           Addwork.Columns.Add("เขต", typeof(string));
           Addwork.Columns.Add("แขวง", typeof(string));
           Addwork.Columns.Add("จังหวัด", typeof(string));
           Addwork.Columns.Add("รถออกรับบริการ", typeof(string));
           Addwork.Columns.Add("เบอร์โทรลูกค้า", typeof(string));


        foreach (requestwork r in list)
          {

            int car_no = r.car_no;
            car c = car.car_name(car_no);
            string type = c.car_type;

            int Customer_ID = r.customer_id;
            customer name = customer.showcustomer_name(Customer_ID);
            String firstname = name.firstname;
            int D_ID = r.district_id;
            district d = district.showdistrict(D_ID);
            String name_district = d.district_name;

            int SUB_D_ID = r.sub_district_id;
            sub_district sd = sub_district.showsubdistrict_name(SUB_D_ID);
            String sdt = sd.sub_district_name;
          Addwork.Rows.Add(r.work_desc,r.status,r.type_id,r.date_work,r.work_time,firstname,r.address,name_district,sdt,r.distance, type, r.tel);
            GridView1.DataSource = Addwork;
           GridView1.DataBind();
           }

    }

   
}