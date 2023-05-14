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
class AddReviewView: UIViewController {

	@IBOutlet var textFieldHeadline: UITextField!
	@IBOutlet var textViewAdvantages: UITextView!
	@IBOutlet var textViewDisadvantages: UITextView!
	@IBOutlet var labelCleanlinessRating: UILabel!
	@IBOutlet var sliderCleanliness: UISlider!
	@IBOutlet var labelComfortRating: UILabel!
	@IBOutlet var sliderComfort: UISlider!
	@IBOutlet var labelLocationRating: UILabel!
	@IBOutlet var sliderLocation: UISlider!
	@IBOutlet var labelFacilitiesRating: UILabel!
	@IBOutlet var sliderFacilities: UISlider!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Write a review"

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(actionClose))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Publish", style: .done, target: self, action: #selector(actionPublish))

		textFieldHeadline.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
		textFieldHeadline.leftViewMode = .always

		IQKeyboardManager.shared.enableAutoToolbar = true
		IQKeyboardManager.shared.toolbarTintColor = AppColor.Theme
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		IQKeyboardManager.shared.enableAutoToolbar = false
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionClose() {

		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionPublish() {

		print(#function)
	}

	// MARK: - Slider value changed methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func sliderCleanlinessChanged(_ sender: UISlider) {

		labelCleanlinessRating.text = String(format: "%.1f", sender.value)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func sliderComfortChanged(_ sender: UISlider) {

		labelComfortRating.text = String(format: "%.1f", sender.value)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func sliderLocationChanged(_ sender: UISlider) {

		labelLocationRating.text = String(format: "%.1f", sender.value)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func sliderFacilitiesChanged(_ sender: UISlider) {

		labelFacilitiesRating.text = String(format: "%.1f", sender.value)
	}
}
