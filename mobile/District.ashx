<%@ WebHandler Language="C#" Class="District" %>

using System;
using System.Web;
using System.Collections;
using System.Text;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data;
public class District : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row = null;
        ArrayList List = new ArrayList();
        List = district.Getteldistrict("%");
        DataTable dtEmployee = new DataTable();

        dtEmployee.Columns.Add("district_name", typeof(string));
        dtEmployee.Columns.Add("tel", typeof(string));

        //
        // วนลูบสำนักงานเขตทุกเขตในมือถือ
        //

        foreach(district dis in List)
        {
          dtEmployee.Rows.Add(dis.district_name, dis.tel);
      
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


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}

