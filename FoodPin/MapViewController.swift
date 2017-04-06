//
//  MapViewController.swift
//  FoodPin
//
//  Created by Johnny Mandela on 3/22/17.
//  Copyright © 2017 Johnny Mandela. All rights reserved.
//

import UIKit
import MapKit

// Added a protocol MKMapViewDelegate to provide our own implementation of the annotation
class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    // create variable for the selected restaurant
    var restaurant: Restaurant!
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        // we use .isKind and nil so the map will display the location with a blue dot
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        // Reuse the annotation if possible and downcast it MKPinAnnotationView
        var annotationView:MKPinAnnotationView? =
        mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        // if there are no unused views avaible we create a new one by instantiating a MKPinAnnotationView object with canShowCallout
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        // Add restuarant image to the left side of the callout bubble
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named: restaurant.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        // annotation Pin Color
        annotationView?.pinTintColor = UIColor.orange
        
        return annotationView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        
        // define the delegate of the mapView
        mapView.delegate = self

        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in
            if let error = error {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // Display the annotation so user doesnt have to click the pin to display the callout bubble
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
