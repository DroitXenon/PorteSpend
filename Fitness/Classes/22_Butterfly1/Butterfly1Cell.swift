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
class Butterfly1Cell: UICollectionViewCell {

	@IBOutlet var imageViewButterfly: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelRaps: UILabel!
	@IBOutlet var labelTotalRaps: UILabel!
	@IBOutlet var viewSave: UIView!
	@IBOutlet var buttonSave: UIButton!
	@IBOutlet var buttonLearnMore: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		viewSave.layer.borderWidth = 1
		viewSave.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let description = data["description"] else { return }
		guard let raps = data["raps"] else { return }
		guard let totalRaps = data["totalRaps"] else { return }

		imageViewButterfly.sample("Fitness", "Yoga", index.row+5)
		labelTitle.text = title
		labelDescription.text = description
		labelRaps.text = raps
		labelTotalRaps.text = "/" + totalRaps + " raps"
	}
}
