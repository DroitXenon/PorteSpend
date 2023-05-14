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
class Feed4Cell3: UITableViewCell {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelWithName: UILabel!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var buttonMore: UIButton!
	@IBOutlet var labelContent: UILabel!
	@IBOutlet var layoutConstraintContentHeight: NSLayoutConstraint!
	@IBOutlet var buttonlike: UIButton!
	@IBOutlet var buttonShare: UIButton!
	@IBOutlet var labelLikes: UILabel!
	@IBOutlet var labelComments: UILabel!
	@IBOutlet var labelShare: UILabel!
	@IBOutlet var imageViewProfile1: UIImageView!
	@IBOutlet var textFieldComment: UITextField!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		if let descriptionHeight = labelContent.text?.height(withConstrainedWidth: labelContent.frame.size.width, font: UIFont.systemFont(ofSize: 16)) {
			layoutConstraintContentHeight.constant = descriptionHeight
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let withName = data["withName"] else { return }
		guard let time = data["time"] else { return }
		guard let content = data["content"] else { return }
		guard let likes = data["likes"] else { return }
		guard let comments = data["comments"] else { return }
		guard let shares = data["shares"] else { return }

		imageViewProfile.sample("Social", "Portraits", index + 12)
		labelName.text = name
		labelWithName.text = withName
		labelTime.text = time
		labelContent.text = content
		labelLikes.text = likes
		labelComments.text = comments
		labelShare.text = shares

		if let descriptionHeight = labelContent.text?.height(withConstrainedWidth: labelContent.frame.size.width, font: UIFont.systemFont(ofSize: 16)) {
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
