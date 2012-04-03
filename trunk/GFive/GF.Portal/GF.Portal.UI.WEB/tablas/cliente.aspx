<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masters/fgPortal.Master" CodeBehind="cliente.aspx.vb" Inherits="GF.Portal.UI.WEB.cliente" %>
<%@ MasterType VirtualPath="~/masters/fgPortal.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ OutputCache Duration="15" VaryByParam="*" Location="Client" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <table style="width: 100%; background-color: #f4f4f4;" cellspacing="0">
        <tr class="_filaEncabezadoPrincipal">
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td><asp:Label ID="Label1" runat="server" CssClass="CeldaTituloTexto" Text="Tabla de Clientes"></asp:Label></td>
                                        <td align="right">
                                            <asp:ImageButton ID="imgEliminar" runat="server" ImageUrl="~/imagenes/diseño/delete.png" AlternateText="Eliminar" Width="17px" OnClientClick="return ConfirmaEliminacion(this);" />
                                            <asp:ImageButton ID="imgExportar" runat="server" ImageUrl="../imagenes/diseño/excel.gif" AlternateText="Exportar" Width="17px" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    
    <asp:Panel ID="pnlClientes" runat="server" Width="100%">
        <table style="width: 100%; background-color: #f4f4f4" class="EditarLabel" cellspacing="0" border="1" cellpadding="0">
            <tbody>
                <tr>
                    <td style="width: 100%; padding-top: 5px; padding-bottom: 3px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%; padding-top: 5px; padding-bottom: 3px">
                        <asp:Label ID="Label3" runat="server" CssClass="CeldaTituloTexto" Text="Buscar: " SkinID="lblNormal"></asp:Label>
                        <input id="txtBuscar" runat="server" class="CsstxtFiltro" type="text" autocomplete="off" maxlength="55" />
                        <asp:ImageButton ID="imgBuscar" runat="server" ImageUrl="../imagenes/diseño/find.png" Height="20px" Width="20px" OnClientClick="return validarBuscar();" AlternateText="Busqueda" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td style="width:150px">
                                    <asp:Label ID="Label9" runat="server" CssClass="CeldaTituloTexto" Text="RUC :" SkinID="lblNormal" ></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel4" runat ="server">
                                        <ContentTemplate>
                                            <input ID="txtRuc" runat="server"  type="text"  class="CsstxtNormalObligatorio" MaxLength="15" autocomplete="off" />                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:150px">
                                    <asp:Label ID="Label2" runat="server" CssClass="CeldaTituloTexto" Text="Razon Social :" SkinID="lblNormal" ></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpDescripcion" runat ="server">
                                        <ContentTemplate>
                                            <input ID="txtRazonSocial" runat="server"  type="text"  class="CsstxtNormalObligatorio" MaxLength="55" autocomplete="off" />                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                           <%-- <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="Sexo:" CssClass="CeldaTituloTexto" SkinID="lblNormal"></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <input id="Macho" type="radio" name="sexo" checked="true" runat="server"/>
                                            <asp:Label ID="Label6" runat="server" Text="Macho" CssClass="CsslblNormal"></asp:Label> 
                                            <input id="Hembra" type="radio" name="sexo" runat="server" />
                                            <asp:Label ID="Label7" runat="server" Text="Hembra" CssClass="CsslblNormal"></asp:Label> 
                                        </ContentTemplate>
                                     </asp:UpdatePanel>
                                </td>
                            </tr>--%>
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Text="Direccion :" CssClass="CeldaTituloTexto" SkinID="lblNormal"></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <input id="txtDireccion" type="text" runat="server" class="CsstxtNormal" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <%--<tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" CssClass="CeldaTituloTexto" Text="Estado :" SkinID="lblNormal"></asp:Label>
                                </td>
                                <td>
                                    <select id="Select1" runat="server" class="CssddlNormal" name="selEstado">
                                        <option></option>
                                    </select>
                                </td>
                            </tr>--%>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="100px" OnClientClick="return validar();" SkinID="btnNormalSkin" />
                                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" Width="100px" SkinID="btnNormalSkin" />
                                </td>                             
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="width: 100%; height: 20px; scrollbar-face-color: #B5B5B5;">
                            <table cellpadding="0" cellspacing="1" width="100%">
                                <tr align="center">
                                    <td align="center" valign="middle" width="10%" class="_colGrilla">
                                        <asp:LinkButton ID="lnkBtnCodigo" runat="server" SkinID="lnkBtnEncabezado" CommandArgument="idAccion" CommandName="idAccion" Height="100%">RUC</asp:LinkButton>
                                    </td>
                                    <td align="center" valign="middle" width="50%" class="_colGrilla">
                                        <asp:LinkButton ID="lnkBtnNombre" runat="server" SkinID="lnkBtnEncabezado" CommandArgument="descAccion" CommandName="descAccion" Height="100%">Razon Social</asp:LinkButton>
                                    </td>
                                    <td align="center" valign="middle" width="30%" class="_colGrilla">
                                        <asp:LinkButton ID="LinkDireccion" runat="server" SkinID="lnkBtnEncabezado" CommandArgument="descAccion" CommandName="descAccion" Height="100%">Direccion</asp:LinkButton>
                                    </td>
                                    <td align="center" valign="middle" width="10%" class="_colGrilla">
                                        <asp:Label ID="lblEliminar" runat="server" Text="Eliminar" SkinID="lblNormalNegrita"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                       </div>
                       <div style="overflow-y: scroll; overflow-x: hidden; width: 100%; height: 450px; scrollbar-face-color: #B5B5B5;" class="DivPanelGrilla">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwLista" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="0" ForeColor="Black"
                                                  GridLines="Vertical" Width="99%" Font-Names="Tahoma" DataKeyNames="cli_ruc" SkinID="gvwListaSkin" ShowHeader="False" EnableSortingAndPagingCallbacks="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Código">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkCodigo" runat="server" CausesValidation="False" CommandName="Edit" ForeColor="Black" Height="20px" Style="display: block; text-decoration: none;" Text='<%# Eval("Cli_Ruc","{0:00000}") %>' CommandArgument='<%# Eval("Cli_Ruc") %>'></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" Width="10%" Height="20px" />
                                                <ItemStyle HorizontalAlign="Center" Width="10%" Height="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción de Clientes">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkNombre" runat="server" CausesValidation="False" CommandName="Edit" ForeColor="Black" Height="20px" Style="display: block; text-decoration: none;" Text='<%# Eval("Cli_RazonSocial") %>' CommandArgument='<%# Eval("Cli_Ruc") %>'></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" Width="70%" Height="20px" />
                                                <ItemStyle HorizontalAlign="Left" Width="50%" Height="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Direccion">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDireccion" runat="server" CausesValidation="False" CommandName="Edit" ForeColor="Black" Height="20px" Style="display: block; text-decoration: none;" Text='<%# Eval("Cli_Direccion") %>' CommandArgument='<%# Eval("Cli_Ruc") %>'></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" Width="10%" Height="20px" />
                                                <ItemStyle HorizontalAlign="Center" Width="30%" Height="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Eliminar">
                                                <ItemTemplate>
                                                <asp:CheckBox ID="chkEliminar" runat="server" CausesValidation="False" ForeColor="Black" Height="20px" Style="display: block; text-decoration: none;" ToolTip="Eliminar Caballo"></asp:CheckBox>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" Width="9%" Height="20px" />
                                                    <ItemStyle HorizontalAlign="Center" Width="9%" Height="20px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </asp:Panel>
        
    
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="0">
        <ProgressTemplate>
            <div id="divProgress" class="divProgreso">
                <img src="../imagenes/procesos/gif_loading.gif" align="middle" alt="Procesando" />
                <asp:Label ID="lblprogreso" runat="server" Text=" Procesando..." CssClass="EditarLabel"></asp:Label></div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    
    <script src="../javascript/FG.js" type="text/javascript"></script>
    
    <script language="javascript" type="text/javascript">
        function ConfirmaEliminacion(sender) {
            return confirm('¿Está seguro que desea eliminar el registro?\n' + sender.alt);
        }
        function MuestraPanel() {
            limpiarControles();
            $find(mpDetalle).show();
            return true;
        }
        function limpiarControles() {
            document.getElementById('ctl00$ContentPlaceHolder1$txtRuc').value = '';
            document.getElementById('ctl00$ContentPlaceHolder1$txtRazonSocial').value= '';
            document.getElementById('ctl00$ContentPlaceHolder1$txtDireccion').value = '';
        }
        function validar() {
            if (document.getElementById('ctl00$ContentPlaceHolder1$txtRuc').value == '') {
                alert('Debe ingresar los 11 digitos del ruc del cliente');
                document.getElementById('ctl00$ContentPlaceHolder1$txtRuc').focus();
                return (false);
            }
            if (document.getElementById('ctl00$ContentPlaceHolder1$txtRazonSocial').value == '') {
                alert('Debe ingresar la razon social del cliente');
                document.getElementById('ctl00$ContentPlaceHolder1$txtRazonSocial').focus();
                return (false);
            }
        }
        function validarBuscar() {
            if (document.getElementById('ctl00$ContentPlaceHolder1$txtBuscar').value == '') {
                alert('Debe ingresar la razon social del cliente');
                document.getElementById('ctl00$ContentPlaceHolder1$txtBuscar').focus();
                return (false);
            }
        }
    </script>
</asp:Content>
