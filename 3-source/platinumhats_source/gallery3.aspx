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
            $(".slider-big .gallery-img").append("<img src='" + b + "' alt='' />");
            $('.gallery-small a').click(function () {
                var a = $(this).attr('data-img');
                //alert(a);
                $(".slider-big .gallery-img img").remove();
                $(".slider-big .gallery-img").append("<img src='" + a + "' alt='' />");
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
            padding-left: 5px;
        }
        .gallery-small
        {
            padding: 0 2px;
        }
        .slider-small
        {
            float: left;
            width: 94px;
        }
        .gallery-img img, .small-box img
        {
            display: block;
            width: 100%;
        }
        .slider-big, .slider-big .gallery-img
        {
            background-color: #000;
            position: relative;
            width: 500px;
            z-index: 1;
            display: block;
            overflow: hidden;
            float: left;
            outline: none;
            position: relative;
            display: block;
            height: 100%;
        }
        .slider-for
        {
            position: relative;
            display: block;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="galleryLists" class="gallery-slider">
        <div class="slider-for">
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
                                    <a href="javascript:void(0);" data-img='<%# "res/product/album/thumbs/" + Eval("ImageName") %>'><img id="Img1" class="img-responsive" src='<%# "~/res/product/album/thumbs/" + Eval("ImageName") %>'
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
