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
class ChatsCell: UITableViewCell {

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var imageLock: UIImageView!
	@IBOutlet var layoutConstraintImageLockWidth: NSLayoutConstraint!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var imageReadStatus: UIImageView!
	@IBOutlet var layoutConstraintImageReadStatusWidth: NSLayoutConstraint!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var labelUsername: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var viewUnreadCount: UIView!
	@IBOutlet var labelUnreadCount: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let isPrivate = data["isPrivate"] else { return }
		guard let username = data["username"] else { return }
		guard let message = data["message"] else { return }
		guard let time = data["time"] else { return }
		guard let count = data["count"] else { return }
		guard let tick = data["tick"] else { return }

		imageProfile.sample("Social", "Profiles", index + 14)
		labelName.text = title
		if isPrivate == "1" {
			layoutConstraintImageLockWidth.constant = 20
			labelName.textColor = AppColor.Theme
		}
		else {
			layoutConstraintImageLockWidth.constant = 0
			labelName.textColor = UIColor.label
		}
		if username.count > 0 {
			labelUsername.isHidden = false
			labelUsername.text = username
		}
		else {
			labelUsername.isHidden = true
		}
		labelTime.text = time
		labelDescription.text = message
		labelUnreadCount.text = count
		if tick == "1" {
			layoutConstraintImageReadStatusWidth.constant = 15
		}
		else {
			layoutConstraintImageReadStatusWidth.constant = 0
		}
		viewUnreadCount.isHidden = (labelUnreadCount.text == "")
	}
}
