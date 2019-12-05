//
//  Lugares.swift
//  ProyectoFinal
//
//  Created by user160539 on 11/29/19.
//  Copyright © 2019 GalvanBazanRaul. All rights reserved.
//

import UIKit

struct Lugar{
    var nombre: String!
    var lugares_visitados: [Visitados]!
    var fotos: [UIImage]!

}

struct Visitados{
    var nombre: String!
    var coordenadas: [Double]!
    var fotos: [UIImage]!
}


