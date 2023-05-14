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
class WaterCell: UICollectionViewCell {

	@IBOutlet var viewProgress: WaterProgressView!
	@IBOutlet var labelML: UILabel!
	@IBOutlet var imageViewGlass: UIImageView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		viewProgress.roundCorner = false
		viewProgress.trackColor = .tertiarySystemFill
		viewProgress.progressColor = AppColor.Theme.withAlphaComponent(0.2)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let ml = data["ml"] else { return }
		guard let totalML = data["totalML"] else { return }

		labelML.text = ml + " ml"
		guard let intML = Int(ml), let intTotalML = Int(totalML) else { return }
		labelML.isHidden = (intML == 0)
		let percentage = CGFloat((intML*100))/CGFloat(intTotalML)
		viewProgress.setProgress((percentage/100.0))
		imageViewGlass.tintColor = (percentage>50) ? AppColor.Theme : UIColor.systemGray
	}
}
