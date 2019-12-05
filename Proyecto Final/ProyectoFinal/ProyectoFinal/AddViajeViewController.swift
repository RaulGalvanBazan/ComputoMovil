//
//  AddViajeViewController.swift
//  ProyectoFinal
//
//  Created by user160539 on 12/1/19.
//  Copyright © 2019 GalvanBazanRaul. All rights reserved.
//

import UIKit

class AddViajeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet weak var nombreLugar: UITextField!
    
    var vistaAnterior: ViewController!
    var nuevoLugar: Lugar!
    var nombre: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreLugar.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            img.image = image
            
        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func selectImg(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func agregarLugar(_ sender: Any) {
        nuevoLugar = Lugar(nombre: nombreLugar.text!, lugares_visitados: [], fotos: [img.image!])
        vistaAnterior.lista.append(nuevoLugar)
        navigationController?.popToViewController(vistaAnterior, animated: true)
    }
    
    @IBAction func yaloquesea(_ sender: Any) {
        navigationController?.popToViewController(vistaAnterior, animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}


