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
class IngredientsCell: UITableViewCell {

	@IBOutlet var viewSeparator: UIView!
	@IBOutlet var viewBackground: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var imageSelected: UIImageView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(ingredients: String) {

		labelTitle.text = ingredients
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func set(isSelected: Bool) {

		viewBackground.backgroundColor = isSelected ? AppColor.Theme.withAlphaComponent(0.15) : UIColor.systemBackground
		imageSelected.tintColor = isSelected ? AppColor.Theme : UIColor.systemGray
		imageSelected.image = UIImage(systemName: isSelected ? "checkmark.circle.fill" : "circle.fill")
		viewSeparator.isHidden = isSelected
	}
}
