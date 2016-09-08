<%@ WebHandler Language="C#" Class="customer_register" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Generic;
public class customer_register : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        IDictionary<string, string> str = new Dictionary<string, string>();
        int type_id = Int32.Parse(context.Request.Form["type_id"]);

        String work_time = context.Request.Form["work_time"];
        DateTime date_work = Convert.ToDateTime(context.Request.Form["date_work"]);
        int district_id = Int32.Parse(context.Request.Form["district_id"]);
        String latitude = context.Request.Form["latitude"];
        String longtitude = context.Request.Form["longtitude"];
        String distance = context.Request.Form["distance"];
        String work_desc = context.Request.Form["work_desc"];
        int customer_id = Int32.Parse(context.Request.Form["customer_id"]);
        int status = 1;


        JavaScriptSerializer serializer = new JavaScriptSerializer();
        requestwork re = new requestwork(work_desc,status,type_id,0,0,0,date_work, work_time,customer_id,"", district_id, 0, latitude, longtitude , distance, 0,"", 0);
        if (re == null)
        {
            str["statusID"] = "0";
            str["status"] = requestwork.Requestworkcustomer(re);
        }else
        {
            str["statusID"] = "1";
            str["status"] =  requestwork.Requestworkcustomer(re);
        }

        String mobileinput = serializer.Serialize(str);
        context.Response.Write(mobileinput);

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}