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
class RestaurantsList2Cell: UITableViewCell {

	@IBOutlet var imageRestaurant: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelInfo: UILabel!
	@IBOutlet var buttonFavorite: UIButton!
	@IBOutlet var viewRate: UIView!
	@IBOutlet var labelRate: UILabel!
	@IBOutlet var viewDistance: UIView!
	@IBOutlet var labelDistance: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		buttonFavorite.layer.borderWidth = 1
		buttonFavorite.layer.borderColor = AppColor.Border.cgColor

		viewRate.layer.borderWidth = 1
		viewRate.layer.borderColor = AppColor.Border.cgColor

		viewDistance.layer.borderWidth = 1
		viewDistance.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let info = data["info"] else { return }
		guard let rate = data["rate"] else { return }
		guard let distance = data["distance"] else { return }

		imageRestaurant.sample("Food", "Breakfast", index + 14)
		labelName.text = name
		labelInfo.text = info
		labelRate.text = rate
		labelDistance.text = distance + " km"
	}
}
