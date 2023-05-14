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
class Posts9Cell: UICollectionViewCell {

	@IBOutlet var imageNews: UIImageView!
	@IBOutlet var labelCategory: UILabel!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelComments: UILabel!
	@IBOutlet var labelViews: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let category = data["category"] else { return }
		guard let date = data["date"] else { return }
		guard let title = data["title"] else { return }
		guard let description = data["description"] else { return }
		guard let comments = data["comments"] else { return }
		guard let views = data["views"] else { return }

		imageNews.sample("Reader", "Traffic", index + 7)
		labelCategory.text = category.uppercased()
		labelDate.text = date
		labelTitle.text = title
		labelDescription.text = description
		labelComments.text = comments
		labelViews.text = views
	}
}
