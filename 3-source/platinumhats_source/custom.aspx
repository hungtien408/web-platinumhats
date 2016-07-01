<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="custom.aspx.cs" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Platinum Hats</title>
    <meta name="description" content="Platinum Hats" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main-in">
        <div class="container">
            <div class="head head-lineb">
                <div id="site" class="text-right">
                    <a class="home" id="A1" href="~/" runat="server">Home</a>&gt;<span><asp:Label ID="lblTitle"
                        runat="server"></asp:Label></span>
                </div>
                <div class="head-title">
                    <h4 class="text-uppercase title-1 font400 cotit">
                        <asp:Label ID="lblTitle2" runat="server"></asp:Label></h4>
                    <div class="node">
                        Previous headwear productions</div>
                </div>
            </div>
            <div id="colAside" class="fright aside-280">
                <asp:ListView ID="lstProductCategory" runat="server" DataSourceID="odsProductCategory"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <a class="corner" href='<%# progressTitle(Eval("ProductCategoryName")) + "-pti-" + Eval("ProductCategoryID") + ".aspx" %>'>
                            <%# Eval("ProductCategoryName")%></a>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="menu-center mta35">
                            <a class="corner" href="custom.aspx">All</a> <span runat="server" id="itemPlaceholder" />
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductCategory" runat="server" SelectMethod="ProductCategorySelectAll"
                    TypeName="TLLib.ProductCategory">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="10" Name="parentID" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                        <asp:Parameter DefaultValue="" Name="IsShowOnMenu" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <div id="colContent">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:ListView ID="lstProduct" runat="server" DataSourceID="odsProduct" EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="col-xs-4 element-item">
                                    <div class="product-box text-center">
                                        <a class="product-img box-img fancybox1 fancybox.iframe" href='<%# progressTitle(Eval("ProductName"))  +"-glm-" + Eval("ProductID") + ".aspx" %>'>
                                            <img src='<%# "~/res/product/" + Eval("ImageName") %>' visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>' runat="server" alt="" />
                                            <span class="mask-img"></span>
                                        </a>
                                        <h4 class="product-name">
                                            <a class="fancybox1 fancybox.iframe" href='<%# progressTitle(Eval("ProductName"))  +"-glm-" + Eval("ProductID") + ".aspx" %>'>
                                                <%# Eval("ProductName")%></a></h4>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div class="wrapper-product">
                                    <div class="row product-tb product-tbpos">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsProduct" runat="server" SelectMethod="ProductSelectAll"
                            TypeName="TLLib.Product">
                            <SelectParameters>
                                <asp:Parameter Name="StartRowIndex" Type="String" />
                                <asp:Parameter Name="EndRowIndex" Type="String" />
                                <asp:Parameter Name="Keyword" Type="String" />
                                <asp:Parameter Name="ProductName" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="PriceFrom" Type="String" />
                                <asp:Parameter Name="PriceTo" Type="String" />
                                <asp:QueryStringParameter DefaultValue="10" Name="CategoryID" QueryStringField="pci" Type="String" />
                                <asp:Parameter Name="ManufacturerID" Type="String" />
                                <asp:Parameter Name="OriginID" Type="String" />
                                <asp:Parameter Name="Tag" Type="String" />
                                <asp:Parameter Name="InStock" Type="String" />
                                <asp:Parameter Name="IsHot" Type="String" />
                                <asp:Parameter Name="IsNew" Type="String" />
                                <asp:Parameter Name="IsBestSeller" Type="String" />
                                <asp:Parameter Name="IsSaleOff" Type="String" />
                                <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                <asp:Parameter Name="FromDate" Type="String" />
                                <asp:Parameter Name="ToDate" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <div class="pager">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12" PagedControlID="lstProduct">
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
            <div class="clearfix">
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
