using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_data_search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        string bang = "" + Session["district"];
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row = null;
        ArrayList List = new ArrayList();
        List = district.Getlocationdistrict(bang);
        DataTable dtEmployee = new DataTable();

        dtEmployee.Columns.Add("location_name", typeof(string));
        dtEmployee.Columns.Add("lat", typeof(string));
        dtEmployee.Columns.Add("long", typeof(string));
        //
        // วนลูบสำนักงานเขตทุกเขตในมือถือ
        //

        foreach (district dis in List)
        {
            dtEmployee.Rows.Add(dis.district_name, dis.latitude, dis.longtitude);

        }



        foreach (DataRow dr in dtEmployee.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dtEmployee.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        String str1 = serializer.Serialize(rows);
        Response.Write(str1);

    }
}