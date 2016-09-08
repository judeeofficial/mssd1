<%@ WebHandler Language="C#" Class="loginstaff" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

using System.Collections.Generic;
public class loginstaff : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        String Staffname = context.Request.Form["staffname"];
        String Password = context.Request.Form["password"];
        Staff staff = Staff.LoginStaff(Staffname, Password);
        int loginstaff = Staff.LoginStaffMobile(Staffname, Password);
        IDictionary<string, string> str = new Dictionary<string, string>();
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        if(loginstaff == 0)
        {
            str["StatusID"] = "0";

            str["staffid"] = "0";
            str["status"] = "เข้าสู่ระบบผิดพลาด";
        }else
        {
                 str["StatusID"] = "1";

            str["staffid"] = staff.firstname;
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