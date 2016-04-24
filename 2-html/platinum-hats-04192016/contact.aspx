<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="lien_he" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Platinum Hats</title>
    <meta name="description" content="Platinum Hats" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main-in">
        <div class="container">
            <div class="head head-lineb mb35">
                <div id="site" class="text-right">
                    <a class="home" id="A1" href="~/" runat="server">Home</a>&gt;<span>Contact</span>
                </div>
                <div class="head-title">
                    <h4 class="text-uppercase title-1 font400 cotit">Contact us</h4>
                    <div class="node">We will respond to all your contacts fastest</div>
                </div>
            </div>
            <div class="row wrap-contact">
                <div class="col-md-6">
                    <div class="ipadmo-992">
                        
                        <h4 class="text-uppercase">CÔNG TY CỔ PHẦN CNTT TRẦN LÊ</h4>
                        <div class="address-contact">
                            <p><span class="fa fa-map-marker"></span>111 Ten Lua, Binh Tri Dong B Ward, Tan Binh Distris, HCMC </p>
                            <p><span class="fa fa-phone"></span>+84 ( 08) 1234 5678</p>
                            <p><span class="fa fa-envelope"></span><a href="mailto:chanpin89@gmail.com">chanpin89@gmail.com</a></p>
                        </div>
                    </div>
                    <div class="wrap-send">
                        <h5><span>Send a message</span></h5>
                        <div class="contact-w">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label class="contact-lb">Họ &amp; Tên<span class="error">*</span></label>
                                    <div class="contact-input">
                                        <asp:TextBox ID="txtFullName" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <label class="contact-lb">Email<span class="error">*</span></label>
                                    <div class="contact-input">
                                        <asp:TextBox ID="TextBox1" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="contact-w">
                            <label class="contact-lb">Lời nhắn<span class="error">*</span></label>
                            <div class="contact-input">
                                <asp:TextBox ID="TextBox2" CssClass="contact-area" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="contact-w contact-code">
                            <div class="row">
                                <div class="col-sm-5 col-xs-6">
                                    <label class="contact-lb">1 + 1 = ? ( Are you human )</label>
                                    <div class="contact-input">
                                        <asp:TextBox ID="TextBox3" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="contact-w">
                            <div class="contact-btn">
                                <asp:Button ID="Button1" CssClass="button-btn" runat="server" Text="Gởi lời nhắn" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 desktop-showhide">
                    <div class="desktop-992">
                        
                        <h4 class="text-uppercase">CÔNG TY CỔ PHẦN CNTT TRẦN LÊ</h4>
                        <div class="address-contact">
                            <p><span class="fa fa-map-marker"></span>111 Ten Lua, Binh Tri Dong B Ward, Tan Binh Distris, HCMC </p>
                            <p><span class="fa fa-phone"></span>+84 ( 08) 1234 5678</p>
                            <p><span class="fa fa-envelope"></span><a href="mailto:chanpin89@gmail.com">chanpin89@gmail.com</a></p>
                        </div>
                    </div>

                    <h5 class="mb20"><span>Our Location</span></h5>
                    <div id="mapshow"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>

