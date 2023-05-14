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
class RateAppView: UIViewController {

	@IBOutlet var imageRating1: UIImageView!
	@IBOutlet var imageRating2: UIImageView!
	@IBOutlet var imageRating3: UIImageView!
	@IBOutlet var imageRating4: UIImageView!
	@IBOutlet var imageRating5: UIImageView!

	@IBOutlet var labelRate: UILabel!
	@IBOutlet var labelRateInfo: UILabel!
	@IBOutlet var textViewComment: UITextView!

	private var placeholderLabel = UILabel()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		navigationController?.navigationItem.largeTitleDisplayMode = .never
		navigationController?.navigationBar.prefersLargeTitles = false

		placeholderLabel.text = "Comment"
		placeholderLabel.font = UIFont.systemFont(ofSize: textViewComment.font!.pointSize)
		placeholderLabel.sizeToFit()
		placeholderLabel.frame.origin = CGPoint(x: 5, y: textViewComment.font!.pointSize / 2)
		placeholderLabel.textColor = UIColor.label
		placeholderLabel.isHidden = !textViewComment.text.isEmpty
		textViewComment.addSubview(placeholderLabel)

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageRating1.tintColor = AppColor.Theme
		imageRating2.tintColor = AppColor.Theme
		imageRating3.tintColor = AppColor.Theme
		imageRating4.tintColor = AppColor.Theme
		imageRating5.tintColor = UIColor.systemGray
		labelRate.text = "4.0"
		labelRateInfo.text = "It's Good"
	}

	// MARK: - User actions
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
extension RateAppView: UITextViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func textViewDidChange(_ textView: UITextView) {

		placeholderLabel.isHidden = !textView.text.isEmpty
	}
}
