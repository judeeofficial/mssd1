<%@ WebHandler Language="C#" Class="test" %>

using System;
using System.Web;
using System.Web.SessionState;
public class test : IHttpHandler, IReadOnlySessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        string a = "" + context.Session["Username"];
        context.Response.Write(a);


    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}