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
class RestaurantInfoView: UIViewController {

	@IBOutlet var buttonBooking: UIButton!
	@IBOutlet var viewBooking: UIView!

	@IBOutlet var imageRestaurant: UIImageView!

	@IBOutlet var viewRate: UIView!
	@IBOutlet var labelRate: UILabel!

	@IBOutlet var viewKM: UIView!
	@IBOutlet var labelKM: UILabel!

	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelLocation: UILabel!

	@IBOutlet var viewService1: UIView!
	@IBOutlet var labelService1: UILabel!

	@IBOutlet var viewService2: UIView!
	@IBOutlet var labelService2: UILabel!

	@IBOutlet var viewService3: UIView!
	@IBOutlet var labelService3: UILabel!

	@IBOutlet var buttonFavorite: UIButton!

	@IBOutlet var labelDescription: UILabel!

	@IBOutlet var buttonCalendar: UIButton!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var labelDay: UILabel!
	@IBOutlet var buttonLocation: UIButton!
	@IBOutlet var buttonCall: UIButton!

	@IBOutlet var labelReviews: UILabel!
	@IBOutlet var labelGallery: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewBooking)

		viewRate.layer.borderWidth = 1
		viewRate.layer.borderColor = AppColor.Border.cgColor
		viewKM.layer.borderWidth = 1
		viewKM.layer.borderColor = AppColor.Border.cgColor
		viewService1.layer.borderWidth = 1
		viewService1.layer.borderColor = AppColor.Border.cgColor
		viewService2.layer.borderWidth = 1
		viewService2.layer.borderColor = AppColor.Border.cgColor
		viewService3.layer.borderWidth = 1
		viewService3.layer.borderColor = AppColor.Border.cgColor
		buttonFavorite.layer.borderWidth = 1
		buttonFavorite.layer.borderColor = AppColor.Border.cgColor
		buttonCalendar.layer.borderWidth = 1
		buttonCalendar.layer.borderColor = AppColor.Border.cgColor
		buttonLocation.layer.borderWidth = 1
		buttonLocation.layer.borderColor = AppColor.Border.cgColor
		buttonCall.layer.borderWidth = 1
		buttonCall.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setBackground(color: .clear)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)

		if let navBar = navigationController as? NavigationController {
			navBar.setNavigationBar()
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageRestaurant.sample("Food", "Pizza", 12)

		labelRate.text = "4.9"
		labelKM.text = "2.8 km"
		labelName.text = "The Colony Grill Room"
		labelLocation.text = "8 Balderton Street, London"

		labelService1.text = "WI-FI".uppercased()
		labelService2.text = "Parking".uppercased()
		labelService3.text = "Bar".uppercased()

		labelDescription.text = "They are grilling celebrities in their own right. You’ve seen them on TV and you see their cookbooks lined along the shelves."
		labelTime.text = "07:00 - 22:00"
		labelDay.text = "Monday to Sunday"

		labelReviews.text = "81"
		labelGallery.text = "12"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionBooking(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFavorite(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCalendar(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLocation(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCall(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReviews(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionGallery(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RestaurantInfoView: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.tag == 11 {
			if let navController = navigationController as? NavigationController {
				if (scrollView.contentOffset.y > imageRestaurant.frame.size.height/2) {
					navController.setBackground(color: .systemBackground)
				} else {
					navController.setBackground(color: .clear)
				}
			}
		}
	}
}
