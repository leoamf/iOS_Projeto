//
//  MovimentoContaController.swift
//  AppBanco
//
//  Created by aluno on 12/05/18.
//  Copyright © 2018 aluno. All rights reserved.
//

import UIKit

class MovimentoContaController: UIViewController {

    @IBOutlet weak var swIsCredito: UISwitch!
    @IBOutlet weak var textValor: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btSalvar(_ sender: Any) {
        
         let valor = (textValor.text! as NSString).floatValue
        
        if valor == 0 {
            let alert = UIAlertController(title: "Valor inválido!", message: "Informe um valor válido!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }else{
            if swIsCredito.isOn == true {
                Cliente.instance.contaCorrente?.creditar(valor: valor )
            }else{
                Cliente.instance.contaCorrente?.debitar(valor: valor)
            }
            navigationController?.popViewController(animated: true)
        }


    }
    

}
