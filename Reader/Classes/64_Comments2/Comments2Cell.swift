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
class Comments2Cell: UITableViewCell {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var labelLike: UILabel!
	@IBOutlet var buttonViewReplies: UIButton!
	@IBOutlet var buttonFavorite: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let username = data["username"] else { return }
		guard let description = data["description"] else { return }
		guard let date = data["date"] else { return }
		guard let like = data["like"] else { return }
		guard let replay = data["replay"] else { return }

		imageViewProfile.sample("Social", "Portraits", index + 3)
		let attrUsername = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold),
							NSAttributedString.Key.foregroundColor: UIColor.label]
		let attrComment = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
						   NSAttributedString.Key.foregroundColor: UIColor.label]

		let attrStringUsername = NSMutableAttributedString(string: username + "  ", attributes: attrUsername)
		let attrStringComment = NSMutableAttributedString(string: description, attributes: attrComment)
		attrStringUsername.append(attrStringComment)

		labelDescription.attributedText = attrStringUsername
		labelDate.text = date
		labelLike.text = like.uppercased() + " Likes"
		buttonViewReplies.setTitle("View \(replay) replies", for: [])
		buttonViewReplies.isHidden = (replay == "" || replay == "0")
	}
}
