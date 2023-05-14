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
class Profile2Cell1: UITableViewCell {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var imageVerified: UIImageView!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var buttonMore: UIButton!
	@IBOutlet var labelContent: UILabel!
	@IBOutlet var layoutConstraintContentHeight: NSLayoutConstraint!
	@IBOutlet var labelLikes: UILabel!
	@IBOutlet var labelComments: UILabel!
	@IBOutlet var buttonlike: UIButton!
	@IBOutlet var buttonComment: UIButton!
	@IBOutlet var buttonShare: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		buttonlike.layer.borderWidth = 1
		buttonlike.layer.borderColor = AppColor.Border.cgColor

		buttonComment.layer.borderWidth = 1
		buttonComment.layer.borderColor = AppColor.Border.cgColor

		buttonShare.layer.borderWidth = 1
		buttonShare.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: Any]) {

		guard let name = data["name"] as? String else { return }
		guard let time = data["time"] as? String else { return }
		guard let content = data["content"] as? String else { return }
		guard let likes = data["likes"] as? String else { return }
		guard let comments = data["comments"] as? String else { return }

		imageViewProfile.sample("Social", "Portraits", 14)
		labelName.text = name
		labelTime.text = time
		labelContent.text = content
		labelLikes.text = likes
		labelComments.text = comments

		if let descriptionHeight = labelContent.text?.height(withConstrainedWidth: labelContent.frame.size.width, font: UIFont.boldSystemFont(ofSize: 24)) {
			layoutConstraintContentHeight.constant = descriptionHeight
		}
	}
}

// MARK: - String
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension String {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.width)
	}
}
