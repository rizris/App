//
//  JobDetailView+Ex.swift
//  FreelancApp
//
//  Created by Rizvi on 9/7/21.
//

import UIKit
import SnapKit
import MapKit

extension JobDetailView {

    func setupUIControls () {
        self.removeObjects()
        view.addSubview(mapView)
        view.addSubview(jobDistance)
        view.addSubview(jobTitle)
        view.addSubview(jobTime)
        view.addSubview(jobHourlyRate)
        view.addSubview(jobDescription)
        self.setupUIConstraints()
    }
    
    /*================================================================
    Description : Use this method to setup constraints
    =================================================================*/
    private func setupUIConstraints () {
        self.mapView.snp.makeConstraints{ (make) -> Void in
            make.top.left.right.equalTo(view).offset(0)
            make.height.equalTo(250)
        }
        self.jobDistance.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mapView.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(30)
        }
        self.jobTitle.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(jobDistance.snp.bottom).offset(1)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(jobDistance)
        }
        self.jobTime.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(jobTitle.snp.bottom).offset(1)
            make.left.equalTo(view.snp.left).offset(20)
            make.width.equalTo(jobHourlyRate)
            make.height.equalTo(jobDistance)
        }
        self.jobHourlyRate.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(jobTitle.snp.bottom).offset(1)
            make.left.equalTo(jobTime.snp.right).offset(10)
            make.right.equalTo(view.snp.right).offset(-20)
            make.width.equalTo(jobHourlyRate)
            make.height.equalTo(jobDistance)
        }
        self.jobDescription.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(jobTime.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.bottom.lessThanOrEqualTo(view.snp.bottom).offset(-40)
        }
    }
    
    /*================================================================
    Description : Use this method to remove constraints
    =================================================================*/
    private func removeObjects(){
        mapView.removeFromSuperview()
    }
    
}

extension JobDetailView {
    /*================================================================
    Description : Use this method to update UIs
    =================================================================*/
    func updateUIChanges() {
        view.backgroundColor = UIColor(named: Constant.Colors.background)
        jobDescription.numberOfLines(0)
        jobHourlyRate.makeRightAllignment()
    }
    
    /*================================================================
    Description : Use this method to move camara position on the map
    =================================================================*/
    func setupCameraPosition(_ location: CLLocation) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 50000, longitudinalMeters: 60000)
        mapView.setCameraBoundary( MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    /*================================================================
    Description : Use this method to show to job locations
    =================================================================*/
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(
        center: location.coordinate,
        latitudinalMeters: regionRadius,
        longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
     }
    
    /*================================================================
    Description : Use this method to setup annotation
    =================================================================*/
    func setupAnnotation() {
        let london = MKPointAnnotation()
        london.title = jobDetailVM.jobViewModel?.jobTitle
        london.coordinate = CLLocationCoordinate2D(latitude: jobDetailVM.jobViewModel?.lat ?? 00, longitude: jobDetailVM.jobViewModel?.lon ?? 00)
        mapView.addAnnotation(london)
    }
    
}
