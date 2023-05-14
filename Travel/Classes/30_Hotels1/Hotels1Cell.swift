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
class Hotels1Cell: UITableViewCell {

	@IBOutlet var imageViewHotel: UIImageView!
	@IBOutlet var labelRatings: UILabel!
	@IBOutlet var labelHotelName: UILabel!
	@IBOutlet var labelAddress: UILabel!
	@IBOutlet var labelAmount: UILabel!
	@IBOutlet var buttonLikeDislike: UIButton!
	@IBOutlet var imageViewStar1: UIImageView!
	@IBOutlet var imageViewStar2: UIImageView!
	@IBOutlet var imageViewStar3: UIImageView!
	@IBOutlet var imageViewStar4: UIImageView!
	@IBOutlet var imageViewStar5: UIImageView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, hotel: [String: String]) {

		guard let ratings = hotel["ratings"] else { return }
		guard let name = hotel["name"] else { return }
		guard let address = hotel["address"] else { return }
		guard let amount = hotel["amount"] else { return }

		imageViewHotel.sample("Travel", "Resorts", index)
		labelRatings.text = ratings
		labelHotelName.text = name
		labelAddress.text = address
		labelAmount.text = amount
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLikeDislike(_ sender: Any) {

		print(#function)
	}
}
