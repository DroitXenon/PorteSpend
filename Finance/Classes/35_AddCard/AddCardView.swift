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
class AddCardView: UIViewController {

	@IBOutlet var viewScan: UIView!
	@IBOutlet var viewCardBackground: UIView!

	@IBOutlet var labelName: UILabel!
	@IBOutlet var viewCard: UIView!
	@IBOutlet var imageCard: UIImageView!
	@IBOutlet var labelCardNumber: UILabel!
	@IBOutlet var labelCVV: UILabel!
	@IBOutlet var labelExpiryDate: UILabel!

	@IBOutlet var labelCardDesign: UILabel!
	@IBOutlet var textFieldCardHolder: UITextField!
	@IBOutlet var textFieldCardNumber: UITextField!
	@IBOutlet var textFieldExpDate: UITextField!
	@IBOutlet var textFieldCVV: UITextField!

	private var cards = ["", "", "", "", "", "", ""]
	private var currentCardIndex = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Add Card"
		navigationController?.navigationItem.largeTitleDisplayMode = .never
		navigationController?.navigationBar.prefersLargeTitles = false

		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(actionCancel(_:)))
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewScan)

		viewCardBackground.layer.borderWidth = 1
		viewCardBackground.layer.borderColor = AppColor.Border.cgColor

		viewCard.layer.borderWidth = 1
		viewCard.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {
		
		labelName.text = "Dave Smith"
		labelCardNumber.text = "3742 8892 2573 3800"
		labelCVV.text = "143"
		labelExpiryDate.text = "02/2021"
		labelCardDesign.text = "Light"

		textFieldCardHolder.text = "Dave Smith"
		textFieldCardNumber.text = "3742 8892 2573 3800"
		textFieldExpDate.text = "02/2021"
		textFieldCVV.text = "143"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCancel(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionScan(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCardDesign(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddCard(_ sender: UIButton) {

		print(#function)
	}
}
