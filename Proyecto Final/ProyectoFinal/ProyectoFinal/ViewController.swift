//
//  ViewController.swift
//  ProyectoFinal
//
//  Created by user160539 on 11/29/19.
//  Copyright © 2019 GalvanBazanRaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var viajes: UICollectionView!
    
    var lugar01: Visitados!
    var lugar02: Visitados!
    var lugar03: Visitados!
    var lugar04: Visitados!
    var lugar05: Visitados!
    var zipolite: Lugar!
    var lista: [Lugar]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viajes.dataSource = self
        viajes.delegate = self
        lugar01 = Visitados(nombre: "Zipo 01", coordenadas: [-96.51174, 15.6621], fotos: [UIImage(named: "zipolite02")!])
        lugar02 = Visitados(nombre: "Zipo 02", coordenadas: [-96.51174, 15.6621], fotos: [UIImage(named: "zipolite03")!])
        lugar03 = Visitados(nombre: "Zipo 03", coordenadas: [-96.51174, 15.6621], fotos: [UIImage(named: "zipolite04")!])
        lugar04 = Visitados(nombre: "Zipo 04", coordenadas: [-96.51174, 15.6621], fotos: [UIImage(named: "zipolite05")!])
        lugar05 = Visitados(nombre: "Zipo 05", coordenadas: [-96.51174, 15.6621], fotos: [UIImage(named: "zipolite06")!])

        zipolite = Lugar(nombre: "zipolite", lugares_visitados: [lugar01, lugar02, lugar03, lugar04, lugar05], fotos: [UIImage(named: "zipolite01")!])
        lista = [zipolite]
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool){
        viajes.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lista.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.locView.image = lista[indexPath.item].fotos[0]
        cell.locName.text = lista[indexPath.item].nombre.uppercased()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newcontroller = storyboard.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        newcontroller.lugares_visitados = lista[indexPath.item].lugares_visitados
        newcontroller.img = lista[indexPath.item].fotos[0]
        self.navigationController?.pushViewController(newcontroller, animated: true)
    }
    
    @IBAction func addViaje(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "addViajeViewController") as! AddViajeViewController
        controller.vistaAnterior = self
        self.navigationController?.pushViewController(controller, animated: true)

    }
    
    


}

