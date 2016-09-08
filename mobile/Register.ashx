<%@ WebHandler Language="C#" Class="Register" %>

using System;
using System.Web;
using System.Web.Script.Serialization;

using System.Collections.Generic;
public class Register : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        IDictionary<string, string> str = new Dictionary<string, string>();
        String username = context.Request.Form["Username"];
        String password = context.Request.Form["password"];
        String firstname = context.Request.Form["firstname"];
        String lastname = context.Request.Form["lastname"];
        String address = context.Request.Form["address"];
        String district = context.Request.Form["district"];
        String sub_district = context.Request.Form["sub_district"];
        String province = context.Request.Form["province"];
        String postal = context.Request.Form["postal"];
        String tel = context.Request.Form["tel"];
        String email = context.Request.Form["email"];


        JavaScriptSerializer serializer = new JavaScriptSerializer();
        customer cus = new customer(username,password,firstname,lastname,address,district,sub_district,province,postal,tel,email);
        if (cus == null)
        {
            str["statusID"] = "0";
            str["status"] = customer.Registercustomer(cus);
        }else
        {
            str["statusID"] = "1";
            str["status"] =  customer.Registercustomer(cus);
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