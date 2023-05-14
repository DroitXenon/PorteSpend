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
class ReviewsCell: UITableViewCell {

	@IBOutlet var imageViewUser: UIImageView!
	@IBOutlet var labelUsername: UILabel!
	@IBOutlet var labelAreaDate: UILabel!
	@IBOutlet var labelRating: UILabel!
	@IBOutlet var labelReview: UILabel!
	@IBOutlet var labelAdvantages: UILabel!
	@IBOutlet var labelDisadvantages: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(review: [String: String]) {

		guard let username = review["username"] else { return }
		guard let areaDate = review["areaDate"] else { return }
		guard let rating = review["rating"] else { return }
		guard let reviews = review["review"] else { return }
		guard let advantages = review["advantages"] else { return }
		guard let disadvantages = review["disadvantages"] else { return }

		labelUsername.text = username
		labelAreaDate.text = areaDate
		labelRating.text = rating
		labelReview.text = reviews
		labelAdvantages.text = advantages
		labelDisadvantages.text = disadvantages
	}
}
