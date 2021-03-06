//
//  ViewController.swift
//  arTest
//
//  Created by Mateusz Chojnacki on 07.03.2018.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

import UIKit
import ARKit

import SceneKit
import CoreLocation
class ViewController: UIViewController, ARSCNViewDelegate, CLLocationManagerDelegate,ARLocationDelegae {
    @IBOutlet weak var outletBTN: UIButton!
    
    func addChildNode(modelNode: SCNNode!) {
        self.arView.scene.rootNode.addChildNode(modelNode)
    }
    

    @IBOutlet weak var arView: ARSCNView!
    let locationManager = CLLocationManager()
    var userLocation = CLLocation()
    var arLocationManager = ARLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.outletBTN.isEnabled = false
        self.outletBTN.backgroundColor = UIColor.gray
        self.arLocationManager.delegate = self
         self.arView.delegate = self
        let scene = SCNScene()
        
        // Set the scene to the view
        self.arView.scene = scene
        
        // Start location services
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        
        if userLocation.coordinate.latitude != 0{

 
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.worldAlignment = .gravityAndHeading
        
        // Run the view's session
        self.arView.session.run(configuration)
    }


    // Location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            self.locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLocation = location
            if(self.outletBTN.isEnabled == false){
                self.outletBTN.isEnabled = true
                self.outletBTN.backgroundColor = UIColor.green
            }
            outletBTN.titleLabel?.text = ("\(location.coordinate.latitude),\(location.coordinate.longitude)")
        
        }
    }
    

    
    
    
    @IBAction func addPinBTN(_ sender: Any) {
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759236, 19.458667))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759247, 19.458724))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759244, 19.458759))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759252, 19.458815))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759261, 19.458861))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759262, 19.458898))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759261, 19.458946))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759267, 19.458995))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759272, 19.459030))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759276, 19.459059))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759277, 19.459094))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759282, 19.459166))
        //
        self.arLocationManager.updatePin(userLocation: userLocation, pinLocaton: CLLocationCoordinate2DMake(51.759286, 19.459193))
        //
    }
    
    
    
    
}

