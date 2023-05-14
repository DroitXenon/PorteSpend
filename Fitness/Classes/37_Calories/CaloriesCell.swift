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
class CaloriesCell: UITableViewCell {

	@IBOutlet var viewBackground: UIView!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var buttonTime: UIButton!
	@IBOutlet var labelKCal: UILabel!
	@IBOutlet var labelGCarb: UILabel!
	@IBOutlet var labelGProtein: UILabel!
	@IBOutlet var labelGFat: UILabel!
	@IBOutlet var buttonAdd: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		viewBackground.layer.borderWidth = 1
		viewBackground.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let time = data["time"] else { return }
		guard let cal = data["cal"] else { return }
		guard let carb = data["carb"] else { return }
		guard let protein = data["protein"] else { return }
		guard let fat = data["fat"] else { return }

		labelTime.text = time
		labelKCal.text = cal + " kcal"
		labelGCarb.text = carb + " g"
		labelGProtein.text = protein + " g"
		labelGFat.text = fat + " g"
	}
}
