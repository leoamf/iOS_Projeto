//
//  Cliente.swift
//  AppBanco
//
//  Created by aluno on 12/05/18.
//  Copyright © 2018 aluno. All rights reserved.
//

import Foundation

class Cliente{
    var login : String? = nil
    var password : String? = nil
    var contaCorrente : ContaCorrente? = nil
    
    static var singleton : Cliente?
    
    static var instance: Cliente {
        get{
            if singleton == nil {
                singleton = Cliente(login: "teste",password: "123")
                singleton?.contaCorrente = ContaCorrente()
                singleton?.contaCorrente?.creditar(valor: 5000)
                singleton?.contaCorrente?.debitar(valor: 100)
                singleton?.contaCorrente?.debitar(valor: 1400)
                singleton?.contaCorrente?.creditar(valor: 1101)
            }
            return singleton!
        }
    }
    
    init(login : String, password : String) {
        self.login = login
        self.password = password
        self.contaCorrente = nil
    }
    
    func validarLogin(login : String, password : String) -> Bool {
        if  login == Cliente.instance.login &&
            password == Cliente.instance.password {
            return true
        }else{
            return false
        }
    }
    
    
}
