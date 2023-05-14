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
import MapKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class Feed3Cell2: UITableViewCell {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var imageLocation: UIImageView!
	@IBOutlet var labelLocation: UILabel!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var buttonMore: UIButton!
	@IBOutlet var labelContent: UILabel!
	@IBOutlet var layoutConstraintContentHeight: NSLayoutConstraint!
	@IBOutlet var mapView: MKMapView!
	@IBOutlet var imageViewProfile1: UIImageView!
	@IBOutlet var labelName1: UILabel!
	@IBOutlet var labelOther: UILabel!
	@IBOutlet var buttonlike: UIButton!
	@IBOutlet var buttonComment: UIButton!
	@IBOutlet var buttonShare: UIButton!
	@IBOutlet var labelLikes: UILabel!
	@IBOutlet var labelComments: UILabel!
	@IBOutlet var labelShare: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let location = data["location"] else { return }
		guard let time = data["time"] else { return }
		guard let content = data["content"] else { return }
		guard let otherName = data["otherName"] else { return }
		guard let otherCount = data["otherCount"] else { return }
		guard let likes = data["likes"] else { return }
		guard let comments = data["comments"] else { return }
		guard let shares = data["shares"] else { return }

		imageViewProfile.sample("Social", "Lifestyle", index + 13)
		labelName.text = name
		labelLocation.text = location
		labelTime.text = time
		labelContent.text = content
		imageViewProfile1.sample("Social", "Lifestyle", index + 22)
		labelName1.text = otherName
		labelOther.text = otherCount
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
