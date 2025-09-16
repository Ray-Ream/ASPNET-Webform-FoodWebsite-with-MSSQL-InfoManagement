using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBCourse_Final
{
    public partial class AddNewDataToDB : System.Web.UI.Page
    {
        SqlDataSource sds = new SqlDataSource();

        protected void Page_Load(object sender, EventArgs e)
        {
            sds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
        }

        protected void insertbtn_Click(object sender, EventArgs e)
        {
            var name = Name.Text;
            var category = Convert.ToInt32(Category.SelectedValue);
            var material = Material.Text;
            var price = Price.Text;

            if (name == null || category == -1 || material == null || price == null)
            {
                // Error
                debug_Current("Error");
            }
            else
            {
                try
                {
                    sds.InsertCommand = sds.InsertCommand = "Insert into [dbo].[Foods] ([img],[name],[ingredients],[price],[fromCategory])" +
                        "VALUES ('" + "" + "', '" + name + "', '" + material + "', '" + price + "', '" + category + "')";
                    sds.Insert();
                }
                catch (Exception err)
                {
                    debug_Current(err.ToString());
                }


                //if (category == 1)  // pizza
                //{
                //    sds.InsertCommandType = SqlDataSourceCommandType.Text;
                //    sds.InsertCommand = "Insert into [dbo].[Foods] ([img],[name],[ingredients],[price],[fromCategory]) VALUES (@img, @name, @ingredients, @price, @fromCategory)";

                //    //sds.InsertParameters.Add("id", "1");
                //    sds.InsertParameters.Add("img", "");
                //    sds.InsertParameters.Add("name", name);
                //    sds.InsertParameters.Add("ingredients", material);
                //    sds.InsertParameters.Add("price", price);
                //    //sds.InsertParameters.Add(new Parameter("fromCategory", System.Data.DbType.Int32, category);
                //    sds.Insert();
                //}
                //else if (category == 2)  // hamburger
                //{
                //    sds.InsertCommandType = SqlDataSourceCommandType.Text;
                //    //sds.InsertCommand = "Insert into [dbo].[food_hamburger] ([img],[name],[ingredients],[price]) VALUES (@img, @name, @ingredients, @price)";
                //    try
                //    {
                //        sds.InsertCommand = sds.InsertCommand = "Insert into [dbo].[Foods] ([img],[name],[ingredients],[price],[fromCategory])" +
                //            "VALUES ('" + "" + "', '" + name + "', '" + material + "', '" + price + "', '" + category + "')";
                //        sds.Insert();
                //    }
                //    catch (Exception err)
                //    {
                //        debug_Current(err.ToString());
                //    }

                //    //sds.InsertParameters.Add("id", "1");
                //    //sds.InsertParameters.Add("img", "");
                //    //sds.InsertParameters.Add("name", name);
                //    //sds.InsertParameters.Add("ingredients", material);
                //    //sds.InsertParameters.Add("price", price);
                //    //sds.Insert();
                //}
                //else if (category == 3)  // dessert
                //{
                //    sds.InsertCommandType = SqlDataSourceCommandType.Text;
                //    sds.InsertCommand = "Insert into [dbo].[food_dessert] ([img],[name],[ingredients],[price]) VALUES (@img, @name, @ingredients, @price)";

                //    //sds.InsertParameters.Add("id", "1");
                //    sds.InsertParameters.Add("img", "");
                //    sds.InsertParameters.Add("name", name);
                //    sds.InsertParameters.Add("ingredients", material);
                //    sds.InsertParameters.Add("price", price);
                //    sds.Insert();
                //}
            }
        }

        public void debug_Current(string debugMes)
        {
            System.Diagnostics.Debug.WriteLine(debugMes);
        }
    }
}