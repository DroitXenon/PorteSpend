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
class PhonePaymentView: UIViewController {

	@IBOutlet var buttonPrepaid: UIButton!
	@IBOutlet var buttonPostpaid: UIButton!

	@IBOutlet var viewPrepaid: UIView!
	@IBOutlet var viewPostpaid: UIView!

	@IBOutlet var imageViewMobile: UIImageView!
	@IBOutlet var labelName: UILabel!

	@IBOutlet var textFieldPhoneNumber: UITextField!
	@IBOutlet var textFieldAmount: UITextField!
	@IBOutlet var switchMonthlyAutoPay: UISwitch!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Phone Payment"
		navigationController?.navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true

		loadData()
		buttonPrepaid.isSelected = true
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewMobile.sample("Finance", "Payments", 11)
		labelName.text = "Verizon"
		textFieldPhoneNumber.text = "+1 424-331-4281"
		textFieldAmount.text = "149.00"
		switchMonthlyAutoPay.setOn(false, animated: true)
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		buttonPrepaid.titleLabel?.textColor = buttonPrepaid.isSelected ? AppColor.Theme : UIColor.label
		buttonPostpaid.titleLabel?.textColor = buttonPostpaid.isSelected ? AppColor.Theme : UIColor.label

		viewPrepaid.backgroundColor = buttonPrepaid.isSelected ? AppColor.Theme : UIColor.tertiarySystemFill
		viewPostpaid.backgroundColor = buttonPostpaid.isSelected ? AppColor.Theme : UIColor.tertiarySystemFill
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPrepaid(_ sender: UIButton) {

		print(#function)
		buttonPrepaid.isSelected = true
		buttonPostpaid.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPostpaid(_ sender: UIButton) {

		print(#function)
		buttonPrepaid.isSelected = false
		buttonPostpaid.isSelected = true
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMobile(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSwitchMonthlyAutoPay(_ sender: UISwitch) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPayNow(_ sender: UIButton) {

		print(#function)
	}
}
