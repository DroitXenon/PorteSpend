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
class Hotel2View: UIViewController {

	@IBOutlet var imageViewStar1: UIImageView!
	@IBOutlet var imageViewStar2: UIImageView!
	@IBOutlet var imageViewStar3: UIImageView!
	@IBOutlet var imageViewStar4: UIImageView!
	@IBOutlet var imageViewStar5: UIImageView!
	@IBOutlet var labelHotelName: UILabel!
	@IBOutlet var labelAmount: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelFacility1: UILabel!
	@IBOutlet var labelFacility2: UILabel!
	@IBOutlet var labelFacility3: UILabel!
	@IBOutlet var labelFacility4: UILabel!
	@IBOutlet var labelRatings: UILabel!
	@IBOutlet var labelReviews: UILabel!
	@IBOutlet var labelTotalPhotos: UILabel!
	@IBOutlet var labelLocation: UILabel!
	@IBOutlet var mapView: MKMapView!

	private var navigationBackgroundImage: UIImage?

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore))

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidAppear(_ animated: Bool) {

		loadMapViewData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelHotelName.text = "Four Seasons Resort Chiang Mai"
		labelAmount.text = "$75 p/night"
		labelDescription.text = "Occupying floors 51-59, this spacious suite enjoys beautiful views of Bangkok City and Chao Phraya River. It includes an LCD TV."
		labelFacility1.text = "Parking"
		labelFacility2.text = "Free WiFi"
		labelFacility3.text = "Spa"
		labelFacility4.text = "Airport Transfer"
		labelRatings.text = "7.5"
		labelReviews.text = "78 reviews"
		labelTotalPhotos.text = "12"
		labelLocation.text = "344 Bechtelar Terrace Suite 510"
	}

	// MARK: - Annotation methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadMapViewData() {

		let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: -13.303539, longitude: -72.123377)

		let annotation = MyPointAnnotation()
		annotation.title = "Urubamba, Peru"
		annotation.coordinate = coordinates
		annotation.pinTintColor = AppColor.Theme
		mapView.addAnnotation(annotation)

		mapView.showAnnotations(mapView.annotations, animated: true)
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionWishlist(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionNavigation(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCall(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReviews(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAbout(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeePhotos(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSelectRoom(_ sender: Any) {

		print(#function)
	}
}

// MARK: - MKMapViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Hotel2View: MKMapViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

		var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "myAnnotation") as? MKPinAnnotationView

		if annotationView == nil {
			annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
		} else {
			annotationView?.annotation = annotation
		}

		annotationView?.canShowCallout = true

		if let annotation = annotation as? MyPointAnnotation {
			annotationView?.pinTintColor = annotation.pinTintColor
		}

		return annotationView
	}
}
