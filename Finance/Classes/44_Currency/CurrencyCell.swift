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
class CurrencyCell: UITableViewCell {

	@IBOutlet var imageViewCurrency: UIImageView!
	@IBOutlet var labelCurrency: UILabel!
	@IBOutlet var imageViewSelected: UIImageView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let currency_name = data["currency_name"] else { return }
		guard let currency = data["currency"] else { return }

		labelCurrency.text = currency_name.capitalized + " (\(currency.uppercased()))"
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setSelected(_ selected: Bool) {

		imageViewSelected.image = UIImage(systemName: selected ? "checkmark.circle.fill" : "circle.fill")
		imageViewSelected.tintColor = selected ? AppColor.Theme : UIColor.systemGray
	}
}
