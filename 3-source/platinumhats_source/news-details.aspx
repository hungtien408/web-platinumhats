<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="news-details.aspx.cs" Inherits="news_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Platinum Hats</title>
    <meta name="description" content="Platinum Hats" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main-in">
        <div class="container">
            <div class="head head-lineb">
                <div id="site" class="text-right">
                    <asp:ListView ID="lstBreadcrum" runat="server" DataSourceID="odsBreadcrum" EnableModelValidation="True">
                        <ItemTemplate>
                            <%# "<a href='" + progressTitle(Eval("ArticleCategoryName")) + "-tci-" + Eval("ArticleCategoryID") + ".aspx" + "'>" + Eval("ArticleCategoryName") + "</a> &gt; "%>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <a class="home" id="A1" href="~/" runat="server">Home</a> &gt;<span runat="server"
                                id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsBreadcrum" runat="server" SelectMethod="ArticleCategoryHierarchyToTopSelectAll"
                        TypeName="TLLib.ArticleCategory">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="CurrentArticleCategoryID" QueryStringField="tci"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:Label ID="lblArticleTitle" runat="server"></asp:Label>
                </div>
                <div class="head-title">
                    <h1 class="text-uppercase title-1 font400 cotit">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
                    <div class="node">
                        information activities of the company</div>
                </div>
            </div>
            <asp:ListView ID="lstNewDetails" runat="server" DataSourceID="odsNewDetails" EnableModelValidation="True">
                <ItemTemplate>
                    <h1 class="title-1 text-center titco2 ptb20">
                        <%# Eval("ArticleTitle") %></h1>
                    <div class="date">
                        By Platinum hats -
                        <%# string.Format("{0:dd/MM/yyyy}", Eval("CreateDate"))%></div>
                    <div class="wrapper-text lineb7">
                        <div class="newsa-img">
                            <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/news-imgs.jpg" %>'
                                runat="server" /></div>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsNewDetails" runat="server" SelectMethod="ArticleSelectOne"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ArticleID" QueryStringField="tt" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ListView ID="lstNewSame" runat="server" DataSourceID="odsNewSame" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-md-3 col-xs-6 element-item">
                        <div class="news-box text-center">
                            <a href='<%# progressTitle(Eval("ArticleTitle")) + "-tci-" + Eval("ArticleCategoryID") + "-tt-" + Eval("ArticleID") + ".aspx" %>' class="news-img box-img fullbox-img cover-img">
                                <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/news-img-1.jpg" %>'
                                            runat="server" /></a>
                            <h1 class="news-names">
                                <a href='<%# progressTitle(Eval("ArticleTitle")) + "-tci-" + Eval("ArticleCategoryID") + "-tt-" + Eval("ArticleID") + ".aspx" %>'><%# Eval("ArticleTitle") %></a></h1>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="row news-order">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsNewSame" runat="server" SelectMethod="ArticleSameSelectAll"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:Parameter DefaultValue="4" Name="RerultCount" Type="String" />
                    <asp:QueryStringParameter Name="ArticleID" QueryStringField="tt"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
