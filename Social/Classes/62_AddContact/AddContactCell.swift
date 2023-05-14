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
class AddContactCell: UITableViewCell {

	@IBOutlet var buttonRemove: UIButton!
	@IBOutlet var labelPhone: UILabel!
	@IBOutlet var buttonPhone: UIButton!
	@IBOutlet var textFieldPhone: UITextField!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldPhone.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: attribute)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: String) {

		textFieldPhone.text = data
	}
}
