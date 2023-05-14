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
class ContactsView: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellMapView: UITableViewCell!
	@IBOutlet var cellAddress: UITableViewCell!
	@IBOutlet var cellPhone: UITableViewCell!
	@IBOutlet var cellSite: UITableViewCell!
	@IBOutlet var cellEmail: UITableViewCell!

	@IBOutlet var mapView: MKMapView!
	@IBOutlet var labelAddress: UILabel!
	@IBOutlet var labelPhone: UILabel!
	@IBOutlet var labelSite: UILabel!
	@IBOutlet var labelEmail: UILabel!

	@IBOutlet var buttonFacebook: UIButton!
	@IBOutlet var buttonTwitter: UIButton!

	let locationManager = CLLocationManager()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Contacts"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Feedback", style: .plain, target: self, action: #selector(actionFeedback(_:)))

		buttonFacebook.layer.borderWidth = 1
		buttonFacebook.layer.borderColor = AppColor.Border.cgColor

		buttonTwitter.layer.borderWidth = 1
		buttonTwitter.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)

		if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
			locationManager.delegate = self
			locationManager.startUpdatingLocation()
		} else {
			locationManager.requestWhenInUseAuthorization()
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelAddress.text = "New York, USA"
		labelPhone.text = "+1(513)616-5999"
		labelSite.text = "related.blog"
		labelEmail.text = "info@related.blog"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFeedback(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFacebook(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTwitter(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ContactsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return 5
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.row == 0) { return cellMapView	}
		if (indexPath.row == 1) { return cellAddress	}
		if (indexPath.row == 2) { return cellPhone		}
		if (indexPath.row == 3) { return cellSite		}
		if (indexPath.row == 4) { return cellEmail		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ContactsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.row == 0) { return 200	}
		if (indexPath.row == 1) { return 45		}
		if (indexPath.row == 2) { return 45		}
		if (indexPath.row == 3) { return 45		}
		if (indexPath.row == 4) { return 45		}

		return 0
	}
}

// MARK: - CLLocationManagerDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ContactsView: CLLocationManagerDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

		let location = locations.last! as CLLocation
		let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
		let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

		mapView.setRegion(region, animated: true)
	}
}
