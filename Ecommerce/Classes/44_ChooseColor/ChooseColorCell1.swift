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
class ChooseColorCell1: UITableViewCell {

	@IBOutlet var viewColor: UIView!
	@IBOutlet var labelColor: UILabel!
	@IBOutlet var labelLeftCount: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		viewColor.layer.cornerRadius = viewColor.frame.size.height/2
		viewColor.layer.borderWidth = 1
		viewColor.layer.borderColor = UIColor.gray.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: Any]) {

		guard let color = data["color"] as? UIColor else { return }
		guard let colorName = data["colorName"] as? String else { return }
		guard let leftCount = data["leftCount"] as? String else { return }

		viewColor.backgroundColor = color
		labelColor.text = colorName
		labelLeftCount.text = leftCount
	}
}
