<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="GF.Portal.UI.WEB.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>.:: GFive | Seguridad ::. </title>
    <link href="../App_Themes/PrincipalTheme/FullGanador.css" rel="stylesheet" type="text/css" />

    <script language="JavaScript" type="text/javascript">
        function SetearFocoInicio() {
            document.getElementById('txtUsuario').focus();
        }
    </script>
    <style type="text/css">
        .style1
        {
            height: 40px;
        }
        .filaEncabezadoPrincipal
        {
            background-image: url('../imagenes/px_td.jpg');
            width: 100%;
            background-repeat: repeat;
        }
        .filaEncabezadoTitulo
        {
            background-image: url('../imagenes/submenu3.PNG');
            background-repeat: repeat;
        }
        .filaEncabezado
        {
            background-image: url('../imagenes/submenu3.PNG');
            width: 100%;
            background-repeat: repeat;
        }
        .colGrilla
        {
            background-image: url('../imagenes/submenu2.PNG');
            height: 20px;
            background-repeat: repeat;
        }
        .style2
        {
            height: 135px;
            width: 41%;
        }
        .style3
        {
            width: 41%;
        }
    </style>
</head>
<body bgcolor="#FFFFFF" style="margin: 0px;" onload="javascript:SetearFocoInicio()"
    oncontextmenu="return false">
    <form id="frmLogin" runat="server" method="post">
    <!-- [if !supportLineBreakNewLine] -->
    <!-- [endif] -->
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3" class="HeaderLogoMaster">
                </td>
            </tr>
            <tr>
                <td colspan="3" class="HeaderRowMaster">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="HeaderCellMasterLeft" style="width: 5%; padding-left: 4px;">
                                <asp:Label ID="lblFecha" runat="server" Text="Fecha :" CssClass="HeaderLabelMaster"
                                    Font-Names="Tahoma" Font-Size="Small"></asp:Label>
                            </td>
                            <td class="HeaderCellMasterCenter" style="width: 5%;">
                                <asp:UpdatePanel ID="updFecha" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="txtfecha" runat="server" Text="-" CssClass="HeaderLabelMaster"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td class="HeaderCellMasterCenter" style="width: 0.5%; padding-left: 5px; padding-right: 5px;">
                            </td>
                            <td class="HeaderCellMasterCenter" style="width: 13%;">
                            </td>
                            <td class="HeaderCellMasterCenter" style="width: 65.5%;">
                            </td>
                            <td class="HeaderCellMasterCenter" style="width: 0.5%; padding-left: 5px; padding-right: 5px;">
                                <asp:Label ID="Label2" runat="server" Text="|" CssClass="HeaderLabelMaster"></asp:Label>
                            </td>
                            <td class="HeaderCellMasterCenter" style="width: 5%;">
                                <asp:Label ID="Label1" runat="server" Text="Desconectado" CssClass="HeaderLabelMaster"
                                    Font-Names="Tahoma" Font-Size="Small"></asp:Label>
                            </td>
                            <td class="HeaderCellMasterCenter" style="width: 0.5%; padding-left: 5px; padding-right: 5px;">
                                <asp:Label ID="lbldivision1" runat="server" Text="|" CssClass="HeaderLabelMaster"></asp:Label>
                            </td>
                            <td class="HeaderCellMasterCenter" style="width: 5%;">
                                <asp:LinkButton ID="lnkWebEvolta" runat="server" CssClass="HeaderLinkMaster" Text="GFive.com"
                                    CausesValidation="false"></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="background-color: #397DF3; height: 2px">
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="80%" cellpadding="35" cellspacing="2" align="center" class="PanelLogin">
                        <tr>
                            <td align="right" style="border-right: solid 1px #CECECE;" class="style2">
                                <br />
                                <asp:Image ID="imgFullGanador" runat="server" ImageUrl="~/imagenes/presentacion/gf.jpg"
                                    Height="200px" Width="200px" /><br />
                                <asp:Label ID="Label7" runat="server" Text="GFive.COM" Font-Names="Tahoma"
                                    Font-Size="X-Small" ForeColor="DimGray"></asp:Label><br />
                                <asp:Label ID="Label6" runat="server" Text="Copiright (c) 2012" Font-Names="Tahoma"
                                    Font-Size="X-Small" ForeColor="DimGray"></asp:Label>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </td>
                            <td style="text-align: left; height: 135px;" width="50%">
                                <table align="left" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td height="40px" valign="top">
                                            <asp:Label ID="lblconeccion" runat="server" Text="Iniciar sesión" Font-Bold="True"
                                                Font-Names="Tahoma" Font-Size="Medium" ForeColor="Black"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" width="40%">
                                            <asp:Label ID="lblUsername" runat="server" Text="Usuario" CssClass="EditarLabel"
                                                Font-Names="Tahoma" Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="EditarTextBox" MaxLength="12"
                                                        AutoCompleteType="Disabled" EnableViewState="False"></asp:TextBox>
                                                    <ajax:TextBoxWatermarkExtender ID="tweUsuario" runat="server" TargetControlID="txtUsuario"
                                                        WatermarkCssClass="logMarkaAgua" WatermarkText="Usuario">
                                                    </ajax:TextBoxWatermarkExtender>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">
                                            <asp:Label ID="lblPassword" runat="server" Text="Contraseña" CssClass="EditarLabel"
                                                Font-Names="Tahoma" Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtContraseña" runat="server" CssClass="EditarTextBox" MaxLength="12"
                                                        TextMode="Password" EnableViewState="False"></asp:TextBox>
                                                    <ajax:TextBoxWatermarkExtender ID="tweContraseña" runat="server" TargetControlID="txtContraseña"
                                                        WatermarkCssClass="logMarkaAgua" WatermarkText="Contraseña">
                                                    </ajax:TextBoxWatermarkExtender>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="bottom" class="style1">
                                            <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="EditarButtonLogin"
                                                EnableViewState="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="upMensaje" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Label ID="lblMsgError" runat="server" Text="[Mensaje]" Visible="False" Font-Names="Arial"
                                                        Font-Size="Smaller" Font-Underline="False" ForeColor="Red"></asp:Label>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnEntrar" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;" height="1px" class="style3">
                            </td>
                            <td style="text-align: left; vertical-align: top;" valign="top" height="20px">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="FooterRowMaster" width="100%">
                </td>
            </tr>
        </table>
    </div>
    <asp:UpdateProgress ID="upLoad" runat="server" DisplayAfter="0">
        <ProgressTemplate>
            <div id="divProgress">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/procesos/gif_loading.gif"
                    ImageAlign="Middle" Width="30px" Height="30px" />
                <asp:Label ID="lblprogreso" runat="server" Text=" Procesando..." CssClass="CsslblNormal"
                    Style="font-family: Tahoma; font-size: Small;"></asp:Label>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    </form>
</body>
</html>
