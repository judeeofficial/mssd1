<%@ WebHandler Language="C#" Class="customer_request_staff" %>

using System;
using System.Web;
using System.Collections;
using System.Text;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data;

public class customer_request_staff : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row = null;
        ArrayList List = new ArrayList();
        List = requestwork.requestworkgetdatamobile("%");
        DataTable dtEmployee = new DataTable();
            DataTable Addwork = new DataTable();
            Addwork.Columns.Add("work_id", typeof(string));
           Addwork.Columns.Add("work_desc", typeof(string));
           Addwork.Columns.Add("status", typeof(string));
           Addwork.Columns.Add("type_id", typeof(string));
           Addwork.Columns.Add("date_work", typeof(DateTime));
           Addwork.Columns.Add("work_time", typeof(string));
           Addwork.Columns.Add("customer_id", typeof(string));
           Addwork.Columns.Add("address", typeof(string));
           Addwork.Columns.Add("district_id", typeof(string));
           Addwork.Columns.Add("sub_district_id", typeof(string));
           Addwork.Columns.Add("distance", typeof(string));
           Addwork.Columns.Add("carno", typeof(string));
           Addwork.Columns.Add("tel", typeof(string));

 
        foreach (requestwork request in List)
          {
          Addwork.Rows.Add(request.work_id,request.work_desc,request.status,request.type_id,request.date_work,request.work_time,request.customer_id,request.address,request.district_id,request.sub_district_id,request.distance,request.car_no,request.tel);
            
           }


        foreach (DataRow dr in   Addwork.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in   Addwork.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        String str1 = serializer.Serialize(rows);
        context.Response.Write(str1);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}