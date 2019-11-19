//
//  ViewController.swift
//  cm-direcciones
//
//  Created by 2020-1 on 10/9/19.
//  Copyright © 2019 UltraCode. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tablaSel: UITableView!
    @IBOutlet weak var mapa: MKMapView!
    //var localidades: [Localidad]!
    var direcciones: [Direccion] = []
    var lugarInicio: Direccion?
    var lugarDestino: Direccion?
    var seleccion: Int!
    var coordInicial  = CLLocationCoordinate2D(latitude: 19.3189, longitude: -99.1844)
    var ruta = MKPolyline()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        mapa.delegate = self
        //Agregando placemark
        for loc in direcciones{
            mapa.addAnnotation(loc)
        }
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: coordInicial, span: span)
        self.mapa.setRegion(region, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaLoc", for: indexPath)
        if indexPath.row == 0{
            cell.textLabel!.text = "Inicio:  " + "\(lugarInicio?.title ?? "")"
        } else {
            cell.textLabel!.text = "Destino:  " + "\(lugarDestino?.title ?? "")"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        seleccion = indexPath.row
        print("Se seleccionó \(seleccion!)")
    }
    
    func getData(){
        if let url = Bundle.main.url(forResource: "localidades", withExtension: "json"){
            do{
                var coordTmp: CLLocationCoordinate2D!
                var direccionTmp: Direccion!
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Resultado.self, from: data)
                for res in jsonData.results{
                    coordTmp = CLLocationCoordinate2D(latitude: res.lat, longitude:  res.long)
                    direccionTmp = Direccion(title: res.title, subtitle: res.subtitle, coordinate: coordTmp, foto: res.foto)
                    self.direcciones.append(direccionTmp)
                }
            } catch{
                print("error: \(error)")
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let linea = MKPolylineRenderer(overlay: overlay)
        linea.strokeColor = .blue
        linea.lineWidth = 0.6
        return linea
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = true
        } else {
            annotationView = MKMarkerAnnotationView()
        }
        let direccionAnnotation = annotation as! Direccion
        annotationView?.detailCalloutAccessoryView = UIImageView(image: direccionAnnotation.foto)
        let resizeSize = CGSize(width: 30, height: 30)
        let image = direccionAnnotation.foto
        UIGraphicsBeginImageContext(resizeSize)
        image?.draw(in: CGRect(origin: .zero, size: resizeSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        annotationView?.image = resizedImage
        return annotationView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let nextView = segue.destination as! tablaBusquedaVC
        nextView.direcciones = self.direcciones
    }
    
    @IBAction func unwindSelected(_ unwindSegue: UIStoryboardSegue) {
        //dismiss(animated: true, completion: nil)
        let seleccionDireccion = unwindSegue.source as! tablaBusquedaVC
        if seleccion == 0 {
            lugarInicio = seleccionDireccion.lugar
        } else {
            lugarDestino = seleccionDireccion.lugar
        }
        tablaSel.reloadData()
        
        guard let inicio = lugarInicio?.coordinate, let destino = lugarDestino?.coordinate  else{return}
        let inicioPlaceMark = MKPlacemark(coordinate: inicio)
        let destinoPlaceMark = MKPlacemark(coordinate: destino)
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: inicioPlaceMark)
        directionRequest.destination = MKMapItem(placemark: destinoPlaceMark)
        directionRequest.transportType = .walking
        let directions = MKDirections(request: directionRequest)
        directions.calculate{ (response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let directionResponse = response else{
                return
            }
            self.mapa.removeOverlay(self.ruta)
            let route = directionResponse.routes.first
            self.ruta = route!.polyline
            self.mapa.addOverlay(self.ruta)
            let rect = self.ruta.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }

}

