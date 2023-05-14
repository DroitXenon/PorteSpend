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
class OrderInfo1Cell1: UITableViewCell {

	@IBOutlet var imageProduct: UIImageView!

	@IBOutlet var labelTitle: UILabel!

	@IBOutlet var labelColor: UILabel!
	@IBOutlet var labelSize: UILabel!
	@IBOutlet var labelQuantity: UILabel!

	@IBOutlet var labelPrice: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let price = data["price"] else { return }
		guard let color = data["color"] else { return }
		guard let quantity = data["quantity"] else { return }
		guard let size = data["size"] else { return }

		imageProduct.sample("Ecommerce", "Cosmetics", index + 7)
		labelTitle.text = title
		labelPrice.text = price
		labelColor.text = "Color: " + color
		labelSize.text = "Size: " + size
		labelQuantity.text = "QTY: " + quantity
	}
}
