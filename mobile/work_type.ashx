<%@ WebHandler Language="C#" Class="work_type" %>

using System;
using System.Web;
using System.Collections;
using System.Text;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Data;
public class work_type : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row = null;
        ArrayList List = new ArrayList();
        List = Work_type.worktypemobile("%");
        DataTable dtEmployee = new DataTable();

        dtEmployee.Columns.Add("type_id", typeof(string));
        dtEmployee.Columns.Add("type_name", typeof(string));



        foreach(Work_type work in List)
        {
            dtEmployee.Rows.Add(work.type_id, work.type_name);

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