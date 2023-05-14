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
class Shipping3Cell1: UITableViewCell {

	@IBOutlet var viewBackground: UIView!

	@IBOutlet var labelShipping: UILabel!
	@IBOutlet var labelDuration: UILabel!
	@IBOutlet var labelRate: UILabel!

	@IBOutlet var imageSelected: UIImageView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let shipping = data["shipping"] else { return }
		guard let duration = data["duration"] else { return }
		guard let rate = data["rate"] else { return }

		labelShipping.text = shipping
		labelDuration.text = duration
		labelRate.text = rate
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setCell(isSelected: Bool) {

		viewBackground.backgroundColor = isSelected ? UIColor.systemBackground : UIColor.tertiarySystemFill
		viewBackground.layer.borderWidth = isSelected ? 1 : 0
		viewBackground.layer.borderColor = isSelected ? AppColor.Theme.cgColor : UIColor.clear.cgColor
		imageSelected.isHighlighted = isSelected
		imageSelected.tintColor = isSelected ? AppColor.Theme : UIColor.systemGray
	}
}
