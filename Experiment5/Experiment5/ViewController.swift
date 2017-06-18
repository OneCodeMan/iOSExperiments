
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let span: MKCoordinateSpan = MKCoordinateSpanMake(0.65, 0.65)
    let mapPin = MKPointAnnotation()

    @IBOutlet weak var invalidTextLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    
    @IBAction func goButton(_ sender: UIButton) {
        view.endEditing(true)
        
        guard let longitude = CLLocationDegrees(longitudeTextField.text!), let latitude = CLLocationDegrees(latitudeTextField.text!)
            else {
                invalidTextLabel.text = "Those aren't even decimal numbers"
                return
        }
        
        guard longitude >= -90.0 && longitude <= 90.0 && latitude >= -180.0 && latitude <= 180.0 else {
            invalidTextLabel.text = "Invalid longitude and latitude value"
            return
        }
        
        invalidTextLabel.text = ""
        let updatedLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let updatedRegion = MKCoordinateRegionMake(updatedLocation, span)
        
        mapPin.coordinate = updatedLocation
        mapView.addAnnotation(mapPin)
        mapView.setRegion(updatedRegion, animated: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invalidTextLabel.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        let keyboardDownGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(keyboardDownGestureRecognizer)
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let initialLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(initialLocation, span)
        mapView.setRegion(region, animated: true)
        
        self.mapView.showsUserLocation = true
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }


}

