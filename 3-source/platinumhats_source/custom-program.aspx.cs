﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class custom_program : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["cp"]))
            {
                var oArticle = new Article();
                var dv = oArticle.ArticleSelectOne(Request.QueryString["cp"]).DefaultView;

                //var oArticleCategory = new ArticleCategory();
                //var dv2 = oArticleCategory.ArticleCategorySelectOne("7").DefaultView;
                //lblTitle.Text = dv2[0]["ArticleCategoryName"].ToString();

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ArticleTitle"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTittle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                hdnCustomProgram.Value = progressTitle(dv[0]["ArticleTitle"].ToString()) + "-cp-" + dv[0]["ArticleID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Custom Program";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            lblTitle.Text = strTitle;
            lblTitle2.Text = strTitle;
        }
    }
    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}