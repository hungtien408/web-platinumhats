<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Platinum Hats</title>
    <meta name="description" content="Platinum Hats" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main-in">
        <div class="container">
            <div class="wrapper-e404 text-center">
                <h2>404</h2>
                <h4>Page not found</h4>
                <p>Please try one of the following page :</p>
                <p><a href="~/" runat="server" class="text-uppercase"><span class="fa fa-long-arrow-left"></span>HOME PAGE</a></p>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" Runat="Server">
</asp:Content>

