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
class AddReview2View: UIViewController {

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

	@IBOutlet var textViewMerits: UITextView!
	@IBOutlet var textViewDemerits: UITextView!

	private var placeholderLabel1 = UILabel()
	private var placeholderLabel2 = UILabel()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		placeholderLabel1.text = "Write a review"
		placeholderLabel1.font = UIFont.systemFont(ofSize: textViewMerits.font!.pointSize)
		placeholderLabel1.sizeToFit()
		placeholderLabel1.frame.origin = CGPoint(x: 5, y: textViewMerits.font!.pointSize / 2)
		placeholderLabel1.textColor = UIColor.lightGray
		placeholderLabel1.isHidden = !textViewMerits.text.isEmpty
		textViewMerits.addSubview(placeholderLabel1)

		placeholderLabel2.text = "Write a review"
		placeholderLabel2.font = UIFont.systemFont(ofSize: textViewDemerits.font!.pointSize)
		placeholderLabel2.sizeToFit()
		placeholderLabel2.frame.origin = CGPoint(x: 5, y: textViewDemerits.font!.pointSize / 2)
		placeholderLabel2.textColor = UIColor.lightGray
		placeholderLabel2.isHidden = !textViewDemerits.text.isEmpty
		textViewDemerits.addSubview(placeholderLabel2)
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
extension AddReview2View: UITextViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func textViewDidChange(_ textView: UITextView) {

		placeholderLabel1.isHidden = !textViewMerits.text.isEmpty
		placeholderLabel2.isHidden = !textViewDemerits.text.isEmpty
	}
}
