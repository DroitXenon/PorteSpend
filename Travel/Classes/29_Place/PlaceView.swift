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
class PlaceView: UIViewController {

	@IBOutlet var imageViewHeader: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelLocation: UILabel!
	@IBOutlet var labelPhotos: UILabel!
	@IBOutlet var buttonLikeDislike: UIButton!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var mapView: MKMapView!
	@IBOutlet var buttonLearnMore: UIButton!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var labelSubDescription: UILabel!
	@IBOutlet var imageViewBottom: UIImageView!

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

		imageViewHeader.sample("Travel", "Mountains", 1)
		labelTitle.text = "Urubamba"
		labelLocation.text = "Peru"
		labelPhotos.text = "49 Photos"
		labelDescription.text = "Visit a small community who specialize in ceramic- and adobe-making. Meet local artists and enjoy a demonstration of these traditional arts."
		labelSubTitle.text = "Moray Ruins"
		labelSubDescription.text = "Muray (Quechua) is an archaeological site in Peru."
		imageViewBottom.sample("Travel", "Mountains", 2)
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
	@IBAction func actionLikeDislike(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLearnMore(_ sender: Any) {

		print(#function)
	}
}

// MARK: - MKMapViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension PlaceView: MKMapViewDelegate {

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
