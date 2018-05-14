//
//  ContaCorrente.swift
//  AppBanco
//
//  Created by aluno on 12/05/18.
//  Copyright © 2018 aluno. All rights reserved.
//

import Foundation

class ContaCorrente{
    var transacoes : [Transacao]? = []
    var saldo : Float
    {
        get
        {
            var total : Float = 0.0
            for transacao in transacoes! {
                if transacao.tipoTransacao == .Credito{
                    total = total + transacao.valor
                }else{
                    total = total - transacao.valor
                }
            }
            return total
        }
    }
    var saldoFormatado : String {
        get
        {
          return String(format: "R$ %.2f",self.saldo)
        }
    }
    
    var totalRegistros : Int
    {
        get
        {
            return  transacoes!.count
        }
    }
    
    func debitar(valor : Float)  {
        let transacao = Transacao(tipoTransacao: TipoTransacao.Debito, valor: valor)
        transacoes!.append(transacao)
    }
    
    func creditar(valor : Float)  {
        let transacao = Transacao(tipoTransacao: TipoTransacao.Credito, valor: valor)
        transacoes!.append(transacao)
    }
}
