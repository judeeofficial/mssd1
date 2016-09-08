using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_test2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //lblChar.Text = "date " + Calendar1.SelectedDate.ToShortDateString();
      //  lblChar.Text = DateTime.Now.ToString("yyyy-MM-dd");



        DateTime work_date = ((DateTime)Calendar1.SelectedDate);
                           

        lblChar.Text ="" + Calendar1.SelectedDate.ToString("yyyy-MM-dd"); 


        // DateTime selectedDate = Convert.ToDateTime(Calendar1.SelectedDate.ToShortDateString());
        // selectedDate = DateTime.ParseExact(lblChar.Text, "yyyy/MM/dd", CultureInfo.InvariantCulture);



        //lblChar.Text = DateTime.Now.ToString("dd/MM/yyyy");

    }
}