//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Sameehan Patel on 2/16/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {

override func viewDidLoad(){ //Always call the super implementation of viewDidLoad
}

    var mapView: MKMapView!
    override func loadView(){
        //create a map view
        mapView = MKMapView()
        //set it as the view of this view controller
        view = mapView
        
        let segmentedControl = UISegmentedControl (items: ["Standard", "Hybrid", "Satellite" ])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
         segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
        
        func mapTypeChanged (segControl: UISegmentedControl){
            
            switch segControl.selectedSegmentIndex{
            case 0:
                mapView.mapType = .Standard
            case 1:
                mapView.mapType = .Hybrid
            case 2:
                mapView.mapType = .Satellite
            default:
                break
            }
        
       
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
    
      
        }
        
        
    }

}

