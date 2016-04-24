<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="contact.aspx.cs" Inherits="lien_he" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.40412.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2012.3.1016.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Contact Us</title>
    <meta name="description" content="Contact Us" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main-in">
        <div class="container">
            <div class="head head-lineb mb35">
                <div id="site" class="text-right">
                    <a class="home" id="A1" href="~/" runat="server">Home</a>&gt;<span>Contact</span>
                </div>
                <div class="head-title">
                    <h4 class="text-uppercase title-1 font400 cotit">
                        Contact us</h4>
                    <div class="node">
                        We will respond to all your contacts fastest</div>
                </div>
            </div>
            <div class="row wrap-contact">
                <div class="col-md-6">
                    <div class="ipadmo-992">
                        <h4 class="text-uppercase">
                            CÔNG TY CỔ PHẦN CNTT TRẦN LÊ</h4>
                        <div class="address-contact">
                            <p>
                                <span class="fa fa-map-marker"></span>111 Ten Lua, Binh Tri Dong B Ward, Tan Binh
                                Distris, HCMC
                            </p>
                            <p>
                                <span class="fa fa-phone"></span>+84 ( 08) 1234 5678</p>
                            <p>
                                <span class="fa fa-envelope"></span><a href="mailto:chanpin89@gmail.com">chanpin89@gmail.com</a></p>
                        </div>
                    </div>
                    <div class="wrap-send">
                        <h5>
                            <span>Send a message</span></h5>
                        <div class="contact-w">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label class="contact-lb">
                                        Họ &amp; Tên<span class="error">*</span></label>
                                    <div class="contact-input">
                                        <asp:TextBox ID="txtFullName" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                            Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtFullName"
                                            ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <label class="contact-lb">
                                        Email<span class="error">*</span></label>
                                    <div class="contact-input">
                                        <asp:TextBox ID="txtEmail" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                            runat="server" ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Email is error!"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                            ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Information required!"
                                            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="contact-w">
                            <label class="contact-lb">
                                Lời nhắn<span class="error">*</span></label>
                            <div class="contact-input">
                                <asp:TextBox ID="txtContent" CssClass="contact-area" runat="server" TextMode="MultiLine"></asp:TextBox>
                                 <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="txtContent"
                                ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                        <div class="col-xs-6">
                            <div class="contact-w">
                                <div class="contact-input">
                                    <div class="wcodes">
                                        <asp:TextBox ID="txtVerifyCode" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="txtVerifyCode_WatermarkExtender" runat="server"
                                            Enabled="True" WatermarkText="Code" TargetControlID="txtVerifyCode">
                                        </asp:TextBoxWatermarkExtender>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="contact-w">
                                <div class="contact-input">
                                    <div class="wcodes">
                                        <asp:RadCaptcha ID="RadCaptcha1" ForeColor="Red" Font-Bold="true" ValidationGroup="SendEmail"
                                            runat="server" ErrorMessage="+ Mã an toàn: không chính xác." ValidatedTextBoxID="txtVerifyCode"
                                            Display="Dynamic">
                                            <CaptchaImage Height="35" Width="135" RenderImageOnly="True" />
                                        </asp:RadCaptcha>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="contact-w">
                            <div class="contact-btn">
                                <asp:Button ID="btnSend" CssClass="button-btn" runat="server" Text="Gởi lời nhắn" ValidationGroup="SendEmail" OnClick="btSend_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 desktop-showhide">
                    <div class="desktop-992">
                        <h4 class="text-uppercase">
                            CÔNG TY CỔ PHẦN CNTT TRẦN LÊ</h4>
                        <div class="address-contact">
                            <p>
                                <span class="fa fa-map-marker"></span>111 Ten Lua, Binh Tri Dong B Ward, Tan Binh
                                Distris, HCMC
                            </p>
                            <p>
                                <span class="fa fa-phone"></span>+84 ( 08) 1234 5678</p>
                            <p>
                                <span class="fa fa-envelope"></span><a href="mailto:chanpin89@gmail.com">chanpin89@gmail.com</a></p>
                        </div>
                    </div>
                    <h5 class="mb20">
                        <span>Our Location</span></h5>
                    <div id="mapshow">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
