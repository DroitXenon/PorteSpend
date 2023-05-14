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
class Review1Cell1: UITableViewCell {

	@IBOutlet var imageRating1: UIImageView!
	@IBOutlet var imageRating2: UIImageView!
	@IBOutlet var imageRating3: UIImageView!
	@IBOutlet var imageRating4: UIImageView!
	@IBOutlet var imageRating5: UIImageView!

	@IBOutlet var labelDescription: UILabel!

	@IBOutlet var labelUsername: UILabel!
	@IBOutlet var labelDateAndLocation: UILabel!

	@IBOutlet var labelLikeCount: UILabel!
	@IBOutlet var labelUnlikeCount: UILabel!

	@IBOutlet var buttonLikeCount: UIButton!
	@IBOutlet var buttonUnlikeCount: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let rating = data["rating"] else { return }
		guard let description = data["description"] else { return }
		guard let username = data["username"] else { return }
		guard let date = data["date"] else { return }
		guard let location = data["location"] else { return }
		guard let like = data["like"] else { return }
		guard let unlike = data["unlike"] else { return }

		labelDescription.text = description
		labelUsername.text = username
		labelDateAndLocation.text = date + " - " + location
		labelLikeCount.text = like
		labelUnlikeCount.text = unlike

		if let rate = Int(rating) {
			imageRating1.tintColor = (rate>=1) ? AppColor.Theme : UIColor.systemGray
			imageRating2.tintColor = (rate>=2) ? AppColor.Theme : UIColor.systemGray
			imageRating3.tintColor = (rate>=3) ? AppColor.Theme : UIColor.systemGray
			imageRating4.tintColor = (rate>=4) ? AppColor.Theme : UIColor.systemGray
			imageRating5.tintColor = (rate>=5) ? AppColor.Theme : UIColor.systemGray
		}
	}
}
