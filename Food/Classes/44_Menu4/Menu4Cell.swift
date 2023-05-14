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
class Menu4Cell: UICollectionViewCell {

	@IBOutlet var imageMenu: UIImageView!
	@IBOutlet var viewRate: UIView!
	@IBOutlet var labelRate: UILabel!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelInfo: UILabel!
	@IBOutlet var buttonMinus: UIButton!
	@IBOutlet var labelCount: UILabel!
	@IBOutlet var buttonPlus: UIButton!
	@IBOutlet var labelPrice: UILabel!
	@IBOutlet var buttonAdd: UIButton!
	@IBOutlet var constraintBottomSpace: NSLayoutConstraint!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		viewRate.layer.borderWidth = 1
		viewRate.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let info = data["info"] else { return }
		guard let rate = data["rate"] else { return }
		guard let items = data["items"] else { return }
		guard let price = data["price"] else { return }

		imageMenu.sample("Food", "Breakfast", index.row)
		labelName.text = name
		labelInfo.text = info
		labelRate.text = rate
		labelCount.text = items
		labelPrice.text = price
	}
}
