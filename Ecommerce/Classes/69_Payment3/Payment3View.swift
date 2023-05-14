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
class Payment3View: UIViewController {

	@IBOutlet var layoutConstraintBottom: NSLayoutConstraint!

	@IBOutlet var viewScanCreditCard: UIView!

	@IBOutlet var viewCard: UIView!
	@IBOutlet var imageCard: UIImageView!
	@IBOutlet var textFieldName: UITextField!
	@IBOutlet var textFieldNumber: UITextField!
	@IBOutlet var textFieldExpiry: UITextField!
	@IBOutlet var textFieldCVV: UITextField!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		viewScanCreditCard.layer.borderWidth = 1
		viewScanCreditCard.layer.borderColor = AppColor.Border.cgColor

		viewCard.layer.borderWidth = 1
		viewCard.layer.borderColor = AppColor.Border.cgColor

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldName.attributedPlaceholder = NSAttributedString(string: "Cardholder Name", attributes: attribute)
		textFieldNumber.attributedPlaceholder = NSAttributedString(string: "Credit Card Number", attributes: attribute)
		textFieldExpiry.attributedPlaceholder = NSAttributedString(string: "MM/YY", attributes: attribute)
		textFieldCVV.attributedPlaceholder = NSAttributedString(string: "CVV", attributes: attribute)

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillLayoutSubviews() {

		super.viewWillLayoutSubviews()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func keyboardWillShow(_ notification: Notification) {

		if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
			let keyboardRectangle = keyboardFrame.cgRectValue
			let keyboardHeight = keyboardRectangle.height
			print(keyboardHeight)
			UIView.animate(withDuration: 0.5) {
				self.layoutConstraintBottom.constant = (keyboardHeight * -1)
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func keyboardWillHide(_ notification: Notification) {

		UIView.animate(withDuration: 0.5) {
			self.layoutConstraintBottom.constant = 0
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCancel(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDone(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionScanCreditCard(_ sender: UIButton) {

		print(#function)
	}
}
