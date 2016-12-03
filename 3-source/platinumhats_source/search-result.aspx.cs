using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (((DataView)odsProduct.Select()).Count <= DataPager1.PageSize)
            //{
            //    DataPager1.Visible = false;
            //}
            lblTitle.Text = Request.QueryString["kw"];
        }
    }
}