using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class gallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["gl"]))
            {
                var oProduct = new Product();
                var dv = oProduct.ProductSelectOne(Request.QueryString["gl"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                //strTitle = Server.HtmlDecode(row["ArticleTitleEn"].ToString());
                //strDescription = Server.HtmlDecode(row["DescriptionEn"].ToString());
                //strMetaTitle = Server.HtmlDecode(row["MetaTittleEn"].ToString());
                //strMetaDescription = Server.HtmlDecode(row["MetaDescriptionEn"].ToString());

                hdnlink.Value = progressTitle(row["ProductName"].ToString()) + "-gl-" + row["ProductID"].ToString() + ".aspx";
            }
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}