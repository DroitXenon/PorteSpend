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
class MyPointAnnotation : MKPointAnnotation {

	var pinTintColor: UIColor?
}

//-----------------------------------------------------------------------------------------------------------------------------------------------
class MapView: UIViewController {

	@IBOutlet var mapView: MKMapView!

	private var navigationBackgroundImage: UIImage?
	private var routeLine: MKPolyline?

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Map"

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		loadMapViewData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Annotation methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadMapViewData() {

		var coordinates: [CLLocationCoordinate2D] = []
		coordinates.append(CLLocationCoordinate2D(latitude: 40.676506, longitude: -73.982528))
		coordinates.append(CLLocationCoordinate2D(latitude: 40.650146, longitude: -73.975574))
		coordinates.append(CLLocationCoordinate2D(latitude: 40.639522, longitude: -73.984698))
		coordinates.append(CLLocationCoordinate2D(latitude: 40.621970, longitude: -73.991778))
		coordinates.append(CLLocationCoordinate2D(latitude: 40.615999, longitude: -74.035356))

		for point in coordinates {
			let annotation1 = MyPointAnnotation()
			annotation1.title = "1 Day"
			annotation1.subtitle = "Playa del Carmen"
			annotation1.coordinate = point
			annotation1.pinTintColor = AppColor.Theme
			mapView.addAnnotation(annotation1)
		}

		let geodesic = MKGeodesicPolyline(coordinates: coordinates, count: 5)
		mapView.addOverlay(geodesic)

		mapView.showAnnotations(mapView.annotations, animated: true)
	}
}

// MARK: - MKMapViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension MapView: MKMapViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

		if let polyline = overlay as? MKPolyline {
			let polylineRenderer = MKPolylineRenderer(overlay: polyline)
			polylineRenderer.strokeColor = AppColor.Theme
			polylineRenderer.lineWidth = 2
			return polylineRenderer
		}
		return MKOverlayRenderer(overlay: overlay)
	}

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
