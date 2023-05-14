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
import Charts

//-----------------------------------------------------------------------------------------------------------------------------------------------
class Running2Cell: UITableViewCell {

	@IBOutlet var labelDate: UILabel!
	@IBOutlet var labelVarient: UILabel!
	@IBOutlet var labelKm: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let date = data["date"] else { return }
		guard let varient = data["varient"] else { return }
		guard let km = data["km"] else { return }
		guard let isPlus = data["isPlus"] else { return }

		labelDate.text = date
		labelVarient.text = ((isPlus == "Plus") ? "+ " : "- ") + varient + " m"
		labelKm.text = km + " km"
		labelVarient.textColor = (isPlus == "Plus") ? AppColor.Theme : UIColor.secondaryLabel
	}
}
