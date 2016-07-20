<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="about-us.aspx.cs" Inherits="about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<title>Platinum Hats</title>
    <meta name="description" content="Platinum Hats" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnAbout" runat="server" />
    <a class="a-link-ab" href="<%= hdnAbout.Value %>"></a>
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
                        Learn more about our company and benefits</div>--%>
                </div>
            </div>
            <asp:ListView ID="lstAbout" runat="server" DataSourceID="odsAbout" EnableModelValidation="True">
                <ItemTemplate>
                    <%--<div class="aboutus-img">
                        <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/article/" + Eval("ImageName") : "~/assets/images/about-co.jpg" %>' runat="server" />
                    </div>--%>
                    <div class="aboutus-content text-center">
                        <h4 class="text-uppercase title-3">
                            <%# Eval("ArticleTitle")%></h4>
                        <%--<div class="description lineb7">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                        </div>--%>
                        <div class="description">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="wrapper-about">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <%--<asp:ObjectDataSource ID="odsAbout" runat="server" SelectMethod="ArticleSelectOne"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ArticleID" QueryStringField="gt" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>--%>
            <asp:ObjectDataSource ID="odsAbout" runat="server" SelectMethod="ArticleSelectAll"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ArticleTitle" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="ArticleCategoryID" Type="String" />
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
            <%--<div class="row about-tb25">
                <div class="col-md-4 col-xs-6 element-item">
                    <div class="aboutco-box">
                        <a href="about-details.aspx" class="aboutco-img box-img fullbox-img contain-img"><img class="hideo" src="assets/images/about-pro-1.jpg" alt=""/></a>
                        <h4 class="aboutco-name"><a class="text-center" href="about-details.aspx">Text Example no.2</a></h4>
                        <div class="description">
                            <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. </p>
                            <p>Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-6 element-item">
                    <div class="aboutco-box">
                        <a href="about-details.aspx" class="aboutco-img box-img fullbox-img contain-img"><img class="hideo" src="assets/images/about-pro-1.jpg" alt=""/></a>
                        <h4 class="aboutco-name"><a class="text-center" href="about-details.aspx">Text Example no.2</a></h4>
                        <div class="description">
                            <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. </p>
                            <p>Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-6 element-item">
                    <div class="aboutco-box">
                        <a href="about-details.aspx" class="aboutco-img box-img fullbox-img contain-img"><img class="hideo" src="assets/images/about-pro-1.jpg" alt=""/></a>
                        <h4 class="aboutco-name"><a class="text-center" href="about-details.aspx">Text Example no.2</a></h4>
                        <div class="description">
                            <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. </p>
                            <p>Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered</p>
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
