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
class Running1Cell: UITableViewCell {

	@IBOutlet var viewBackground: UIView!
	@IBOutlet var labelActivity: UILabel!
	@IBOutlet var labelDistance: UILabel!
	@IBOutlet var labelActiveTime: UILabel!
	@IBOutlet var labelCalories: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		viewBackground.layer.borderWidth = 1
		viewBackground.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let activity = data["activity"] else { return }
		guard let distance = data["distance"] else { return }
		guard let activeTime = data["activeTime"] else { return }
		guard let calories = data["calories"] else { return }

		labelActivity.text = activity.uppercased()
		labelDistance.text = distance + " km"
		labelActiveTime.text = activeTime
		labelCalories.text = calories + " kcal"
	}
}
