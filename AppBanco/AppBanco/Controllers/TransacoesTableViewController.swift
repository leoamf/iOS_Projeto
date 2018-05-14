//
//  TransacoesTableViewController.swift
//  AppBanco
//
//  Created by aluno on 12/05/18.
//  Copyright © 2018 aluno. All rights reserved.
//

import UIKit

class TransacoesTableViewController: UITableViewController {

    @IBOutlet var tableTransacoes: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableTransacoes.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Cliente.instance.contaCorrente?.totalRegistros)!+1
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
 

        if indexPath.row >= (Cliente.instance.contaCorrente?.totalRegistros)! {
            cell.textLabel?.text = "Saldo"
            cell.detailTextLabel?.text =  Cliente.instance.contaCorrente?.saldoFormatado
            cell.imageView?.image = nil
            cell.textLabel?.textColor = UIColor.blue
            cell.detailTextLabel?.textColor = UIColor.blue
        }else{
            let transacao =  Cliente.instance.contaCorrente?.transacoes![indexPath.row]
            let dataFormatada = (transacao?.dataFormatada ?? "")
            cell.detailTextLabel?.text = transacao?.valorFormatado
            if transacao?.tipoTransacao == TipoTransacao.Credito {
                cell.textLabel?.text =  "\(dataFormatada)(C)"
                cell.textLabel?.textColor = UIColor.green
                cell.detailTextLabel?.textColor = UIColor.green
             }else{
                cell.textLabel?.text =  "\(dataFormatada)(D)"
                cell.textLabel?.textColor = UIColor.red
                cell.detailTextLabel?.textColor = UIColor.red
             }
        }
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1)
        }
        
        return cell
    }
 


}
