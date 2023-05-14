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
class Item3DTouchView: UIViewController {

	@IBOutlet var viewMain: UIView!

	@IBOutlet var imageProduct: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelBrandName: UILabel!
	@IBOutlet var labelPrice: UILabel!
	@IBOutlet var labelOriginalPrice: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		let interaction = UIContextMenuInteraction(delegate: self)
		viewMain.addInteraction(interaction)

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProduct.sample("Ecommerce", "Shoes", 12)
		labelTitle.text = "Platform Derby Shoes"
		labelBrandName.text = "Stella McCartney"
		labelPrice.text = "$384.00"
		labelOriginalPrice.text = "$640.00"
		labelOriginalPrice.isHidden = false
	}
}

// MARK: - UIContextMenuInteractionDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Item3DTouchView: UIContextMenuInteractionDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {

		return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
			let actionLearnMore1 = UIAction(title: "Learn More 1", image: UIImage(systemName: "square.and.arrow.up")) { action in
				print("Learn More 1")
			}
			let actionLearnMore2 = UIAction(title: "Learn More 2", image: UIImage(systemName: "square.and.arrow.up")) { action in
				print("Learn More 2")
			}
			let actionLearnMore = UIMenu(title: "Learn More", image: UIImage(systemName: "chevron.right"), children: [actionLearnMore1, actionLearnMore2])

			let actionAddCart = UIAction(title: "Add to Cart", image: UIImage(systemName: "cart.fill")) { action in
				print("Add to Cart")
			}

			let actionAddWishlist = UIAction(title: "Add to Wishlist", image: UIImage(systemName: "heart.fill")) { action in
				print("Add to Wishlist")
			}

			let actionShare = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
				print("Share")
			}

			return UIMenu(title: "", children: [actionLearnMore, actionAddCart, actionAddWishlist, actionShare])
		}
	}
}
