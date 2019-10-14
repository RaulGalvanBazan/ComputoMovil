//
//  DetailViewController.swift
//  collections
//
//  Created by user160539 on 10/13/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var horariosCollectionView: UICollectionView!
    

    @IBOutlet weak var nombrePelicula: UILabel!
    @IBOutlet weak var posterPelicula: UIImageView!
    @IBOutlet weak var nombreDirector: UILabel!
    @IBOutlet weak var listaReparto: UILabel!
    @IBOutlet weak var clasificacionPelicula: UILabel!
    @IBOutlet weak var duracionPelicula: UILabel!
    @IBOutlet weak var sinopsisPelicula: UILabel!
    
    var vistaUno: ViewController!
    var nombre: String!
    var imagen: UIImage!
    var director: String!
    var reparto: String!
    var clasificacion: String!
    var duracion: String!
    var sinopsis: String!
    var horarios: [Funcion]!
    var seleccionPelicula: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombrePelicula.text = nombre
        posterPelicula.image = imagen
        nombreDirector.text = director
        listaReparto.text = reparto
        clasificacionPelicula.text = clasificacion
        duracionPelicula.text = duracion+" min."
        sinopsisPelicula.text = sinopsis
        
        sinopsisPelicula.sizeToFit()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return horarios.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorariosCell", for: indexPath) as! HorariosCollectionViewCell
        
        cell.horarioPelicula.text = horarios[indexPath.item].hora_inicio

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ComprarBoletos") as! ComprarViewController
        controller.nombre = nombre
        controller.poster = imagen
        controller.disponibilidad = horarios[indexPath.item].cupo_disp
        controller.salaId = horarios[indexPath.item].sala.id
        controller.horario = "\(horarios[indexPath.item].hora_inicio)-\(horarios[indexPath.item].hora_fin)"
        controller.seleccionPelicula = seleccionPelicula
        controller.seleccionHorario = indexPath.item
        controller.vistaUno = vistaUno
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
