function pageLoad() {
    mypageload();
}
(function ($) {
    $(function () {
        myfunload();
    });
})(jQuery);
//function===============================================================================================
/*=============================fun=========================================*/
function myfunload() {
    $(".panel-a").mobilepanel();
    $("#menu > li").clone().appendTo($("#menuMobile"));
    $("#menuMobile input").remove();
    $("#menuMobile > li > a").append('<span class="fa fa-chevron-circle-right iconar"></span>');
    $("#menuMobile > li > .menu-sub").each(function () {
        $(this).parent("li").append($(this).find("ul:first"));
    });
    $("#menuMobile .menu-sub, #menuMobile .menubg").remove();
    $(".link-search").click(function (event) {
        event.preventDefault();
        $(this).toggleClass("current");
        var idsearch = $(this).attr("href");
        $(idsearch).fadeToggle();
        return false;
    });
    $('#sliderBanner').slick({
        autoplay: true,
        autoplaySpeed: 2000,
        pauseOnHover: false,
        dots: true,
        infinite: true,
        speed: 500,
        fade: true,
        cssEase: 'linear'
    });
    if ($('#sliderParent').size() == 1) {
        var sliderParent = $('#sliderParent').imagesLoaded(function () {
            sliderParent.slick({
                autoplay: true,
                autoplaySpeed: 3000,
                //cssEase: 'linear',
                dots: false,
                infinite: true,
                speed: 300,
                slidesToShow: 7,
                slidesToScroll: 1,
                responsive: [
                  {
                      breakpoint: 1200,
                      settings: {
                          slidesToShow: 7
                      }
                  },
                  {
                      breakpoint: 1024,
                      settings: {
                          slidesToShow: 6
                      }
                  },
                  {
                      breakpoint: 992,
                      settings: {
                          slidesToShow: 5
                      }
                  },
                  {
                      breakpoint: 639,
                      settings: {
                          slidesToShow: 4
                      }
                  },
                  {
                      breakpoint: 479,
                      settings: {
                          slidesToShow: 3
                      }
                  },
                  {
                      breakpoint: 359,
                      settings: {
                          slidesToShow: 2
                      }
                  }
                  // You can unslick at a given breakpoint now by adding:
                  // settings: "unslick"
                  // instead of a settings object
                ]
            });
            sliderParent.textHeight({
                activetit: true,
                listcss: [{ cssname: ".parent-box" }],
                wpointb: true,
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: false,
                csstr: ".element-item",
                max: true
            });
        });
    }
    if ($(".aside-mobile").size() > 0) {
        $(".aside-mobile").clone().appendTo($("#mobileAside"));
        $("#mobileAside .list-menu input").remove();
    }
    if ($("#colAside.aside-sticky").size() == 1) {

        $('#colAside.aside-sticky').hcSticky({
            top: 110,
            bottomEnd: 0,
            wrapperClassName: 'sidebar-sticky'
        });
        mysticky();
        var clearstic;
        $(window).resize(function () {
            clearTimeout(clearstic);
            clearstic = setTimeout(function () {
                mysticky();
            }, 0);
        });
    }
    if ($("#listPricing").size() == 1) {
        $("#listPricing div").addClass("element-item").find("> ul").addClass("list-col").find("> li:first-child").addClass("title-pricing").parent("ul").find("> li:eq(1)").addClass("pricing");

        var tbpricing = $('#listPricing').textHeight({
            activetit: true,
            listcss: [{ cssname: ".title-pricing" }, { cssname: ".pricing" }, { cssname: ".list-col" }],
            desbool: false,
            listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
            tbrow: true,
            csstr: ".element-item",
            max: true
        });
        var tbclear;
        clearTimeout(tbclear);
        tbclear = setTimeout(function () {
            tbpricing.isotope({
                itemSelector: '.element-item',
                layoutMode: 'fitRows'
            });
        }, 0);
    }
    mymap();
    myfunsroll();
}
/*=========================================================================*/
function mysticky() {
    if ($(window).width() > 992) {
        $('#colAside.aside-sticky').parent(".sidebar-sticky").addClass("sticky-992");
    } else {
        $('#colAside.aside-sticky').parent(".sidebar-sticky").removeClass("sticky-992");
    }
}
/*=======================================*/
function mypageload() {
    $(".select").uniform();
    myListTb();
}
/*========================================================================*/
function myListTb() {
    $(".fullbox-img").bgsizebox({
        fimg: true,
        imgcss: "hideo",
        attrname: "data-src"
    });
    if ($('.isotopelist').size() == 1) {
        var isolist = $('.isotopelist').imagesLoaded(function () {
            isolist.isotope({
                itemSelector: '.element-item',
                layoutMode: 'fitRows'
            });
        });
    }
    $(".fancybox").fancybox({
        wrapCSS: 'pro-popup',
        openEffect: 'elastic',
        closeEffect: 'elastic',

        helpers: {
            title: {
                type: 'inside'
            }
        }
    });
    if ($('.product-tb').size() > 0) {
        var tbpro;
        var producttb = $('.product-tb').imagesLoaded(function () {
            producttb.textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-img" }, { cssname: ".product-name" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
            clearTimeout(tbpro);
            tbpro = setTimeout(function () {
                producttb.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 300);
        });
    }
    if ($('.about-tb25').size() > 0) {
        var tbabout;
        var abouttb = $('.about-tb25').imagesLoaded(function () {
            abouttb.textHeight({
                activetit: true,
                listcss: [{ cssname: ".aboutco-img" }, { cssname: ".aboutco-name" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
            clearTimeout(tbpro);
            tbabout = setTimeout(function () {
                abouttb.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 300);
        });
    }
    if ($('.news-tb').size() > 0) {
        var tbnews;
        var newstb = $('.news-tb').imagesLoaded(function () {
            newstb.textHeight({
                activetit: true,
                listcss: [{ cssname: ".news-img" }, { cssname: ".date" }, { cssname: ".news-name" }],
                desbool: true,
                listpos: [{ cssnamepos: ".description", cssheightnum: "5" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
            clearTimeout(tbnews);
            tbnews = setTimeout(function () {
                newstb.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 300);
        });
    }
    if ($('.about-steps').size() > 0) {
        var tbnews;
        var newstb = $('.about-steps').imagesLoaded(function () {
            newstb.textHeight({
                activetit: true,
                listcss: [{ cssname: ".step-img" }, { cssname: ".about-name" }, { cssname: ".description" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "5" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
            clearTimeout(tbnews);
            tbnews = setTimeout(function () {
                newstb.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 300);
        });
    }
    if ($('.news-order').size() > 0) {
        var tbnews;
        var newstb = $('.news-order').imagesLoaded(function () {
            newstb.textHeight({
                activetit: true,
                listcss: [{ cssname: ".news-img" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
            clearTimeout(tbnews);
            tbnews = setTimeout(function () {
                newstb.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 300);
        });
    }
}
/*===============================*/
function myfunsroll() {
    menusroll();
    mysroll();
    $("#sroltop a").click(function () {
        $("html, body").stop(true, true).animate({ scrollTop: 0 }, 500);
        return false;
    });
}
function mysroll() {
    mysrol();
    $(window).scroll(function () {
        mysrol();
    });
}
function mysrol() {
    var topsroll = $(window).scrollTop();
    if (topsroll > 100) {
        $("#sroltop").stop(true, true).animate({ "opacity": 1 }, 500);
    } else {
        $("#sroltop").stop(true, true).animate({ "opacity": 0 }, 500);
    }
} 
function menusroll() {
    var htop = $("#header").height();
    srollmenu(htop);
    $(window).scroll(function () {
        srollmenu(htop);
    });
}
function srollmenu(htop) {
    if ($(window).scrollTop() > htop) {
        $("#header").addClass("header-sroll");
    } else {
        $("#header").removeClass("header-sroll");
    }
}
//==================
function mymap() {
    mympp();
    var timeout;
    $(window).resize(function () {
        clearTimeout(timeout);
        setTimeout(function () {
            mympp();
        }, 500);
    });
}
function mympp() {
    $('#mapwrap').remove();
    if ($(window).width() > 768) {
        $('#mapshow').append('<div id="mapwrap"><iframe id="iframe" src="map.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
    }
}