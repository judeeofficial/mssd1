<%@ WebHandler Language="C#" Class="get_location_district" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Script.Serialization;


public class get_location_district : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
          JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row = null;
        ArrayList List = new ArrayList();
        String search = context.Request.Form["search"];
        List = district.Getlocationdistrict(search);
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
        context.Response.Write(str1);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}