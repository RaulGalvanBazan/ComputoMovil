//
//  SuperDetailedViewController.swift
//  ProyectoFinal
//
//  Created by user160539 on 12/5/19.
//  Copyright © 2019 GalvanBazanRaul. All rights reserved.
//

import UIKit
import MapKit

class SuperDetailedViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var lugar: UILabel!
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var mapa: MKMapView!
    
    var coord: [Double]!
    var nombre: String!
    var coordenadas: CLLocationCoordinate2D!
    var direccion: Direccion!
    var img: UIImage!
 

    override func viewDidLoad() {
        super.viewDidLoad()
        mapa.delegate = self
        coordenadas = CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0])
        lugar.text = nombre
        foto.image = img
        direccion = Direccion(title: nombre, coordinate: coordenadas)
        mapa.addAnnotation(direccion)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: coordenadas, span: span)
        self.mapa.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
