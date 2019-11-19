//
//  tablaBusquedaVC.swift
//  cm-direcciones
//
//  Created by user160539 on 11/15/19.
//  Copyright © 2019 UltraCode. All rights reserved.
//

import UIKit

class tablaBusquedaVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var barraBusqueda: UISearchBar!
    @IBOutlet weak var tablaBusqueda: UITableView!
    
    var direcciones: [Direccion]!
    var searchDir: [Direccion]!
    var searching = false
    var lugar: Direccion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchDir.count
        } else {
            return direcciones.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching{
            cell.textLabel!.text = searchDir[indexPath.row].title
        } else {
            cell.textLabel!.text = direcciones[indexPath.row].title
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        lugar = direcciones[indexPath.row]
        print("Se seleccionó \(lugar.title!)")
        performSegue(withIdentifier: "unwind", sender: "cell")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchDir = direcciones.filter({$0.title!.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tablaBusqueda.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tablaBusqueda.reloadData()
    }

}

