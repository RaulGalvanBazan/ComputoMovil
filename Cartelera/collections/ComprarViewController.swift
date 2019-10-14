//
//  ComprarViewController.swift
//  collections
//
//  Created by user160539 on 10/13/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ComprarViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIPageViewControllerDelegate{

    
    @IBOutlet weak var tituloFuncion: UILabel!
    @IBOutlet weak var posterFuncion: UIImageView!
    @IBOutlet weak var salaFuncion: UILabel!
    @IBOutlet weak var horarioFuncion: UILabel!
    @IBOutlet weak var disponibilidadBoletos: UILabel!
    @IBOutlet weak var seleccionBoletos: UIPickerView!
    @IBOutlet weak var costoTotal: UILabel!
    
    var vistaUno: ViewController!
    var nombre: String!
    var poster: UIImage!
    var horario: String!
    var disponibilidad: Int!
    var datos: [Int]!
    var salaId: String!
    var seleccionPelicula: Int!
    var seleccionHorario: Int!
    var boletos: Int!
    var costo: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seleccionBoletos.dataSource = self
        seleccionBoletos.delegate = self
        salaFuncion.text = salaId
        tituloFuncion.text = nombre
        posterFuncion.image = poster
        horarioFuncion.text = horario
        disponibilidadBoletos.text = String(disponibilidad)
        if disponibilidad == 0{
            datos = [0]
        }
        else{
            datos = Array(1...disponibilidad)
        }
        costoTotal.text = "$70.00 x 1 = $70.00"
        costo = 70
        boletos = 1
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(datos[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        costoTotal.text = "$70.00 x \(datos[row]) = $\(datos[row]*70).00"
        costo = 70*datos[row]

        boletos = datos[row]
    }
    @IBAction func cerrar(_sender: UIButton){
        vistaUno.peliculas[seleccionPelicula].funciones[seleccionHorario].cupo_disp = disponibilidad - boletos
        vistaUno.total += costo
        navigationController?.popToViewController(vistaUno, animated: true)
    }
}

