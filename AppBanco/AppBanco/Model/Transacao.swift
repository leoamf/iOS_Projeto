//
//  Transacao.swift
//  AppBanco
//
//  Created by aluno on 12/05/18.
//  Copyright © 2018 aluno. All rights reserved.
//

import Foundation

enum TipoTransacao {
    case Debito,Credito
}
class  Transacao{
    
    var tipoTransacao : TipoTransacao = .Credito
    var valor : Float = 0
    
    init(tipoTransacao : TipoTransacao, valor : Float) {
        self.tipoTransacao = tipoTransacao
        self.valor = valor
    }
    
    
    
}
