//
//  direccion.swift
//  cm-direcciones
//
//  Created by 2020-1 on 10/9/19.
//  Copyright © 2019 UltraCode. All rights reserved.
//

import Foundation
import MapKit

class Direccion: NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var foto: UIImage?
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, foto: String){
        
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.foto = UIImage(imageLiteralResourceName: foto)
    }
}
