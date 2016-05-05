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
    public partial class Test : System.Web.UI.Page
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
                    dataCommand.ExecuteNonQuery();
                    dataConnection.Close();
                }
            }
        }
    }
}