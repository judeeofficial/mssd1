using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_districttel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillPage();
    }
    private void FillPage()
    {
        ArrayList List = new ArrayList();

      
            List = district.Getteldistrict("%");
        
       
        StringBuilder sb = new StringBuilder();

        foreach (district dis in List)
        {
            sb.Append(String.Format(@"
         
          <center>  <table class='active' style= width: '50px' >
         
            <tr>
                <td class='success' width='300px'>
                          {0}
                </td>
                <td class='success' width='200px'>
                          {1}
                </td>


                </tr>
            </table>  </center>

            ", dis.district_name,dis.tel));

        }
        lbldistrict.Text = sb.ToString();
    }
}