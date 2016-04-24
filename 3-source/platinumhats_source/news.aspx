<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="news.aspx.cs" Inherits="news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Platinum Hats</title>
    <meta name="description" content="Platinum Hats" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnNews" runat="server" />
    <a class="a-link-news" href="<%= hdnNews.Value %>"></a>
    <div id="main-in">
        <div class="container">
            <div class="head head-lineb">
                <asp:ListView ID="lstBreadcrum" runat="server" DataSourceID="odsBreadcrum" EnableModelValidation="True">
                    <ItemTemplate>
                        <%# Container.DataItemIndex == ((System.Data.DataView)odsBreadcrum.Select()).Count - 1 ? "<span>" + Eval("ArticleCategoryName") + "</span>" : "&gt; <a href='" + progressTitle(Eval("ArticleCategoryName")) + "-tci-" + Eval("ArticleCategoryID") + ".aspx" + "'>" + Eval("ArticleCategoryName") + "</a>  &gt; "%>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="site" class="text-right">
                            <a class="home" id="A1" href="~/" runat="server">Home</a> <span runat="server" id="itemPlaceholder" />
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsBreadcrum" runat="server" SelectMethod="ArticleCategoryHierarchyToTopSelectAll"
                    TypeName="TLLib.ArticleCategory">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CurrentArticleCategoryID" QueryStringField="tci"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="head-title">
                    <h4 class="text-uppercase title-1 font400 cotit">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label></h4>
                    <div class="node">
                        information activities of the company</div>
                </div>
            </div>
            <div class="menu-center wrap520">
                <a class="corner" href="news.aspx">All news</a>
                <asp:ListView ID="lstNewCategory" runat="server" DataSourceID="odsNewCategory" EnableModelValidation="True">
                    <ItemTemplate>
                        <a class="corner" href='<%# progressTitle(Eval("ArticleCategoryName")) + "-tci-" + Eval("ArticleCategoryID") + ".aspx" %>'>
                            <%# Eval("ArticleCategoryName") %></a>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsNewCategory" runat="server" SelectMethod="ArticleCategorySelectAll"
                    TypeName="TLLib.ArticleCategory">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="2" Name="parentID" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                        <asp:Parameter DefaultValue="" Name="IsShowOnMenu" Type="String" />
                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:ListView ID="lstNews" runat="server" DataSourceID="odsNews" EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="col-md-4 col-xs-6 element-item">
                                <div class="news-box">
                                    <a href='<%# progressTitle(Eval("ArticleTitle")) + "-tci-" + Eval("ArticleCategoryID") + "-tt-" + Eval("ArticleID") + ".aspx" %>'
                                        class="news-img box-img fullbox-img cover-img">
                                        <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/news-img-1.jpg" %>'
                                            runat="server" /></a>
                                    <h4 class="news-name">
                                        <a href='<%# progressTitle(Eval("ArticleTitle")) + "-tci-" + Eval("ArticleCategoryID") + "-tt-" + Eval("ArticleID") + ".aspx" %>'>
                                            <%# Eval("ArticleTitle") %></a></h4>
                                    <div class="date">
                                        <span>Date :
                                            <%# string.Format("{0:dd/MM/yyyy}", Eval("CreateDate"))%></span> by Platinum
                                        hats</div>
                                    <div class="description">
                                        <%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 260) %>
                                    </div>
                                    <div class="more-details text-right">
                                        <a class="corner" href='<%# progressTitle(Eval("ArticleTitle")) + "-tci-" + Eval("ArticleCategoryID") + "-tt-" + Eval("ArticleID") + ".aspx" %>'>
                                            more ..</a></div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="row news-tb">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsNews" runat="server" SelectMethod="ArticleSelectAll"
                        TypeName="TLLib.Article">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ArticleTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:QueryStringParameter DefaultValue="2" Name="ArticleCategoryID" QueryStringField="tci" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter Name="IsHot" Type="String" />
                            <asp:Parameter Name="IsNew" Type="String" />
                            <asp:Parameter Name="FromDate" Type="String" />
                            <asp:Parameter Name="ToDate" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <div class="pager">
                        <%--<a href="#" class="first fa fa-backward"></a><a href="#" class="prev fa fa-caret-left">
                </a><a href="#" class="current">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"
                    class="next fa fa-caret-right"></a><a href="#" class="last fa fa-forward"></a>--%>
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12" PagedControlID="lstNews">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowNextPageButton="false"
                                    ShowPreviousPageButton="false" ButtonCssClass="first fa fa-backward" RenderDisabledButtonsAsLabels="true"
                                    FirstPageText="" />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowNextPageButton="false"
                                    ShowPreviousPageButton="true" ButtonCssClass="prev fa fa-caret-left" RenderDisabledButtonsAsLabels="true"
                                    PreviousPageText="" />
                                <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="numer-paging" CurrentPageLabelCssClass="current" />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false" ButtonCssClass="next fa fa-caret-right"
                                    ShowNextPageButton="true" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"
                                    NextPageText="" />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ButtonCssClass="last fa fa-forward"
                                    ShowNextPageButton="false" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"
                                    LastPageText="" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
