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
class SearchCell2: UICollectionViewCell {

	@IBOutlet var imageViewUser: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelCategory: UILabel!
	@IBOutlet var labelFollowers: UILabel!
	@IBOutlet var viewRate: UIView!
	@IBOutlet var labelRate: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		viewRate.layer.borderWidth = 1
		viewRate.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let category = data["category"] else { return }
		guard let followers = data["followers"] else { return }
		guard let rate = data["rate"] else { return }

		imageViewUser.sample("Fitness", "ManPower", index.row+20)
		labelName.text = name
		labelCategory.text = category
		labelFollowers.text = followers + " followers"
		labelRate.text = rate
	}
}
