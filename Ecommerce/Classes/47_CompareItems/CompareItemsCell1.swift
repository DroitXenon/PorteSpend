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
class CompareItemsCell1: UICollectionViewCell {

	@IBOutlet var imageProduct: UIImageView!
	@IBOutlet var labelSale: UILabel!
	@IBOutlet var buttonDelete: UIButton!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelBrandName: UILabel!
	@IBOutlet var labelPrice: UILabel!
	@IBOutlet var labelOriginalPrice: UILabel!
	@IBOutlet var imageRating1: UIImageView!
	@IBOutlet var imageRating2: UIImageView!
	@IBOutlet var imageRating3: UIImageView!
	@IBOutlet var imageRating4: UIImageView!
	@IBOutlet var imageRating5: UIImageView!
	@IBOutlet var labelReviews: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		labelSale.layer.borderWidth = 1
		labelSale.layer.borderColor = AppColor.Border.cgColor

		buttonDelete.layer.borderWidth = 1
		buttonDelete.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let brand = data["brand"] else { return }
		guard let price = data["price"] else { return }
		guard let originalPrice = data["originalPrice"] else { return }
		guard let rating = data["rating"] else { return }
		guard let review = data["review"] else { return }

		imageProduct.sample("Ecommerce", "Shoes", index + 18)
		labelTitle.text = title
		labelBrandName.text = brand
		labelPrice.text = price
		labelOriginalPrice.text = originalPrice
		labelSale.isHidden = (originalPrice == "")
		labelOriginalPrice.isHidden = (originalPrice == "")
		labelReviews.text = review + " Reviews"
		if let rate = Int(rating) {
			imageRating1.tintColor = (rate>=1) ? AppColor.Theme : UIColor.systemGray
			imageRating2.tintColor = (rate>=2) ? AppColor.Theme : UIColor.systemGray
			imageRating3.tintColor = (rate>=3) ? AppColor.Theme : UIColor.systemGray
			imageRating4.tintColor = (rate>=4) ? AppColor.Theme : UIColor.systemGray
			imageRating5.tintColor = (rate>=5) ? AppColor.Theme : UIColor.systemGray
		}
	}
}
