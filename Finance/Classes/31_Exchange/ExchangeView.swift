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
import IQKeyboardManagerSwift

//-----------------------------------------------------------------------------------------------------------------------------------------------
class ExchangeView: UIViewController {

	@IBOutlet var labelCoinName1: UILabel!
	@IBOutlet var viewCoinID1: UIView!
	@IBOutlet var labelCoinID1: UILabel!
	@IBOutlet var textFieldCoin1: UITextField!

	@IBOutlet var viewValueSwap: UIView!

	@IBOutlet var textFieldCoin2: UITextField!
	@IBOutlet var labelCoinName2: UILabel!
	@IBOutlet var viewCoinID2: UIView!
	@IBOutlet var labelCoinID2: UILabel!

	@IBOutlet var labelCoinInfo: UILabel!
	@IBOutlet var layoutConstraintBottom: NSLayoutConstraint!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Exchange"
		navigationController?.navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true

		viewCoinID1.layer.borderWidth = 1
		viewCoinID1.layer.borderColor = AppColor.Border.cgColor

		viewValueSwap.layer.borderWidth = 1
		viewValueSwap.layer.borderColor = AppColor.Border.cgColor

		viewCoinID2.layer.borderWidth = 1
		viewCoinID2.layer.borderColor = AppColor.Border.cgColor

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
		IQKeyboardManager.shared.enable = false

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
		NotificationCenter.default.removeObserver(self)
		IQKeyboardManager.shared.enable = true
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelCoinName1.text = "Bitcoin"
		labelCoinID1.text = "BTC"

		labelCoinName2.text = "US Dollar"
		labelCoinID2.text = "USD"

		labelCoinInfo.text = "1 BTC - $6891.43"

		textFieldCoin1.text = "2.6"
		textFieldCoin2.text = "17917.718"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func keyboardWillShow(_ notification: Notification) {

		if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
			let keyboardRectangle = keyboardFrame.cgRectValue
			let keyboardHeight = keyboardRectangle.height
			UIView.animate(withDuration: 0.5) {
				self.layoutConstraintBottom.constant = keyboardHeight
			}
			UIView.animate(withDuration: 0.5, animations: {
				self.layoutConstraintBottom.constant = keyboardHeight
			}) { (isComplete) in
				self.layoutConstraintBottom.constant -= self.view.safeAreaInsets.bottom
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
	@IBAction func actionCoin1(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCoin2(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCoinSwap(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionExchange(_ sender: UIButton) {

		print(#function)
	}
}
