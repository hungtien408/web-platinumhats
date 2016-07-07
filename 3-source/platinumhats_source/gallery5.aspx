<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="gallery5.aspx.cs" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Platinum Hats</title>
    <meta name="description" content="Platinum Hats" />--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#galleryLists .slider-for').slick({
                infinite: true,
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: true,
                fade: false,
                asNavFor: '#galleryLists .slider-nav'
            });
            $('#galleryLists .slider-nav').slick({
                slidesToShow: 5,
                slidesToScroll: 1,
                asNavFor: '#galleryLists .slider-for',
                dots: false,
                focusOnSelect: true
            });
            $('#galleryLists .slider-nav').on('afterChange', function (event, slick, currentSlide, nextSlide) {
                //remove all active class
                $('#galleryLists .slider-nav .slick-slide').removeClass('slick-current');
                //set active class for current slide
                $('#galleryLists .slider-nav .slick-slide:not(.slick-cloned)').eq(currentSlide).addClass('slick-current');
            });
            $('#galleryLists .slider-nav .slick-slide:not(.slick-cloned)').eq(0).addClass('slick-current');
        });
    </script>
    <style type="text/css">
        .gallery-slider {
            width: 62%;
            margin: 0 auto;
            padding: 20px 0;
        }
        .slider-big, .slider-big .gallery-img {
            height: 100%;
        }
        .gallery-text {
            width: 100%;
            padding: 20px 0;
            border-top: 1px solid #000;
        }
        .gallery-smalls {
            padding: 0;
            border: 1px solid #000;
            border-top: none;
        }
        .slider-for {
            border: 1px solid #000;
        }
        .slider-small {
            border-right: 1px solid #000;
        }
        .gallery-small {
            padding: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main-in">
        <div class="container">
            <div class="head head-lineb">
                <div id="site" class="text-right">
                    <a class="home" id="A1" href="~/" runat="server">Home</a>&gt;<a href="product.aspx">Products</a>&gt;<span><asp:Label ID="lblTitle"
                        runat="server"></asp:Label></span>
                </div>
                <div class="head-title">
                    <h4 class="text-uppercase title-1 font400 cotit">
                        <asp:Label ID="lblTitle2" runat="server"></asp:Label></h4>
                    <%--<div class="node">
                        Previous headwear productions</div>--%>
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
                    <div class="slider-for">
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1" EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="slider-big">
                                    <div class="gallery-group">
                                        <div class="gallery-img">
                                            <img id="Img1" class="img-responsive" src='<%# "~/res/product/album/" + Eval("ImageName") %>'
                                                visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false 
: true %>' runat="server" alt="" />
                                        </div>
                                        <div class="gallery-text">
                                            <div class="text-in">
                                                <%# Eval("Title") %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                    <div class="gallery-smalls">
                        <div class="slider-nav">
                            <asp:ListView ID="ListView2" runat="server" DataSourceID="ObjectDataSource1" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="slider-small">
                                        <div class="gallery-small">
                                            <div class="small-box">
                                                <img id="Img2" class="img-responsive" src='<%# "~/res/product/album/thumbs/" + Eval("ImageName") %>'
                                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false 
: true %>' runat="server" alt="" width="154" height="80" />
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ProductImageSelectAll"
                    TypeName="TLLib.ProductImage">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ProductID" QueryStringField="gl" Type="String" />
                        <asp:Parameter Name="IsAvailable" Type="String" DefaultValue="true" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
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
