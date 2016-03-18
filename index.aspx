<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Examen2_ASP.WebForm1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="jumbotron">
      <h1>Pago Mensual Prestamo de Autos</h1>
    </div>
    <div class="row">
        <div class="col-md-4">
             <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/vw2016.png" OnClick="ImageButton1_Click" />
        </div>
        <div class="col-md-4">
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/camaro2016.png" OnClick="ImageButton3_Click" />
        </div>
        <div class="col-md-4">
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/mustang2016.png" style="margin-left: 0px" OnClick="ImageButton2_Click" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-sm-12 col-md-6" style="left: 0px; top: 0px">
            <table style="width: 50%; margin-left: 20px;">
                <tr>
                    <td style="width: 476px">
                        <asp:Label ID="lblSelectedCar" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="height: 22px; width: 476px">
                        <asp:TextBox ID="txtPrecioVenta" runat="server" CssClass="form form-control" Width="203px" BackColor="#009933" Font-Bold="True" ForeColor="White" style="margin-left: 143; margin-top: 0"></asp:TextBox>
                    </td>
                    <td style="height: 22px">Precio Venta</td>
                </tr>
                <tr>
                    <td style="width: 476px; height: 50px">
                        <asp:TextBox ID="txtDescFabri" runat="server" CssClass="form-control" Width="203px"></asp:TextBox>
                    </td>
                    <td style="height: 50px">Desc. Fabricante </td>
                </tr>
                <tr>
                    <td style="width: 476px">
                        <asp:TextBox ID="txtDescDealer" runat="server" CssClass="form-control" Width="203px"></asp:TextBox>
                    </td>
                    <td>Desc. Dealer</td>
                </tr>
                <tr>
                    <td class="text-right" style="width: 476px">Total neto:</td>
                    <td>
                        <asp:Label ID="lblTotalNet" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 476px; height: 20px">
                        <asp:TextBox ID="txtProntoTradeIn" runat="server" CssClass="form-control" Width="203px"></asp:TextBox>
                    </td>
                    <td style="height: 20px">Pronto/Trade-In</td>
                </tr>
                <tr>
                    <td style="width: 476px; height: 21px" class="text-right">Balance adeudado:</td>
                    <td style="height: 21px">
                        <asp:Label ID="lblBalance" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 476px; height: 21px;">
                        <asp:TextBox ID="txtSeguro" runat="server" CssClass="form-control" width="203px"></asp:TextBox>
                    </td>
                    <td style="height: 21px">Seguro</td>
                </tr>
                <tr>
                    <td style="width: 476px">
                        <asp:TextBox ID="txtGarantiaExt" runat="server" CssClass="form-control" width="203px"></asp:TextBox>
                    </td>
                    <td>Garantia Extendida</td>
                </tr>
                <tr>
                    <td style="width: 476px" class="text-right">Total seguros</td>
                    <td>
                        <asp:Label ID="lblTotalSeguros" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 476px">
                        <asp:TextBox ID="txtDerecho" runat="server" CssClass="form-control" Width="203px"></asp:TextBox>
                    </td>
                    <td>Derechos</td>
                </tr>
                <tr>
                    <td style="width: 476px">
                        <asp:TextBox ID="txtRegistro" runat="server" CssClass="form-control" Width="203px"></asp:TextBox>
                    </td>
                    <td>Registro</td>
                </tr>
                <tr>
                    <td style="width: 476px" class="text-right">Total derechos:</td>
                    <td>
                        <asp:Label ID="lblTotalDerechos" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 476px; height: 24px;">
                        Interes: <asp:Label ID="lblSliderValue" runat="server" ForeColor="#CC0000"></asp:Label>
                        <asp:TextBox ID="Interes" runat="server"></asp:TextBox>
                        <ajaxToolkit:SliderExtender ID="Interes_SliderExtender" runat="server" BoundControlID="lblSliderValue"  BehaviorID="TextBox2_SliderExtender" Maximum="10" Minimum="0" TargetControlID="Interes" Decimals="2" />
                    </td>
                    <td style="height: 24px"></td>
                </tr>
                <tr>
                    <td style="width: 476px; height: 24px;" class="text-right">Plazos:</td>
                    <td style="height: 24px">
                        <asp:DropDownList ID="ddlNPlazos" runat="server" CssClass="btn btn-default dropdown-toggle">
                            <asp:ListItem>48</asp:ListItem>
                            <asp:ListItem>60</asp:ListItem>
                            <asp:ListItem>72</asp:ListItem>
                            <asp:ListItem>84</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 476px">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCalcular" runat="server" CssClass="btn btn-primary" Text="Calcular" OnClick="btnCalcular_Click" 
                           /><!--data-toggle="modal" data-target="#myModal"-->
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-sm-12 col-md-6" style="left: 2px; top: 19px">
        
            <table style="width: 50%; float: right" margin-right: 60px;">
                <tr>
                    <td class="text-right">Fecha de compra: <asp:Label ID="lblFechaDeCompra" runat="server" ForeColor="#333333"></asp:Label></td>
                </tr>
                <tr>
                    <td class="text-right">Balance a financiar: <asp:Label ID="lblBalanceAFin" runat="server" ForeColor="#CC0000"></asp:Label></td>
                </tr>
                <tr>
                    <td class="text-right">
                        <asp:Panel ID="Panel1" runat="server" BorderColor="#009933" BorderStyle="Dashed">
                            <div class="text-left">
                                Primer pago:
                                <asp:Label ID="lblPrimerPago" runat="server" ForeColor="#CC0000"></asp:Label>
                                <br />
                                <asp:Label ID="lblPlazo" runat="server" ForeColor="#CC0000"></asp:Label>
                                &nbsp;de:
                                <asp:Label ID="lblCantTotalPlazo" runat="server" ForeColor="#CC0000"></asp:Label>
                            </div>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">
                        <div class="text-left">
                            Fecha primer pago: 
                        </div>
                        <asp:TextBox ID="txtCalendar" runat="server" CssClass="form-control" Width="150px"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="txtCalendar_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="txtCalendar" />
                    </td>
                </tr>
            </table>
        
        </div>
    </div>
 
<!-- Bootstrap Modal Dialog -->
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><asp:Label ID="lblModalTitle" runat="server" Text="">Info</asp:Label></h4>
                    </div>
                    <div class="modal-body">
                    <asp:Label ID="lblPagoMensualModal" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

    
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" data-toggle="modal" data-target="#myModal"></asp:LinkButton>
    
    </asp:Content>
