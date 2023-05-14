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
class Payment1Cell1: UITableViewCell {

	@IBOutlet var viewBackground: UIView!

	@IBOutlet var viewCard: UIView!
	@IBOutlet var imageCard: UIImageView!
	@IBOutlet var labelCardNumber: UILabel!
	@IBOutlet var labelExpiry: UILabel!
	@IBOutlet var labelName: UILabel!

	@IBOutlet var imageSelected: UIImageView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		viewCard.layer.borderWidth = 1
		viewCard.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let cardType = data["cardType"] else { return }
		guard let cardNumber = data["cardNumber"] else { return }
		guard let expiry = data["expiry"] else { return }
		guard let name = data["name"] else { return }

		labelCardNumber.text = cardType + " " + cardNumber
		labelExpiry.text = expiry
		labelName.text = name
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
