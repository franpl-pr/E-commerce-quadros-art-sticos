import React, {useState} from "react";
import './sessaocheckout_style.css';

function SessaoCheckout(){
    return(
        <div className="checkout_box_sessoes">
                <div className="checkout_div_sessoes">
                    <div className="checkout_sessoes_div1">
                        <span className="checkout_sessoes_span1">Checkout</span>
                        <span className="checkout_sessoes_span2">Pagamento</span>
                        <span className="checkout_sessoes_span3">Finalização da compra</span>
                    </div>
                    <div className="checkout_sessoes_div2">
                        <div className="checkout_div_bolinha_preta"/>
                        <div className="checkout_div_linha_maior"/>
                        <div className="checkout_div_bolinha_cinza"/>
                        <div className="checkout_div_linha_maior"/>
                        <div className="checkout_div_bolinha_cinza"/>
                    </div>
                </div>
            </div>
    )
}
export default SessaoCheckout;