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
            let valor = Cliente.instance.contaCorrente?.saldo
            let valorFormatado = String(format: "R$ %.2f",valor ?? 0)
            cell.textLabel?.text = "Saldo"
            cell.detailTextLabel?.text = valorFormatado
            cell.imageView?.image = nil
            cell.textLabel?.textColor = UIColor.blue
            cell.detailTextLabel?.textColor = UIColor.blue
        }else{
            let transacao =  Cliente.instance.contaCorrente?.transacoes![indexPath.row]
            let valor = transacao?.valor
            let valorFormatado = String(format: "R$ %.2f",valor ?? 0)
            let dataFormatada = (transacao?.dataFormatada ?? "")
            if transacao?.tipoTransacao == TipoTransacao.Credito {
                cell.textLabel?.text =  "\(dataFormatada)(C)"
                cell.detailTextLabel?.text = valorFormatado
                cell.textLabel?.textColor = UIColor.green
                cell.detailTextLabel?.textColor = UIColor.green
             }else{
                cell.textLabel?.text =  "\(dataFormatada)(D)"
                cell.detailTextLabel?.text = valorFormatado
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
