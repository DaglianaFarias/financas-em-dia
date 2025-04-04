import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["selectTipoPagamento", "inputsCartaoCredito"]
  connect() {
    // this.element.textContent = "Hello World!"
    console.log("Controller conectada")
  }

  exibirOpcoesCartaoCredito() {
    const tipo = this.selectTipoPagamentoTarget.value;

    if(tipo == "cartao_credito"){
      this.inputsCartaoCreditoTarget.style.display = "flex";
    } else {
      this.inputsCartaoCreditoTarget.style.display = "none";
    }
  }
}