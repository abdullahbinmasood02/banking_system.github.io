using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;



public partial class courses : System.Web.UI.Page
{
    public string conString = "Data Source=localhost\\SQLEXPRESS;Initial Catalog=bank_customers;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM customers", con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        string id = TextBox11.Text;
        string id1 = TextBox12.Text;
        string amount = TextBox1.Text;

        if (string.IsNullOrEmpty(id) || string.IsNullOrEmpty(id1) || string.IsNullOrEmpty(amount))
        {
            // Display an error message
            LabelError.Text = "Please enter all Boxes.";
            return;
        }

        if(!AuthenticateUser(id) || !AuthenticateUser(id1))
        {

            LabelError.Text = "Invalid Customer ID";
            return;
        }

        else
        {

            if(!updateBalance(id, amount, id1))
                LabelError.Text = "Amount exceeds current amount of sending customer";
            else
                LabelError.Text = "Amount sent successfully";
        }
    }

      private bool AuthenticateUser(string id)
    {
        bool authenticated = false;
        SqlConnection conn = new SqlConnection(conString);

        string query = "select count(*)  from customers where customer_id=@id";




        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@id", id);

        conn.Open();
        int count = Convert.ToInt32(cmd.ExecuteScalar());
        // cmd.ExecuteNonQuery();
        //cmd.Dispose();
        conn.Close();

        if (count > 0)
            authenticated = true;




        return authenticated;
    }

    private bool updateBalance(string id,string balance,string id1)
    {
        
        SqlConnection conn = new SqlConnection(conString);

        string query = "select current_balance  from customers where customer_id=@id";
        string query3 = "select current_balance  from customers where customer_id=@id1";


        string query1 = "update customers SET current_balance=@new_balance where customer_id=@id";
        string query2 = "update customers SET current_balance=@new_balance1 where customer_id=@id1";

        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@id", id);

        conn.Open();
        object result = cmd.ExecuteScalar();
        // cmd.ExecuteNonQuery();
        //cmd.Dispose();
       
        int bal = Convert.ToInt32(result);
        
        if (bal - int.Parse(balance) >= 0)
        {
            SqlCommand cmd1 = new SqlCommand(query1, conn);
            cmd1.Parameters.AddWithValue("@id", id);


           
            int new_balance=bal-int.Parse(balance);
            cmd1.Parameters.AddWithValue("@new_balance", new_balance);
            cmd1.ExecuteNonQuery();
            // cmd.ExecuteNonQuery();
            //cmd.Dispose();
            SqlCommand cmd2 = new SqlCommand(query3, conn);
            cmd2.Parameters.AddWithValue("@id1", id1);
       


            result = cmd2.ExecuteScalar();
            // cmd.ExecuteNonQuery();
            //cmd.Dispose();

            int bal1 = Convert.ToInt32(result)+bal;

            SqlCommand cmd3 = new SqlCommand(query2, conn);
           
            cmd3.Parameters.AddWithValue("@new_balance1", bal1);
            cmd3.Parameters.AddWithValue("@id1", id1);
            cmd3.ExecuteNonQuery();
            conn.Close();
            return true;
            


        }

        conn.Close();


        return false;
    }

}



