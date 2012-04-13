<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masters/fgPortal.Master" CodeBehind="ListaPedido.aspx.vb" Inherits="GF.Portal.UI.WEB.ListaPedido" %>
<%@ MasterType VirtualPath="~/masters/fgPortal.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ OutputCache Duration="15" VaryByParam="*" Location="Client" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnListar" runat="server" Text="Button" SkinID="btnNormalSkin" />
    <asp:GridView ID="gvwLista" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="0" ForeColor="Black"
                                                  GridLines="Vertical" Width="99%" Font-Names="Tahoma" DataKeyNames="ped_pro_id" SkinID="gvwListaSkin" ShowHeader="False" EnableSortingAndPagingCallbacks="True"></asp:GridView>
</asp:Content>
