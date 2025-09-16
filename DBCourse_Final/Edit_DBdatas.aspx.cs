using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBCourse_Final
{
    public partial class Edit_DBdatas : System.Web.UI.Page
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
        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
            Button button = (Button)sender;
            string buttonId = button.CommandArgument;
            int buttonId_Int = Convert.ToInt32(buttonId);
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            var name = (item.FindControl("foodName") as TextBox).Text;
            var ingredients = (item.FindControl("foodIngredients") as TextBox).Text;
            var price = (item.FindControl("foodPrice") as TextBox).Text;
            var category = (item.FindControl("Category") as DropDownList).SelectedValue;
            sds.UpdateCommandType = SqlDataSourceCommandType.Text;
            sds.UpdateCommand = "UPDATE [Foods] SET [name]=" + "'" + name + "'" + ",[ingredients]=" + "'" + ingredients + "'" + ",[price]=" + "'" + price + "'" + ",[fromCategory]=" + "'" + category + "'" + ",[clickTimes]=" + "'" + 0 + "'" + " WHERE id=" + "'" + buttonId_Int + "'";
            sds.Update();
        }
    }
}