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
import SkyFloatingLabelTextField
import IQKeyboardManagerSwift

//-----------------------------------------------------------------------------------------------------------------------------------------------
class EditProfileView: UIViewController {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var imageViewCover: UIImageView!
	@IBOutlet var textFieldName: SkyFloatingLabelTextField!
	@IBOutlet var textFieldDescription: SkyFloatingLabelTextField!
	@IBOutlet var textFieldEmail: SkyFloatingLabelTextField!
	@IBOutlet var imageViewEmailCheck: UIImageView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Edit Profile"

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(actionSave))

		imageViewCover.sample("Media", "Bands", 3)
		textFieldName.text = "John Smith"
		textFieldDescription.text = "Type something"
		textFieldEmail.text = "info@related.blog"

		IQKeyboardManager.shared.enableAutoToolbar = true
		IQKeyboardManager.shared.toolbarTintColor = AppColor.Theme
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		IQKeyboardManager.shared.enableAutoToolbar = false
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSave() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfileImagePick(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCoverImagePick(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDeleteAccount(_ sender: Any) {

		print(#function)
	}
}

// MARK: - UITextFieldDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension EditProfileView: UITextFieldDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

		if textField == textFieldEmail {
			let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
			let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
			if emailPred.evaluate(with: textFieldEmail.text) {
				imageViewEmailCheck.isHidden = false
			}
			else {
				imageViewEmailCheck.isHidden = true
			}
		}
		return true
	}
}
