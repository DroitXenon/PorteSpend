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
class AddReview1View: UIViewController {

	@IBOutlet var imageRating1: UIImageView!
	@IBOutlet var imageRating2: UIImageView!
	@IBOutlet var imageRating3: UIImageView!
	@IBOutlet var imageRating4: UIImageView!
	@IBOutlet var imageRating5: UIImageView!

	@IBOutlet var buttonRating1: UIButton!
	@IBOutlet var buttonRating2: UIButton!
	@IBOutlet var buttonRating3: UIButton!
	@IBOutlet var buttonRating4: UIButton!
	@IBOutlet var buttonRating5: UIButton!

	@IBOutlet var textViewReview: UITextView!

	private var placeholderLabel = UILabel()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		placeholderLabel.text = "Write a review"
		placeholderLabel.font = UIFont.systemFont(ofSize: textViewReview.font!.pointSize)
		placeholderLabel.sizeToFit()
		placeholderLabel.frame.origin = CGPoint(x: 5, y: textViewReview.font!.pointSize / 2)
		placeholderLabel.textColor = UIColor.lightGray
		placeholderLabel.isHidden = !textViewReview.text.isEmpty
		textViewReview.addSubview(placeholderLabel)
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCancel(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAdd(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionRating1(_ sender: UIButton) {

		print(#function)
		imageRating1.tintColor = AppColor.Theme
		imageRating2.tintColor = UIColor.systemGray
		imageRating3.tintColor = UIColor.systemGray
		imageRating4.tintColor = UIColor.systemGray
		imageRating5.tintColor = UIColor.systemGray
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionRating2(_ sender: UIButton) {

		print(#function)
		imageRating1.tintColor = AppColor.Theme
		imageRating2.tintColor = AppColor.Theme
		imageRating3.tintColor = UIColor.systemGray
		imageRating4.tintColor = UIColor.systemGray
		imageRating5.tintColor = UIColor.systemGray
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionRating3(_ sender: UIButton) {

		print(#function)
		imageRating1.tintColor = AppColor.Theme
		imageRating2.tintColor = AppColor.Theme
		imageRating3.tintColor = AppColor.Theme
		imageRating4.tintColor = UIColor.systemGray
		imageRating5.tintColor = UIColor.systemGray
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionRating4(_ sender: UIButton) {

		print(#function)
		imageRating1.tintColor = AppColor.Theme
		imageRating2.tintColor = AppColor.Theme
		imageRating3.tintColor = AppColor.Theme
		imageRating4.tintColor = AppColor.Theme
		imageRating5.tintColor = UIColor.systemGray
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionRating5(_ sender: UIButton) {

		print(#function)
		imageRating1.tintColor = AppColor.Theme
		imageRating2.tintColor = AppColor.Theme
		imageRating3.tintColor = AppColor.Theme
		imageRating4.tintColor = AppColor.Theme
		imageRating5.tintColor = AppColor.Theme
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AddReview1View: UITextViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func textViewDidChange(_ textView: UITextView) {

		placeholderLabel.isHidden = !textView.text.isEmpty
	}
}
