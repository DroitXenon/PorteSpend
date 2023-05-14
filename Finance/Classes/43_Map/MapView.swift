//
// Copyright (c) 2021 Related Code - https://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import MapKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class MapView: UIViewController {

	@IBOutlet var segmentedControl: UISegmentedControl!
	@IBOutlet var mapView: MKMapView!

	private var stores: [[String: String]] = []
	let locationManager = CLLocationManager()
	let identifier = NSStringFromClass(MKMarkerAnnotationView.self)

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.titleView = segmentedControl
		navigationItem.titleView?.frame = CGRect(x: 0, y: 0, width: 200, height: 30)

		mapView.delegate = self
		mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: identifier)

		loadData()
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)

		if let navController = navigationController as? NavigationController {
			navController.setBackground(color: .clear)
		}

		if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
			locationManager.delegate = self
			locationManager.startUpdatingLocation()
		} else {
			locationManager.requestWhenInUseAuthorization()
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setNavigationBar()
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		stores.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "M&M'S World"
		dict1["distance"] = "15.3 km"
		dict1["address"] = "1600 Broadway, New York"
		dict1["status"] = "Open Now"
		dict1["time"] = "9:00 AM - 6:00 PM"
		stores.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "American Girl Place"
		dict2["distance"] = "12.4 km"
		dict2["address"] = "75 Rockefeller Plaza, New York"
		dict2["status"] = "Closed"
		dict2["time"] = "9:00 AM - 6:00 PM"
		stores.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "NBA Store NYC 5th Ave"
		dict3["distance"] = "9 km"
		dict3["address"] = "545 5th Ave, New York"
		dict3["status"] = "Closed"
		dict3["time"] = "9:00 AM - 6:00 PM"
		stores.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "New York & Company"
		dict4["distance"] = "6 km"
		dict4["address"] = "MANHATTAN MALL, 100 W 33rd St"
		dict4["status"] = "Open Now"
		dict4["time"] = "9:00 AM - 6:00 PM"
		stores.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Macy's"
		dict5["distance"] = "27 km"
		dict5["address"] = "151 W 34th St, New York"
		dict5["status"] = "Closed"
		dict5["time"] = "9:00 AM - 6:00 PM"
		stores.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Paragon Sports"
		dict6["distance"] = "10.3 km"
		dict6["address"] = "867 Broadway, New York"
		dict6["status"] = "Open Now"
		dict6["time"] = "9:00 AM - 6:00 PM"
		stores.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "The New York Public Library Shop"
		dict7["distance"] = "4.6 km"
		dict7["address"] = "Fifth Avenue and, W 42nd St, New York"
		dict7["status"] = "Open Now"
		dict7["time"] = "9:00 AM - 6:00 PM"
		stores.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Nintendo NY"
		dict8["distance"] = "7.8 km"
		dict8["address"] = "10 Rockefeller Plaza, New York"
		dict8["status"] = "Closed"
		dict8["time"] = "9:00 AM - 6:00 PM"
		stores.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Apple Fifth Avenue"
		dict9["distance"] = "1 km"
		dict9["address"] = "767 5th Ave, New York"
		dict9["status"] = "Closed"
		dict9["time"] = "9:00 AM - 6:00 PM"
		stores.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "Saks Fifth Avenue"
		dict10["distance"] = "2.9 km"
		dict10["address"] = "611 5th Ave, New York"
		dict10["status"] = "Open Now"
		dict10["time"] = "9:00 AM - 6:00 PM"
		stores.append(dict10)

		addAnnotation(latitude: 37.332093, longitude:-122.027263)
		addAnnotation(latitude: 37.331948, longitude:-122.028368)
		addAnnotation(latitude: 37.330840, longitude:-122.030061)
		addAnnotation(latitude: 37.329811, longitude:-122.029614)
		addAnnotation(latitude: 37.330393, longitude:-122.028212)

		let mapCenter = CLLocationCoordinate2D(latitude: 37.33034447, longitude:-122.02830316)
		let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
		let region = MKCoordinateRegion(center: mapCenter, span: span)
		mapView.setRegion(region, animated: true)
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		let background = UIColor.systemBackground.image(segmentedControl.frame.size)
		let selected = AppColor.Theme.image(segmentedControl.frame.size)

		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
		segmentedControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
		segmentedControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
		segmentedControl.layer.borderWidth = 1
		segmentedControl.layer.borderColor = AppColor.Theme.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func addAnnotation(latitude: CLLocationDegrees, longitude:CLLocationDegrees) {

		let annotation = MKPointAnnotation()
		annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		mapView.addAnnotation(annotation)
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSegmentChange(_ sender: UISegmentedControl) {

		print(#function)
	}
}

// MARK: - CLLocationManagerDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension MapView: CLLocationManagerDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

	}
}

// MARK: - MKMapViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension MapView: MKMapViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

		guard annotation is MKPointAnnotation else { return nil }

		let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
		if let markerAnnotationView = view as? MKMarkerAnnotationView {
			markerAnnotationView.canShowCallout = true
			let mapCalloutView = MapCalloutView()
			let randomNumber = arc4random_uniform(UInt32(9))
			mapCalloutView.bindData(data: stores[Int(randomNumber)])
			markerAnnotationView.detailCalloutAccessoryView = mapCalloutView
		}
		return view
	}
}

// MARK: - UIColor
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension UIColor {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

		return UIGraphicsImageRenderer(size: size).image { rendererContext in
			setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}
