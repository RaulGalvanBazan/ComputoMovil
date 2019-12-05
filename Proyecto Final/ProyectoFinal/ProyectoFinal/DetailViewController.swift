//
//  DetailViewController.swift
//  ProyectoFinal
//
//  Created by user160539 on 11/29/19.
//  Copyright © 2019 GalvanBazanRaul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var imagenCabeza: UIImageView!
    @IBOutlet weak var fotitos: UICollectionView!
    
    var lugares: Lugar!
    var lugares_visitados: [Visitados]!
    var img: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagenCabeza.image = img
        fotitos.dataSource = self
        fotitos.delegate = self
        let layout = self.fotitos.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 4, left: 0, bottom: 2, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (self.fotitos.frame.size.width/2-5), height: self.fotitos.frame.size.height/2-40)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lugares_visitados.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! DetailCollectionViewCell
        cell.visFoto.image = lugares_visitados[indexPath.item].fotos[0]
        cell.visNombre.text = lugares_visitados[indexPath.item].nombre!
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newcontroller = storyboard.instantiateViewController(withIdentifier: "superDetail") as! SuperDetailedViewController
        newcontroller.coord = lugares_visitados[indexPath.item].coordenadas
        newcontroller.nombre = lugares_visitados[indexPath.item].nombre
        newcontroller.img = lugares_visitados[indexPath.item].fotos[0]
        self.navigationController?.pushViewController(newcontroller, animated: true)
    }

}
