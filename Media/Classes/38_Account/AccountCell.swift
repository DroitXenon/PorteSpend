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
class AccountCell: UITableViewCell {

	@IBOutlet var imageViewSetting: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelValue: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(setting: [String: Any]) {

		guard let image = setting["image"] as? String else { return }
		guard let title = setting["title"] as? String else { return }
		guard let value = setting["value"] as? String else { return }

		if image == "" {
			imageViewSetting.isHidden = true
		}
		else {
			imageViewSetting.isHidden = false
			imageViewSetting.image = UIImage(systemName: image)
		}

		labelTitle.text = title

		if value == "" {
			labelValue.isHidden = true
		}
		else {
			labelValue.isHidden = false
			labelValue.text = value
		}
	}
}
