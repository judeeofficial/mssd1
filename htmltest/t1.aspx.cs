using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class htmltest_t1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        //Label1.Text = A;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ArrayList List = new ArrayList();
        ArrayList List1 = new ArrayList();
        String A = RadioButtonList1.Text;
  
        int S = Int32.Parse(A);


     //   List1 = small_pond_location.chengequeuecar(S);
      // Response.Write(S);
     //   List = car.chengequeuecar(S);
     //  foreach(car c in List)
    //    {
    //     Response.Write(c.car_type);
   //     }
   //     foreach(small_pond_location car1 in List1)
  //   {
  //        Response.Write(car1.idcar);
  //    }






    }
}