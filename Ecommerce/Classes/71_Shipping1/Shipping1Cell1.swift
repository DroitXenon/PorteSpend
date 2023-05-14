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
class Shipping1Cell1: UITableViewCell {

	@IBOutlet var viewBackground: UIView!

	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelAddress: UILabel!
	@IBOutlet var labelContactNo: UILabel!

	@IBOutlet var imageSelected: UIImageView!
	@IBOutlet var buttonEdit: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		buttonEdit.layer.borderWidth = 1
		buttonEdit.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let address1 = data["address1"] else { return }
		guard let address2 = data["address2"] else { return }
		guard let address3 = data["address3"] else { return }
		guard let contactNo = data["contactNo"] else { return }

		labelName.text = name
		labelAddress.text = address1 + "\n" + address2 + "\n" + address3
		labelContactNo.text = contactNo
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
