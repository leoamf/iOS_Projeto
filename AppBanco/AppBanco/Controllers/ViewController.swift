//
//  ViewController.swift
//  AppBanco
//
//  Created by aluno on 12/05/18.
//  Copyright © 2018 aluno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textLogin: UITextField!
    
    @IBAction func acessarSistema(_ sender: UIButton) {
        let login = textLogin.text
        let password = textPassword.text
        if !Cliente.instance.validarLogin(login: login!, password: password!){
            let alert = UIAlertController(title: "Usuário inválido!", message: "Login ou senha inválido!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        
    } 
}

