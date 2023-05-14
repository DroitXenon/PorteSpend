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

	@IBOutlet var mapView: MKMapView!

	@IBOutlet var viewDetails: UIView!
	@IBOutlet var labelDistance1: UILabel!
	@IBOutlet var labelInfo: UILabel!

	@IBOutlet var viewTime: MapCircularProgressView!
	@IBOutlet var viewDistance: MapCircularProgressView!
	@IBOutlet var viewCalBurned: MapCircularProgressView!
	@IBOutlet var viewAvgSpeed: MapCircularProgressView!

	@IBOutlet var labelTime: UILabel!
	@IBOutlet var labelDistance: UILabel!
	@IBOutlet var labelCalBurned: UILabel!
	@IBOutlet var labelAvgSpeed: UILabel!

	@IBOutlet var buttonFinish: UIButton!

	let locationManager = CLLocationManager()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))

		buttonFinish.layer.borderWidth = 1
		buttonFinish.layer.borderColor = AppColor.Border.cgColor

		[viewTime, viewDistance, viewCalBurned, viewAvgSpeed].forEach { (view) in
			view!.barWidth = 4
		}
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

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelDistance1.text = "1.4 km"
		labelInfo.text = "616 Runolfsdottir Pass"

		viewTime.setProgress(0.25)
		viewDistance.setProgress(0.50)
		viewCalBurned.setProgress(0.75)
		viewAvgSpeed.setProgress(1.0)

		labelTime.text = "01:49"
		labelDistance.text = "480 m"
		labelCalBurned.text = "103 kcal"
		labelAvgSpeed.text = "8.5 km/h"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMoreDetails(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFinish(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionResume(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - CLLocationManagerDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension MapView: CLLocationManagerDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

		let location = locations.last! as CLLocation
		let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
		let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

		mapView.setRegion(region, animated: true)
	}
}
