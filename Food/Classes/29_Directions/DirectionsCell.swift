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
class DirectionsCell: UITableViewCell {

	@IBOutlet var viewSeparator: UIView!
	@IBOutlet var viewBackground: UIView!
	@IBOutlet var labelIndex: UILabel!
	@IBOutlet var labelIndexText: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var imageSelected: UIImageView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let index = data["index"] else { return }
		guard let indexText = data["indexText"] else { return }
		guard let description = data["description"] else { return }

		labelIndex.text = index
		labelIndexText.text = indexText
		labelDescription.text = description
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func set(isSelected: Bool) {

		labelIndex.backgroundColor = isSelected ? UIColor.systemBackground : UIColor.tertiarySystemFill
		viewBackground.backgroundColor = isSelected ? AppColor.Theme.withAlphaComponent(0.15) : UIColor.systemBackground
		imageSelected.tintColor = isSelected ? AppColor.Theme : UIColor.systemGray
		imageSelected.image = UIImage(systemName: isSelected ? "checkmark.circle.fill" : "circle.fill")
		viewSeparator.isHidden = isSelected
	}
}
