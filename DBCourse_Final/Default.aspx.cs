using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBCourse_Final
{
    public partial class _Default : Page
    {
        public class Foods_List
        {
            public int one;
            public string two;
            public string three;
            public string four;
            public int five;
            public int id
            {
                set { one = value; }
                get { return one; }
            }
            public string name
            {
                set { two = value; }
                get { return two; }
            }
            public string ingredients
            {
                set { three = value; }
                get { return three; }
            }
            public string price
            {
                set { four = value; }
                get { return four; }
            }
            public int category
            {
                set { five = value; }
                get { return five; }
            }
        }
        SqlDataSource sds = new SqlDataSource();
        protected void Page_Load(object sender, EventArgs e)
        {
            var result = new List<Foods_List>();
            sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
            sds.SelectCommand = "SELECT * FROM [Foods]";
            DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                var one = Convert.ToInt32(dv.Table.Rows[i]["id"]);
                var two = dv.Table.Rows[i]["name"].ToString();
                var three = dv.Table.Rows[i]["ingredients"].ToString();
                var four = dv.Table.Rows[i]["price"].ToString();
                var five = Convert.ToInt32(dv.Table.Rows[i]["fromCategory"]);
                result.Add(new Foods_List { id = one, name = two, ingredients = three, price = four, category = five });
            }
            Random rd = new Random();
            for (int i = 0; i < result.Count - 6; i++)
            {
                var randomN = rd.Next(0, result.Count);
                result.RemoveAt(randomN);
            }
            foodRep.DataSource = result;
            foodRep.DataBind();
        }
    }
}