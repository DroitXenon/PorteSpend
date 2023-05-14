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
class CreateGroupCell: UITableViewCell {

	@IBOutlet var imageSelected: UIImageView!
	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelStatus: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, name: String, status: String) {

		imageUser.sample("Social", "Portraits", index)
		labelName.text = name
		labelStatus.text = status
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setSelected(_ isSelected: Bool) {

		imageSelected.tintColor = isSelected ? AppColor.Theme : UIColor.systemGray
		imageSelected.image = UIImage(systemName: isSelected ? "checkmark.circle.fill" : "circle.fill")
	}
}
