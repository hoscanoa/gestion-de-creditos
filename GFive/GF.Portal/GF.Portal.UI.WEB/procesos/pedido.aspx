<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masters/fgPortal.Master" CodeBehind="pedido.aspx.vb" Inherits="GF.Portal.UI.WEB.pedido" %>
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
                                        <td><asp:Label ID="Label1" runat="server" CssClass="CeldaTituloTexto" Text="Registro de Pedidos"></asp:Label></td>
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
    
    <asp:Panel ID="pnlDatos" runat="server" Width="100%">
        <table style="width: 100%; background-color: #f4f4f4" class="EditarLabel" cellspacing="0" border="1" cellpadding="0">
            <tbody>
                <tr>
                    <td style="width: 100%; padding-top: 5px; padding-bottom: 3px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%; padding-top: 5px; padding-bottom: 3px">
                        <asp:Label ID="Label3" runat="server" Text="Encabezado" CssClass="CeldaTituloTexto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td style="width:150px">
                                    <asp:Label ID="Label9" runat="server" CssClass="CeldaTituloTexto" Text="Pedido ID :" SkinID="lblNormal" ></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel4" runat ="server">
                                        <ContentTemplate>
                                            <input ID="txtPedidoId" runat="server"  type="text"  class="CsstxtNormalObligatorio" MaxLength="15" autocomplete="off" />                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:150px">
                                    <asp:Label ID="Label2" runat="server" CssClass="CeldaTituloTexto" Text="Cliente Ruc :" SkinID="lblNormal" ></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpDescripcion" runat ="server">
                                        <ContentTemplate>
                                            <input ID="txtRuc" runat="server"  type="text"  class="CsstxtNormalObligatorio" MaxLength="15" autocomplete="off" />                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text="Cliente:" CssClass="CeldaTituloTexto" SkinID="lblNormal"></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lblCliente" runat="server" Text=""></asp:Label>                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Text="Fecha :" CssClass="CeldaTituloTexto" SkinID="lblNormal"></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                                                BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                                                ShowGridLines="True" Width="220px">
                                                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                                <SelectorStyle BackColor="#FFCC66" />
                                                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                                <OtherMonthDayStyle ForeColor="#CC9966" />
                                                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                                                    ForeColor="#FFFFCC" />
                                            </asp:Calendar>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:Button ID="btnAceptar" runat="server" Text="Buscar" Width="100px" OnClientClick="return validar();" SkinID="btnNormalSkin" />
                                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" Width="100px" SkinID="btnNormalSkin" />
                                </td>                             
                            </tr>
                            
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%; padding-top: 5px; padding-bottom: 3px">
                        <asp:Label ID="Label5" runat="server" Text="Detalle" CssClass="CeldaTituloTexto"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td style="width:150px">
                                    <asp:Label ID="Label6" runat="server" CssClass="CeldaTituloTexto" Text="Producto ID :" SkinID="lblNormal" ></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel5" runat ="server">
                                        <ContentTemplate>
                                            <input ID="txtProductoID" runat="server"  type="text"  class="CsstxtNormalObligatorio" MaxLength="20" autocomplete="off" />                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" runat="server" Text="Descripcion :" CssClass="CeldaTituloTexto" SkinID="lblNormal"></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lblDescripcion" runat="server" Text=""></asp:Label>                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:150px">
                                    <asp:Label ID="Label7" runat="server" CssClass="CeldaTituloTexto" Text="Cantidad:" SkinID="lblNormal" ></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel6" runat ="server">
                                        <ContentTemplate>
                                            <input ID="txtCantidad" runat="server"  type="text"  class="CsstxtNormalObligatorio" MaxLength="15" autocomplete="off" />                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:150px">
                                    <asp:Label ID="Label12" runat="server" CssClass="CeldaTituloTexto" Text="Precio:" SkinID="lblNormal" ></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel9" runat ="server">
                                        <ContentTemplate>
                                            <input ID="txtPrecio" runat="server"  type="text"  class="CsstxtNormalObligatorio" MaxLength="15" autocomplete="off" />                                            
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="100px" OnClientClick="return validar();" SkinID="btnNormalSkin" />
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
                                        <asp:LinkButton ID="lnkBtnCodigo" runat="server" SkinID="lnkBtnEncabezado" CommandArgument="idAccion" CommandName="idAccion" Height="100%">Producto ID</asp:LinkButton>
                                    </td>
                                    <td align="center" valign="middle" width="25%" class="_colGrilla">
                                        <asp:LinkButton ID="lnkBtnDescripcion" runat="server" SkinID="lnkBtnEncabezado" CommandArgument="descAccion" CommandName="descAccion" Height="100%">Descripcion</asp:LinkButton>
                                    </td>
                                    <td align="center" valign="middle" width="20%" class="_colGrilla">
                                        <asp:LinkButton ID="LinkCantidad" runat="server" SkinID="lnkBtnEncabezado" CommandArgument="descAccion" CommandName="descAccion" Height="100%">Cantidad</asp:LinkButton>
                                    </td>
                                    <td align="center" valign="middle" width="20%" class="_colGrilla">
                                        <asp:LinkButton ID="LinkPrecio" runat="server" SkinID="lnkBtnEncabezado" CommandArgument="descAccion" CommandName="descAccion" Height="100%">Precio</asp:LinkButton>
                                    </td>
                                    <td align="center" valign="middle" width="20%" class="_colGrilla">
                                        <asp:LinkButton ID="LinkSubTotal" runat="server" SkinID="lnkBtnEncabezado" CommandArgument="descAccion" CommandName="descAccion" Height="100%">SubTotal</asp:LinkButton>
                                    </td>
                                    <td align="center" valign="middle" width="5%" class="_colGrilla">
                                        <asp:Label ID="lblEliminar" runat="server" Text="Eliminar" SkinID="lblNormalNegrita"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                       </div>
                       <div style="overflow-y: scroll; overflow-x: hidden; width: 100%; height: 450px; scrollbar-face-color: #B5B5B5;" class="DivPanelGrilla">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwLista" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="0" ForeColor="Black"
                                                  GridLines="Vertical" Width="99%" Font-Names="Tahoma" DataKeyNames="ped_pro_id" SkinID="gvwListaSkin" ShowHeader="False" EnableSortingAndPagingCallbacks="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Código">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkCodigo" runat="server" CausesValidation="False" CommandName="Edit" ForeColor="Black" Height="20px" Style="display: block; text-decoration: none;" Text='<%# Eval("ped_pro_id") %>' CommandArgument='<%# Eval("ped_pro_id") %>'></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" Width="10%" Height="20px" />
                                                <ItemStyle HorizontalAlign="Center" Width="10%" Height="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkNombre" runat="server" CausesValidation="False" CommandName="Edit" ForeColor="Black" Height="20px" Style="display: block; text-decoration: none;" Text='<%# Eval("pro_descripcion") %>' CommandArgument='<%# Eval("ped_pro_id") %>'></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" Width="70%" Height="20px" />
                                                <ItemStyle HorizontalAlign="Left" Width="25%" Height="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cantidad">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkCantidad" runat="server" CausesValidation="False" CommandName="Edit" ForeColor="Black" Height="20px" Style="display: block; text-decoration: none;" Text='<%# Eval("ped_cantidad") %>' CommandArgument='<%# Eval("ped_pro_id") %>'></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" Width="10%" Height="20px" />
                                                <ItemStyle HorizontalAlign="Center" Width="20%" Height="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Precio">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkPrecio" runat="server" CausesValidation="False" CommandName="Edit" ForeColor="Black" Height="20px" Style="display: block; text-decoration: none;" Text='<%# Eval("ped_precio") %>' CommandArgument='<%# Eval("ped_pro_id") %>'></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" Width="10%" Height="20px" />
                                                <ItemStyle HorizontalAlign="Center" Width="20%" Height="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SubTotal">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkSubTotal" runat="server" CausesValidation="False" CommandName="Edit" ForeColor="Black" Height="20px" Style="display: block; text-decoration: none;" Text='<%# Eval("ped_subTotal") %>' CommandArgument='<%# Eval("ped_pro_id") %>'></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" Width="10%" Height="20px" />
                                                <ItemStyle HorizontalAlign="Center" Width="20%" Height="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Eliminar">
                                                <ItemTemplate>
                                                <asp:CheckBox ID="chkEliminar" runat="server" CausesValidation="False" ForeColor="Black" Height="20px" Style="display: block; text-decoration: none;" ToolTip="Eliminar"></asp:CheckBox>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" Width="5%" Height="20px" />
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" Height="20px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </td>
                </tr>
                <tr>
                   <td>   
                      <table>
                         <tr>
                             <td>
                                <asp:Label ID="Label10" runat="server" CssClass="CeldaTituloTexto" 
                                  SkinID="lblNormal" Text="Total S/. :"></asp:Label>
                             </td>
                             <td>
                                 <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                 <ContentTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                                 </ContentTemplate>
                                 </asp:UpdatePanel>
                             </td>
                             <td>
                             </td>
                             <td>
                                <asp:Button ID="btnGrabar" runat="server" OnClientClick="return validar();" 
                                 SkinID="btnNormalSkin" Text="Grabar" Width="100px" />
                             </td>
                    </tr>
                  </table>
                </td> 
              </tr>
            </tbody>
        </table>
    </asp:Panel>
    
      <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="0">
        <ProgressTemplate>
            <div id="divProgress" class="divProgreso" style="top:50%; left:60%;">
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
            document.getElementById('ctl00$ContentPlaceHolder1$txtId').value = '';
            document.getElementById('ctl00$ContentPlaceHolder1$txtDescripcion').value= '';
            document.getElementById('ctl00$ContentPlaceHolder1$txtCosto').value = '';
        }
        function validar() {
            if (document.getElementById('ctl00$ContentPlaceHolder1$txtId').value == '') {
                alert('Debe ingresar el codigo del producto');
                document.getElementById('ctl00$ContentPlaceHolder1$txtId').focus();
                return (false);
            }
            if (document.getElementById('ctl00$ContentPlaceHolder1$txtDescripcion').value == '') {
                alert('Debe ingresar la descripcion del producto');
                document.getElementById('ctl00$ContentPlaceHolder1$txtDescripcion').focus();
                return (false);
            }
        }
        function validarBuscar() {
            if (document.getElementById('ctl00$ContentPlaceHolder1$txtBuscar').value == '') {
                alert('Debe ingresar la descripcion del producto');
                document.getElementById('ctl00$ContentPlaceHolder1$txtBuscar').focus();
                return (false);
            }
        }
    </script>
</asp:Content>
