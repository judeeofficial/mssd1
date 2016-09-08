<%@ WebHandler Language="C#" Class="get_location" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Generic;
public class get_location : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        String latitude = context.Request.Form["latitude"];
        String longitude = context.Request.Form["longitude"];
        IDictionary<string, string> str = new Dictionary<string, string>();
        JavaScriptSerializer serializer = new JavaScriptSerializer();
   
       


    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}