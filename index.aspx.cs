using System;
using System.Web.UI;
using System.Windows.Forms;

namespace Examen2_ASP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                string FechaActual = DateTime.Today.ToString("MM/dd/yyyy");
                lblFechaDeCompra.Text = FechaActual;
            }
        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            try
            {
                //Parse double to string
                double PrecioVenta = double.Parse(this.txtPrecioVenta.Text.ToString());
                double DescFab = double.Parse(this.txtDescFabri.Text.ToString());
                double DescDealer = double.Parse(this.txtDescDealer.Text.ToString());

                //Total Descuentos
                double TotalDescuentos = ((PrecioVenta) - (DescFab) - (DescDealer));

                //Format inserta valor en un cadena string
                string formatoTotalDescuentos = String.Format("{0:C}", TotalDescuentos);
                this.lblTotalNet.Text = formatoTotalDescuentos;

                double Pronto = double.Parse(this.txtProntoTradeIn.Text.ToString());

                //Balance adeudado
                double TotalBalAdeudado = ((TotalDescuentos) - (Pronto));
                string formatoBalAdeudado = String.Format("{0:C}", TotalBalAdeudado);
                this.lblBalance.Text = formatoBalAdeudado;

                //Total seguros
                double Seguro = double.Parse(this.txtSeguro.Text.ToString());
                double gExt = double.Parse(this.txtGarantiaExt.Text.ToString());
                double TotalSeguros = ((Seguro)) + (gExt);
                string formatoTotSeguros = string.Format("{0:C}", TotalSeguros);
                this.lblTotalSeguros.Text = formatoTotSeguros;

                //Total derechos
                double derecho1 = double.Parse(this.txtDerecho.Text.ToString());
                double derecho2 = double.Parse(this.txtRegistro.Text.ToString());
                double TotalDerechos = (derecho1 + derecho2);
                string formatoTotDerechos = string.Format("{0:C}", TotalDerechos);
                this.lblTotalDerechos.Text = formatoTotDerechos;

                //Pago Mensual
                double BalFinanciar = ((TotalBalAdeudado) + (TotalSeguros));
                string formatoBalFinanciar = string.Format("{0:C}", BalFinanciar);
                this.lblBalanceAFin.Text = formatoBalFinanciar;
                double balancefinanciar = BalFinanciar;
                double interes = double.Parse(this.Interes.Text.ToString());
                int numeroPlazos = int.Parse(this.ddlNPlazos.Text.ToString());
                //Math.Pow 
                double Pagomensual = (Math.Pow(1 + interes, numeroPlazos - 1) * balancefinanciar);
                double rate = interes / 100 / 12;
                double denominator = Math.Pow((1 + rate), numeroPlazos) - 1;
                //Math.Round
                Pagomensual = Math.Round(((rate + (rate / denominator)) * balancefinanciar), 0);
                string formatoPagoMensual = string.Format("{0:C}", Pagomensual);
                lblPagoMensualModal.Text =  formatoPagoMensual;

                double PrimerPago = (Pagomensual + TotalDerechos);
                string formatoPrimerPago = string.Format("{0:C}", PrimerPago);
                this.lblPrimerPago.Text = formatoPrimerPago;

                this.lblPlazo.Text = (numeroPlazos - 1).ToString();

                lblPagoMensualModal.Text = "Su pago mensual será: " + formatoPagoMensual;
                LinkButton1_Click(null,null);

            }
            catch (Exception) {
                if (txtPrecioVenta.Text == "" || txtDescFabri.Text == "" || txtDescDealer.Text == "" || txtProntoTradeIn.Text == "" ||
                    txtSeguro.Text == "" || txtGarantiaExt.Text == "" || txtDerecho.Text == "" || txtRegistro.Text == "")
                    MessageBox.Show("Please enter a value into all boxes");
            }
        
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            double vwPrice = 39999;
            txtPrecioVenta.Text = vwPrice.ToString();
            Convert.ToDouble(txtPrecioVenta.Text);
            lblSelectedCar.Text = "VW 2016";
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            double camaroPrice = 49999;
            txtPrecioVenta.Text = camaroPrice.ToString();
            Convert.ToDouble(txtPrecioVenta.Text);
            lblSelectedCar.Text = "Camaro 2016";
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            double mstgPrice = 47999;
            txtPrecioVenta.Text = mstgPrice.ToString();
            Convert.ToDouble(txtPrecioVenta.Text);
            lblSelectedCar.Text = "Mustang 2016";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }
    }
}