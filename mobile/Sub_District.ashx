<%@ WebHandler Language="C#" Class="Sub_District" %>

using System;
using System.Web;
using System.Collections;
using System.Text;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data;

public class Sub_District : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row = null;
        ArrayList List = new ArrayList();
        List = sub_district.GetDataSub_district("%");
        DataTable dtEmployee = new DataTable();

        dtEmployee.Columns.Add("sub_district_name", typeof(string));
        dtEmployee.Columns.Add("dis_id", typeof(string));

        //
        // วนลูบสำนักงานเขตทุกเขตในมือถือ
        //

        foreach(sub_district dis in List)
        {
            dtEmployee.Rows.Add(dis.sub_district_name, dis.district_id);

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