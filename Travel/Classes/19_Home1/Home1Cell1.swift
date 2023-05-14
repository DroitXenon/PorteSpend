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
class Home1Cell1: UICollectionViewCell {

	@IBOutlet var imageViewTour: UIImageView!
	@IBOutlet var labelRatings: UILabel!
	@IBOutlet var buttonLikeDislike: UIButton!
	@IBOutlet var labelTourName: UILabel!
	@IBOutlet var labelPlacesCount: UILabel!
	@IBOutlet var labelDays: UILabel!
	@IBOutlet var labelAmount: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let ratings = data["ratings"] else { return }
		guard let name = data["name"] else { return }
		guard let placecount = data["placecount"] else { return }
		guard let days = data["days"] else { return }
		guard let amount = data["amount"] else { return }

		imageViewTour.sample("Travel", "Monuments", index)
		labelRatings.text = ratings
		labelTourName.text = name
		labelPlacesCount.text = placecount
		labelDays.text = days
		labelAmount.text = amount
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLikeDislike(_ sender: Any) {

		print(#function)
	}
}
