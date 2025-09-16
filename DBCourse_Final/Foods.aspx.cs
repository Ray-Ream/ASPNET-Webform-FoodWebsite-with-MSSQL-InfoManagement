using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBCourse_Final
{
    public partial class Foods : System.Web.UI.Page
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
            if (!IsPostBack)
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
                foodRep.DataSource = result;
                foodRep.DataBind();
            }
        }
        protected void reloadbtn_Click(object sender, EventArgs e)
        {
            var result = new List<Foods_List>();
            sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
            var category = Convert.ToInt32(Category.SelectedValue);
            var price_Down = 0;
            var price_Top = 0;
            if (!String.IsNullOrEmpty(Price_Down.Text))
                price_Down = Convert.ToInt32(Price_Down.Text);
            if (!String.IsNullOrEmpty(Price_Top.Text))
                price_Top = Convert.ToInt32(Price_Top.Text);
            if (category != -1 && price_Down != 0 && price_Top != 0)
            {
                sds.SelectCommand = $"SELECT * FROM [Foods] WHERE [fromCategory]={category}";
                DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    var id = Convert.ToInt32(dv.Table.Rows[i]["id"]);
                    var name = dv.Table.Rows[i]["name"].ToString();
                    var ingredients = dv.Table.Rows[i]["ingredients"].ToString();
                    var price = dv.Table.Rows[i]["price"].ToString();
                    var fromCategory = Convert.ToInt32(dv.Table.Rows[i]["fromCategory"]);
                    result.Add(new Foods_List { id = id, name = name, ingredients = ingredients, price = price, category = fromCategory });
                }
                foodRep.DataSource = result;
                foodRep.DataBind();
            }
            else if (category != -1)
            {
                sds.SelectCommand = $"SELECT * FROM [Foods] WHERE [fromCategory]={category}";
                DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    var id = Convert.ToInt32(dv.Table.Rows[i]["id"]);
                    var name = dv.Table.Rows[i]["name"].ToString();
                    var ingredients = dv.Table.Rows[i]["ingredients"].ToString();
                    var price = dv.Table.Rows[i]["price"].ToString();
                    var fromCategory = Convert.ToInt32(dv.Table.Rows[i]["fromCategory"]);
                    result.Add(new Foods_List { id = id, name = name, ingredients = ingredients, price = price, category = fromCategory });
                }
                foodRep.DataSource = result;
                foodRep.DataBind();
            }
        }
        protected void addClickCount_Click1(object sender, EventArgs e)
        {
            sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
            Button button = (Button)sender;
            string buttonId = button.CommandArgument;
            int buttonId_Int = Convert.ToInt32(buttonId);
            sds.SelectCommand = $"SELECT * FROM [Foods] WHERE [id]={buttonId_Int}";
            DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);
            var clickTimes = Convert.ToInt32(dv.Table.Rows[0]["clickTimes"]) + 1;
            sds.UpdateCommandType = SqlDataSourceCommandType.Text;
            sds.UpdateCommand = "UPDATE [Foods] SET [clickTimes]=" + "'" + clickTimes + "'" + " WHERE id=" + "'" + buttonId_Int + "'";
            sds.Update();
        }
    }
}