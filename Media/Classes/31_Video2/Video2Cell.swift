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
class Video2Cell: UITableViewCell {

	@IBOutlet var imageViewUser: UIImageView!
	@IBOutlet var labelNameComment: UILabel!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var labelLikes: UILabel!
	@IBOutlet var buttonLikeDislike: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let comment = data["comment"] else { return }
		guard let date = data["date"] else { return }
		guard let likes = data["likes"] else { return }

		let userComment = (name + " " + comment)
		let attributedText = NSMutableAttributedString(string: userComment)
		attributedText.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.label], range: ((userComment as NSString).range(of: name)))
		labelNameComment.attributedText = attributedText
		labelDate.text = date
		labelLikes.text = likes
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLikeDislike(_ sender: Any) {

		print(#function)
	}
}
