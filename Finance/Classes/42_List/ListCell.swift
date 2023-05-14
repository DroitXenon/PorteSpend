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
class ListCell: UITableViewCell {

	@IBOutlet var labelStoreName: UILabel!
	@IBOutlet var viewDistance: UIView!
	@IBOutlet var labelDistance: UILabel!
	@IBOutlet var labelAddress: UILabel!
	@IBOutlet var labelOpenStatus: UILabel!
	@IBOutlet var labelTime: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let distance = data["distance"] else { return }
		guard let address = data["address"] else { return }
		guard let status = data["status"] else { return }
		guard let time = data["time"] else { return }

		labelStoreName.text = name
		labelDistance.text = distance
		labelAddress.text = address
		labelOpenStatus.text = status
		labelTime.text = time
		labelOpenStatus.textColor = (status == "Open Now") ? AppColor.Theme : UIColor.label
	}
}
