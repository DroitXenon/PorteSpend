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
class RecipesList3Cell: UICollectionViewCell {

	@IBOutlet var imageRecipe: UIImageView!
	@IBOutlet var labelFoodType: UILabel!
	@IBOutlet var viewRate: UIView!
	@IBOutlet var labelRate: UILabel!
	@IBOutlet var labelFoodName: UILabel!
	@IBOutlet var buttonFavorite: UIButton!
	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelServings: UILabel!
	@IBOutlet var labelDuration: UILabel!
	@IBOutlet var labelCalories: UILabel!
	@IBOutlet var buttonSeeMore: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		viewRate.layer.borderWidth = 1
		viewRate.layer.borderColor = AppColor.Border.cgColor

		buttonFavorite.layer.borderWidth = 1
		buttonFavorite.layer.borderColor = AppColor.Border.cgColor

		buttonSeeMore.layer.borderWidth = 1
		buttonSeeMore.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let foodType = data["foodType"] else { return }
		guard let rate = data["rate"] else { return }
		guard let foodName = data["foodName"] else { return }
		guard let name = data["name"] else { return }
		guard let servings = data["servings"] else { return }
		guard let duration = data["duration"] else { return }
		guard let calories = data["calories"] else { return }

		imageRecipe.sample("Food", "Vegan", index + 19)
		labelFoodType.text = foodType
		labelRate.text = rate
		labelName.text = name
		labelFoodName.text = foodName
		imageUser.sample("Social", "Portraits", index + 3)
		labelServings.text = servings
		labelDuration.text = duration
		labelCalories.text = calories
	}
}
