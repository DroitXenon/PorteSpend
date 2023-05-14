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
class AccountDetailsView: UIViewController {

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var buttonProfile: UIButton!

	@IBOutlet var textFieldFirstName: UITextField!
	@IBOutlet var textFieldLastName: UITextField!

	@IBOutlet var textFieldEmailAddress: UITextField!
	@IBOutlet var textFieldPhoneNumber: UITextField!
	@IBOutlet var textFieldDateOfBirth: UITextField!
	@IBOutlet var textFieldGender: UITextField!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Account Details"

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(actionSave(_:)))

		buttonProfile.layer.borderWidth = 1
		buttonProfile.layer.borderColor = AppColor.Border.cgColor

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldFirstName.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: attribute)
		textFieldLastName.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: attribute)
		textFieldEmailAddress.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: attribute)
		textFieldPhoneNumber.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: attribute)
		textFieldDateOfBirth.attributedPlaceholder = NSAttributedString(string: "Date of Birth", attributes: attribute)
		textFieldGender.attributedPlaceholder = NSAttributedString(string: "Gender", attributes: attribute)
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSave(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDateOfBirth(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionGender(_ sender: UIButton) {

		print(#function)
	}
}
