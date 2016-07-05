<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="gallery4.aspx.cs" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Platinum Hats</title>
    <meta name="description" content="Platinum Hats" />--%>
    <script type="text/javascript">
        $(document).ready(function () {
            var b = $('.gallery-small a:first-child').attr('data-img');
            var c = $('.gallery-small a:first-child').attr('data-title');
            $(".slider-big .gallery-img").append("<img src='" + b + "' alt='' />");
            $(".title-custom").text(c);
            $('.gallery-small a').click(function () {
                var a = $(this).attr('data-img');
                var d = $(this).attr('data-title');
                //alert(a);
                $(".slider-big .gallery-img img").remove();
                $(".slider-big .gallery-img").append("<img src='" + a + "' alt='' />");
                $(".title-custom").text(d);
            });
        });
    </script>
    <style type="text/css">
        .gallery-big
        {
            float: left;
        }
        .gallery-smalls
        {
            float: left;
            padding: 0;
            width: 52%;
            /*padding-left: 5px;*/
        }
        .gallery-small
        {
            /*padding: 0 2px;*/
            padding: 0;
        }
        .slider-small
        {
            float: left;
            /*width: 92px;*/
            width: 16%;
            border: 1px solid #000;
        }
        .gallery-img img, .small-box img
        {
            display: block;
            width: 100%;
        }
        .slider-big
        {
            background-color: #000;
            border: 1px solid #000;
            position: relative;
            /*width: 500px;
            height: 100%;*/
            width: 47%;
            height: 100%;
            z-index: 1;
            display: block;
            overflow: hidden;
            float: left;
            outline: none;
            position: relative;
            display: block;
        }
        .slider-big .gallery-img {
            height: 100%;
        }
        .slider-for
        {
            position: relative;
            display: block;
        }
        .title-custom, .title-custom2 {
            font-size: 20px;
            line-height: 36px;
            color: #000;
            margin: 5px 0;
            width: 46%;
            float: left;
        }
        .title-custom2 {
            text-align: center;
        }
        @media (max-width: 639px) {
            .slider-big, .slider-big .gallery-img, .gallery-smalls {
                width: 100%;
            }
            .title-custom2 {
                display: none;
            }
        }
    </style>
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
            <%--<div id="colAside" class="fright aside-280">
                <asp:ListView ID="lstProductCategory" runat="server" DataSourceID="odsProductCategory"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <a class="corner" href='<%# progressTitle(Eval("ProductCategoryName")) + "-pmi-" + Eval("ProductCategoryID") + ".aspx" %>'>
                            <%# Eval("ProductCategoryName")%></a>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="menu-center mta35">
                            <a class="corner" href="material.aspx">All</a> <span runat="server" id="itemPlaceholder" />
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductCategory" runat="server" SelectMethod="ProductCategorySelectAll"
                    TypeName="TLLib.ProductCategory">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="12" Name="parentID" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                        <asp:Parameter DefaultValue="" Name="IsShowOnMenu" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>--%>
            <div id="colContent">
                <div id="galleryLists" class="gallery-slider">
                    <h2 class="title-color">
                        Cotton Twill - 100% Cotton</h2>
                    <div class="slider-for">
                        <h4 class="title-custom">
                            Scarlet - TCX</h4>
                        <h4 class="title-custom2">
                            Color chart</h4>
                        <div class="slider-big">
                            <div class="gallery-group">
                                <div class="gallery-img">
                                </div>
                                <div class="gallery-text">
                                    <div class="text-in">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="gallery-smalls">
                        <div class="slider-nav">
                            <asp:ListView ID="ListView2" runat="server" DataSourceID="ObjectDataSource1" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="slider-small">
                                        <div class="gallery-small">
                                            <div class="small-box">
                                                <a href="javascript:void(0);" data-img='<%# "res/product/album/" + Eval("ImageName") %>'
                                                    data-title='<%# Eval("Title") %>'>
                                                    <img id="Img1" class="img-responsive" src='<%# "~/res/product/album/" + Eval("ImageName") %>'
                                                        visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false 
: true %>' runat="server" alt="" width="154" height="80" /></a>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ProductImageSelectAll"
                                TypeName="TLLib.ProductImage">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="ProductID" QueryStringField="glm" Type="String" />
                                    <asp:Parameter Name="IsAvailable" Type="String" DefaultValue="true" />
                                    <asp:Parameter Name="Priority" Type="String" />
                                    <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
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
