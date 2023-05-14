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
class FindFriends1Cell1: UICollectionViewCell {

	@IBOutlet var imageCover: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var imageVerified: UIImageView!
	@IBOutlet var labelLikes: UILabel!
	@IBOutlet var labelCategory: UILabel!
	@IBOutlet var viewImage1: UIView!
	@IBOutlet var viewImage2: UIView!
	@IBOutlet var viewImage3: UIView!
	@IBOutlet var imageUser1: UIImageView!
	@IBOutlet var imageUser2: UIImageView!
	@IBOutlet var imageUser3: UIImageView!
	@IBOutlet var viewMoreUserCount: UIView!
	@IBOutlet var labelMoreUserCount: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let likes = data["likes"] else { return }
		guard let category = data["category"] else { return }

		imageCover.sample("Social", "Party", index)
		labelTitle.text = title
		labelLikes.text = likes
		labelCategory.text = category
	}
}
