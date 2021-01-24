//
//  ViewController.swift
//  Test1
//
//  Created by user185555 on 1/23/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRegion()
        setMark()
        
        
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
        
    }
    func setMark() {
        let cor = CLLocationCoordinate2D(latitude: 31.6200, longitude: 74.8765)
        let m = MKPointAnnotation()
        m.coordinate = cor
        m.title = "GOLDEN Temple"
        mapView.addAnnotation(m)
    }
    func setRegion(){
        // 1. Span == Zoom
        let span = MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
        
        //2. Region
        let cor = CLLocationCoordinate2D(latitude: 31.6200, longitude: 74.8765)
        let reg = MKCoordinateRegion(center: cor, span: span)
        
        //3. add
        mapView.setRegion(reg, animated: true)
    }
}
extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       // let x = locations.first
        //print(locations[0])
    }
}
