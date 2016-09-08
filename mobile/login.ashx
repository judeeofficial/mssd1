<%@ WebHandler Language="C#" Class="login" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

using System.Collections.Generic;

public class login : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        String Username = context.Request.Form["username"];
        String Password = context.Request.Form["password"];

        int cus1 = customer.LoginUserMobile(Username, Password);
      customer cus = customer.Logincustomer(Username, Password);
        IDictionary<string, string> str = new Dictionary<string, string>();
        JavaScriptSerializer serializer = new JavaScriptSerializer();

        if(cus1 == 0)
        {
                
            str["StatusID"] = "0";

            str["customerid"] = "0";
            str["status"] = "เข้าสู่ระบบผิดพลาด";



        }else
        {
            str["StatusID"] = "1";

            str["customerid"] = cus.firstname;

            str["status"] = "";


        }



        String str1 = serializer.Serialize(str);
        context.Response.Write(str1);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}