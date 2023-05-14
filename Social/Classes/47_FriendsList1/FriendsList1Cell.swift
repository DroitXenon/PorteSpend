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
class FriendsList1Cell: UITableViewCell {

	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labeluserid: UILabel!
	@IBOutlet var buttonAdd: UIButton!
	@IBOutlet var buttonMore: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let userid = data["userid"] else { return }

		imageUser.sample("Social", "Portraits", index + 10)
		labelName.text = name
		labeluserid.text = userid
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setSelected(_ isSelected: Bool) {

		buttonAdd.tintColor = isSelected ? UIColor.darkGray : UIColor.white
		buttonAdd.backgroundColor = isSelected ? UIColor.systemBackground : AppColor.Theme
		buttonAdd.layer.borderWidth = isSelected ? 1 : 0
		buttonAdd.layer.borderColor = isSelected ? AppColor.Border.cgColor : UIColor.clear.cgColor
		buttonAdd.setImage(UIImage(systemName: isSelected ? "checkmark" : "person.fill.badge.plus"), for: [])
	}
}
