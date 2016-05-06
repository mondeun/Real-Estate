using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Real_Estate.Web_Forms
{
    public partial class BookView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var view = ddlView.SelectedValue;
            var cust = ddlCust.SelectedValue;


            string sqlQuery = $"EXEC BookViewing {view}, {cust}";
            using (SqlConnection dataConnection = new SqlConnection("Data Source =.; Initial Catalog = RealEstateSystemDB; Integrated Security = true"))
            {
                using (SqlCommand dataCommand = new SqlCommand(sqlQuery, dataConnection))
                {
                    dataConnection.Open();
                    var result = dataCommand.ExecuteNonQuery();
                    dataConnection.Close();
                    if (result == 1)
                    {
                        Output.Text = "The booking was successful.";
                    }
                    else
                    {
                        Output.Text = "The booking failed";
                    }
                    GridView1.DataBind();
                }
            }
        }
    }
}