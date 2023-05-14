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
class BookRestaurantView: UIViewController {

	@IBOutlet var imageRestaurant: UIImageView!

	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelLocation: UILabel!

	@IBOutlet var viewRate: UIView!
	@IBOutlet var labelRate: UILabel!

	@IBOutlet var textFieldName: UITextField!
	@IBOutlet var textFieldPhoneNumber: UITextField!
	@IBOutlet var textFieldDate: UITextField!
	@IBOutlet var textFieldTime: UITextField!
	@IBOutlet var textFieldGuestCount: UITextField!
	@IBOutlet var textFieldSpecialRequest: UITextField!

	@IBOutlet var stepperGuest: UIStepper!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Booking"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		viewRate.layer.borderWidth = 1
		viewRate.layer.borderColor = AppColor.Border.cgColor

		updateUI()
		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setBackground(color: .clear)
			navigationController?.navigationBar.standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
			navigationController?.navigationBar.compactAppearance?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
			navigationController?.navigationBar.scrollEdgeAppearance?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageRestaurant.sample("Food", "Pizza", 11)

		labelName.text = "The Colony Grill Room"
		labelLocation.text = "8 Balderton Street, London"
		labelRate.text = "4.9"

		textFieldName.text = "Betty Hansen"
		textFieldPhoneNumber.text = "+1(513)616-5999"
		textFieldDate.text = "April 12, 2020"
		textFieldTime.text = "07:30 PM"
		textFieldGuestCount.text = "2 guests"
		textFieldSpecialRequest.text = ""

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldName.attributedPlaceholder = NSAttributedString(string: "Name", attributes: attribute)
		textFieldPhoneNumber.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: attribute)
		textFieldDate.attributedPlaceholder = NSAttributedString(string: "Date", attributes: attribute)
		textFieldTime.attributedPlaceholder = NSAttributedString(string: "Time", attributes: attribute)
		textFieldGuestCount.attributedPlaceholder = NSAttributedString(string: "Guest", attributes: attribute)
		textFieldSpecialRequest.attributedPlaceholder = NSAttributedString(string: "Special Request (optional)", attributes: attribute)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)

		if let navBar = navigationController as? NavigationController {
			navBar.setNavigationBar()
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		let background = UIColor.systemBackground.image(stepperGuest.frame.size)
		let selected = AppColor.Theme.image()

		stepperGuest.layer.borderWidth = 1
		stepperGuest.layer.borderColor = AppColor.Theme.cgColor
		stepperGuest.layer.cornerRadius = 5
		stepperGuest.setIncrementImage(UIImage(systemName: "plus"), for: .normal)
		stepperGuest.setDecrementImage(UIImage(systemName: "minus"), for: .normal)
		stepperGuest.setDividerImage(selected, forLeftSegmentState: .normal, rightSegmentState: .normal)
		stepperGuest.setBackgroundImage(background, for: .normal)
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionEditDate(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionEditTime(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionStepperChange(_ sender: UIStepper) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionConfirmBooking(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BookRestaurantView: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.tag == 11 {
			if let navController = navigationController as? NavigationController {
				if (scrollView.contentOffset.y > 90) {
					navController.setBackground(color: .systemBackground)
				} else {
					navController.setBackground(color: .clear)
				}
				navigationController?.navigationBar.standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
				navigationController?.navigationBar.compactAppearance?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
				navigationController?.navigationBar.scrollEdgeAppearance?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
			}
		}
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
