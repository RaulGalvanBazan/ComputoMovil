//
//  direccion.swift
//  ProyectoFinal
//
//  Created by user160539 on 12/4/19.
//  Copyright © 2019 GalvanBazanRaul. All rights reserved.
//

import Foundation
import MapKit

class Direccion: NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D){
        
        self.title = title
        self.coordinate = coordinate
    }
}
