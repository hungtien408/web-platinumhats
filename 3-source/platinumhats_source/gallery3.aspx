<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gallery3.aspx.cs" Inherits="gallery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="assets/styles/slick.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/jquery.js" type="text/javascript"></script>
    <script src="assets/js/slick.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //            $('#galleryLists .slider-for').slick({
            //                infinite: true,
            //                slidesToShow: 1,
            //                slidesToScroll: 1,
            //                arrows: true,
            //                fade: false,
            //                asNavFor: '#galleryLists .slider-nav'
            //            });
            //            $('#galleryLists .slider-nav').slick({
            //                slidesToShow: 5,
            //                slidesToScroll: 1,
            //                asNavFor: '#galleryLists .slider-for',
            //                dots: false,
            //                focusOnSelect: true
            //            });
            //            $('#galleryLists .slider-nav').on('afterChange', function (event, slick, currentSlide, nextSlide) {
            //                //remove all active class
            //                $('#galleryLists .slider-nav .slick-slide').removeClass('slick-current');
            //                //set active class for current slide
            //                $('#galleryLists .slider-nav .slick-slide:not(.slick-cloned)').eq(currentSlide).addClass('slick-current');
            //            });
            //            $('#galleryLists .slider-nav .slick-slide:not(.slick-cloned)').eq(0).addClass('slick-current');
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
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="galleryLists" class="gallery-slider">
        <h2 class="title-color">Cotton Twill - 100% Cotton</h2>
        <div class="slider-for">
            <h4 class="title-custom">Scarlet - TCX</h4>
            <h4 class="title-custom2">Color chart</h4>
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
                                    <a href="javascript:void(0);" data-img='<%# "res/product/album/" + Eval("ImageName") %>' data-title='<%# Eval("Title") %>'><img id="Img1" class="img-responsive" src='<%# "~/res/product/album/" + Eval("ImageName") %>'
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
    </form>
</body>
</html>
