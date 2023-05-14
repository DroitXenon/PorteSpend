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
class Home3Cell1: UICollectionViewCell {

	@IBOutlet var imageRestaurant: UIImageView!
	@IBOutlet var labelFoodType: UILabel!
	@IBOutlet var labelFoodName: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var buttonShowAll: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		buttonShowAll.layer.borderWidth = 1
		buttonShowAll.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let foodType = data["foodType"] else { return }
		guard let foodName = data["foodName"] else { return }
		guard let description = data["description"] else { return }

		imageRestaurant.sample("Food", "Sweets", index)
		labelFoodType.text = foodType.uppercased()
		labelFoodName.text = foodName
		labelDescription.text = description
	}
}
