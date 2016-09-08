<%@ WebHandler Language="C#" Class="district_search" %>

using System;
using System.Web;
using System.Collections;
using System.Text;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data;


public class district_search : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        String Search = context.Request.QueryString["search"];
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row = null;
        ArrayList List = new ArrayList();
        List = district.Getlocationdistrict(Search);
        DataTable  Districtloc = new DataTable();

        Districtloc.Columns.Add("location_name", typeof(string));
         Districtloc.Columns.Add("lat", typeof(string));
              Districtloc.Columns.Add("long", typeof(string));
        //
        // วนลูบสำนักงานเขตทุกเขตในมือถือ
        //

        foreach(district dis in List)
        {
          Districtloc.Rows.Add(dis.district_name, dis.latitude,dis.longtitude);
      
        }



        foreach (DataRow dr in Districtloc.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in Districtloc.Columns)
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