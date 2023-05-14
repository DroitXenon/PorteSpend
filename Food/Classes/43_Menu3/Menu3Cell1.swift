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
class Menu3Cell1: UICollectionViewCell {

	@IBOutlet var viewMenu: UIView!
	@IBOutlet var labelMenu: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		viewMenu.layer.borderWidth = 1
		viewMenu.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(menu: String) {

		labelMenu.text = menu.uppercased()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func set(isSelected: Bool) {

		viewMenu.backgroundColor = isSelected ? AppColor.Theme : UIColor.systemBackground
		labelMenu.textColor = isSelected ? UIColor.white : UIColor.label
	}
}
