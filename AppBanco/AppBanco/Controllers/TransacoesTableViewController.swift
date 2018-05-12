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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (Cliente.instance.contaCorrente?.total)!+1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
 

        if indexPath.row >= (Cliente.instance.contaCorrente?.total)! {
            let valor = Cliente.instance.contaCorrente?.saldo
            cell.textLabel?.text = "Saldo"
            cell.detailTextLabel?.text = "\(valor ?? 0)"
            cell.imageView?.image = nil
            cell.textLabel?.textColor = UIColor.green
            cell.detailTextLabel?.textColor = UIColor.green
        }else{
            let transacao =  Cliente.instance.contaCorrente?.transacoes![indexPath.row]
            let valor = transacao?.valor
            if transacao?.tipoTransacao == TipoTransacao.Credito {
                cell.textLabel?.text = "Crédito"
                cell.detailTextLabel?.text = "\(valor ?? 0)"
                cell.textLabel?.textColor = UIColor.blue
                cell.detailTextLabel?.textColor = UIColor.blue
             }else{
                cell.textLabel?.text = "Débito"
                cell.detailTextLabel?.text = "\(valor ?? 0)"
                cell.textLabel?.textColor = UIColor.red
                cell.detailTextLabel?.textColor = UIColor.red
             }
        }
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
