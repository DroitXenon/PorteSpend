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

//-----------------------------------------------------------------------------------------------------------------------------------------------
class BaseView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var names: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "List of Views"

		navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

		tableView.tableFooterView = UIView()

		names.append("Login1View")
		names.append("Login2View")
		names.append("Login3View")
		names.append("Login4View")
		names.append("SignUp1View")
		names.append("SignUp2View")
		names.append("PhoneView")
		names.append("SecureCodeView")
		names.append("Location1View")
		names.append("Location2View")
		names.append("NotificationView")
		names.append("PasscodeView")
		names.append("PlanView")
		names.append("Walkthrough1View")
		names.append("Walkthrough2View")
		names.append("Walkthrough3View")
		names.append("Walkthrough4View")
		names.append("Walkthrough5View")
		names.append("Home1View")
		names.append("Tours1View")
		names.append("TourView")
		names.append("MapView")
		names.append("CategoriesView")
		names.append("FiltersView")
		names.append("SearchView")
		names.append("Tours2View")
		names.append("Tours3View")
		names.append("PlacesView")
		names.append("PlaceView")
		names.append("Hotels1View")
		names.append("Hotels2View")
		names.append("Hotels3View")
		names.append("PhotoView")
		names.append("Settings1View")
		names.append("Settings2View")
		names.append("Hotel1View")
		names.append("Hotel2View")
		names.append("SelectRoomView")
		names.append("RoomView")
		names.append("ReviewsView")
		names.append("AddReviewView")
		names.append("GalleryView")
		names.append("SelectDatesView")
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return names.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
		if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

		cell.textLabel?.text = "\(indexPath.row+1). " + names[indexPath.row]

		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		switch names[indexPath.row] {

			case "Login1View":
				let login1View = Login1View()
				login1View.isModalInPresentation = true
				login1View.modalPresentationStyle = .fullScreen
				present(login1View, animated: true)

			case "Login2View":
				let login2View = Login2View()
				login2View.isModalInPresentation = true
				login2View.modalPresentationStyle = .fullScreen
				present(login2View, animated: true)

			case "Login3View":
				let login3View = Login3View()
				login3View.isModalInPresentation = true
				login3View.modalPresentationStyle = .fullScreen
				present(login3View, animated: true)

			case "Login4View":
				let login4View = Login4View()
				login4View.isModalInPresentation = true
				login4View.modalPresentationStyle = .fullScreen
				present(login4View, animated: true)

			case "SignUp1View":
				let signUp1View = SignUp1View()
				let navigation = NavigationController(rootViewController: signUp1View)
				navigation.isModalInPresentation = true
				navigation.navigationBar.isTranslucent = false
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "SignUp2View":
				let signUp2View = SignUp2View()
				let navigation = NavigationController(rootViewController: signUp2View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PhoneView":
				let phoneView = PhoneView()
				navigationController?.pushViewController(phoneView, animated: true)

			case "SecureCodeView":
				let secureCodeView = SecureCodeView()
				navigationController?.pushViewController(secureCodeView, animated: true)

			case "Location1View":
				let location1View = Location1View()
				navigationController?.pushViewController(location1View, animated: true)

			case "Location2View":
				let location2View = Location2View()
				navigationController?.pushViewController(location2View, animated: true)

			case "NotificationView":
				let notificationView = NotificationView()
				let navigation = NavigationController(rootViewController: notificationView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PasscodeView":
				let passcodeView = PasscodeView()
				let navigation = NavigationController(rootViewController: passcodeView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PlanView":
				let planView = PlanView()
				navigationController?.pushViewController(planView, animated: true)

			case "Walkthrough1View":
				let walkthrough1View = Walkthrough1View()
				let navigation = NavigationController(rootViewController: walkthrough1View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough2View":
				let walkthrough2View = Walkthrough2View()
				let navigation = NavigationController(rootViewController: walkthrough2View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough3View":
				let walkthrough3View = Walkthrough3View()
				let navigation = NavigationController(rootViewController: walkthrough3View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough4View":
				let walkthrough4View = Walkthrough4View()
				walkthrough4View.isModalInPresentation = true
				walkthrough4View.modalPresentationStyle = .fullScreen
				present(walkthrough4View, animated: true)

			case "Walkthrough5View":
				let walkthrough5View = Walkthrough5View()
				walkthrough5View.isModalInPresentation = true
				walkthrough5View.modalPresentationStyle = .fullScreen
				present(walkthrough5View, animated: true)

			case "Home1View":
				let home1View = Home1View()
				navigationController?.pushViewController(home1View, animated: true)

			case "Tours1View":
				let tours1View = Tours1View()
				navigationController?.pushViewController(tours1View, animated: true)

			case "TourView":
				let tourView = TourView()
				navigationController?.pushViewController(tourView, animated: true)

			case "MapView":
				let mapView = MapView()
				navigationController?.pushViewController(mapView, animated: true)

			case "CategoriesView":
				let categoriesView = CategoriesView()
				navigationController?.pushViewController(categoriesView, animated: true)

			case "FiltersView":
				let filtersView = FiltersView()
				let navigation = NavigationController(rootViewController: filtersView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "SearchView":
				let searchView = SearchView()
				navigationController?.pushViewController(searchView, animated: true)

			case "Tours2View":
				let tours2View = Tours2View()
				navigationController?.pushViewController(tours2View, animated: true)

			case "Tours3View":
				let tours3View = Tours3View()
				navigationController?.pushViewController(tours3View, animated: true)

			case "PlacesView":
				let placesView = PlacesView()
				navigationController?.pushViewController(placesView, animated: true)

			case "PlaceView":
				let placeView = PlaceView()
				navigationController?.pushViewController(placeView, animated: true)

			case "Hotels1View":
				let hotels1View = Hotels1View()
				navigationController?.pushViewController(hotels1View, animated: true)

			case "Hotels2View":
				let hotels2View = Hotels2View()
				navigationController?.pushViewController(hotels2View, animated: true)

			case "Hotels3View":
				let hotels3View = Hotels3View()
				navigationController?.pushViewController(hotels3View, animated: true)

			case "PhotoView":
				let photoView = PhotoView()
				let navigation = NavigationController(rootViewController: photoView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Settings1View":
				let settings1View = Settings1View()
				navigationController?.pushViewController(settings1View, animated: true)

			case "Settings2View":
				let settings2View = Settings2View()
				navigationController?.pushViewController(settings2View, animated: true)

			case "Hotel1View":
				let hotel1View = Hotel1View()
				navigationController?.pushViewController(hotel1View, animated: true)

			case "Hotel2View":
				let hotel2View = Hotel2View()
				navigationController?.pushViewController(hotel2View, animated: true)

			case "SelectRoomView":
				let selectRoomView = SelectRoomView()
				navigationController?.pushViewController(selectRoomView, animated: true)

			case "RoomView":
				let roomView = RoomView()
				navigationController?.pushViewController(roomView, animated: true)

			case "ReviewsView":
				let reviewsView = ReviewsView()
				navigationController?.pushViewController(reviewsView, animated: true)

			case "AddReviewView":
				let addReviewView = AddReviewView()
				let navigation = NavigationController(rootViewController: addReviewView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "GalleryView":
				let galleryView = GalleryView()
				navigationController?.pushViewController(galleryView, animated: true)

			case "SelectDatesView":
				let selectDatesView = SelectDatesView()
				let navigation = NavigationController(rootViewController: selectDatesView)
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			default:
				break
		}
	}
}
