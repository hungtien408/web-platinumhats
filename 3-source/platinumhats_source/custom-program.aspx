<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="custom-program.aspx.cs" Inherits="custom_program" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Platinum Hats</title>
    <meta name="description" content="Platinum Hats" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnCustomProgram" runat="server" />
    <a class="a-link-cp" href="<%= hdnCustomProgram.Value %>"></a>
    <div id="main-in">
        <div class="container">
            <div class="head head-lineb mb35">
                <div id="site" class="text-right">
                    <a class="home" id="A1" href="~/" runat="server">Home</a>&gt;<span><asp:Label ID="lblTitle2"
                        runat="server"></asp:Label></span>
                </div>
                <div class="head-title">
                    <h4 class="text-uppercase title-1 font400 cotit">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label></h4>
                    <%--<div class="node">
                        4 easy steps to custom headwear</div>--%>
                </div>
            </div>
            <asp:ListView ID="lstCustom" runat="server" DataSourceID="odsCustom" EnableModelValidation="True">
                <ItemTemplate>
                    <%--<h4 class="title-2 linebc text-center font300 cocus">
                        <%# Eval("Title") %></h4>--%>
                    <div class="nodec mb50">
                        <%# Eval("Title2") %></div>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsCustom" runat="server" SelectMethod="ArticleSelectOne"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ArticleID" QueryStringField="cp" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--<div class="wrapper-step">
                <div class="row about-steps">
                    <div class="col-md-3 col-xs-6 element-item">
                        <div class="about-step">
                            <a href="#" class="step-img"><img src="assets/images/program-step-1.gif" alt=""/></a>
                            <div class="about-content">
                                <h4 class="about-name"><a class="text-center" href="#">Inquiry &amp; quote</a></h4>
                                <div class="description">
                                    <p>To get a quote, please send us completed templates or descriptions (with logos if possible). For a complete quote, please provide your shipping address. A sales rep will handle your inquiry from day 1 to delivery and answer all your questions about our custom order process.</p>
                                    <ul style="color: #4abad6; margin: 0 0 10px; padding-left: 20px;"><li><span style="color: #3e3e3e;">Send your inquiry :</span> <a href="#">Get a quote form</a></li></ul>
                                    <p>Before sending your inquiry, we encourage you to read the following pages:</p>
                                    <ul style="list-style: none; padding: 0; margin: 0;">
                                        <li><a href="#">- Custom program</a></li>
                                        <li><a href="#">- Pricing</a></li>
                                        <li><a href="#">- About Platinum Hats</a></li>
                                    </ul>
                                </div>
                                <div class="liner"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-6 element-item">
                        <div class="about-step">
                            <a href="#" class="step-img"><img src="assets/images/program-step-2.gif" alt=""/></a>
                            <div class="about-content">
                                <h4 class="about-name"><a class="text-center" href="#">Pre-production and sampling</a></h4>
                                <div class="description">
                                    <p>Once the quote is approved and the deposit is paid, we will prepare your templates including all artworks and their placement, dimensions, colors, etc. A free pre-production sample is systematically included with every production order. You will received several pictures of your sample by email for approval (you can also get the sample shipped to you, you only have to pay for shipping).</p>
                                    <p>Note: you can also order and receive a sample only, before placing an order.</p>
                                </div>
                                <div class="liner"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-6 element-item">
                        <div class="about-step">
                            <a href="#" class="step-img"><img src="assets/images/program-step-3.gif" alt=""/></a>
                            <div class="about-content">
                                <h4 class="about-name"><a class="text-center" href="#">Production</a></h4>
                                <div class="description">
                                    <p>Once the sample is approved, production starts! You don’t have anything to do, everything is handled by our production team in Vietnam. Once the production is finished, we do a final control and the order is ready to be shipped. Thanks to our full-time presence in Vietnam, no time is lost  between emails and different time frames.</p>
                                </div>
                                <div class="liner"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-6 element-item">
                        <div class="about-step">
                            <a href="#" class="step-img"><img src="assets/images/program-step-4.gif" alt=""/></a>
                            <div class="about-content">
                                <h4 class="about-name"><a class="text-center" href="#">Delivery!</a></h4>
                                <div class="description">
                                    <p>Once the sample is approved, production starts! You don’t have anything to do, everything is handled by our production team in Vietnam. Once the production is finished, we do a final control and the order is ready to be shipped. Thanks to our full-time presence in Vietnam, no time is lost  between emails and different time frames.</p>
                                </div>
                                <div class="liner"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
