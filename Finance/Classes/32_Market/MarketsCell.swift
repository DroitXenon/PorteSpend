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
class MarketsCell: UITableViewCell {

	@IBOutlet var imageViewCoin: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelCoinInfo: UILabel!
	@IBOutlet var labelAmount: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let coin_id = data["coin_id"] else { return }
		guard let amount = data["amount"] else { return }
		guard let percentage = data["percentage"] else { return }
		guard let isPlus = data["isPlus"] else { return }

		imageViewCoin.sample("Finance", "Stocks", index.row+10)
		labelName.text = name
		labelCoinInfo.text = coin_id + ((isPlus == "Plus") ? " • +" : " • -") + percentage
		labelAmount.text = amount
	}
}
