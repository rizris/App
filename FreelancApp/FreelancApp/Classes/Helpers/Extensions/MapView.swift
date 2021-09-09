//
//  MapView.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import Foundation
import MapKit

extension MKMapView {
    
    /*================================================================
    Description : Use this method to load mapview 
    =================================================================*/
    static func mapView() -> MKMapView {
        let map = MKMapView()
        map.backgroundColor = .green
        return map
    }
}



