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
class Walkthrough5Cell: UICollectionViewCell {

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var labelFeature1: UILabel!
	@IBOutlet var labelDescription1: UILabel!
	@IBOutlet var labelFeature2: UILabel!
	@IBOutlet var labelDescription2: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let feature1 = data["feature1"] else { return }
		guard let description1 = data["description1"] else { return }
		guard let feature2 = data["feature2"] else { return }
		guard let description2 = data["description2"] else { return }

		imageView.sample("Finance", "Accounting", index + 5)
		labelFeature1.text = feature1
		labelDescription1.text = description1
		labelFeature2.text = feature2
		labelDescription2.text = description2
	}
}
