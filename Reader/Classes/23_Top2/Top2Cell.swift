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
class Top2Cell: UITableViewCell {

	@IBOutlet var labelIndex: UILabel!
	@IBOutlet var labelCategory: UILabel!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelViews: UILabel!
	@IBOutlet var labelComments: UILabel!
	@IBOutlet var imageNews: UIImageView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let category = data["category"] else { return }
		guard let title = data["title"] else { return }
		guard let views = data["views"] else { return }
		guard let comments = data["comments"] else { return }

		labelCategory.text = category.uppercased()
		labelTitle.text = title
		labelViews.text = views.uppercased() + " views"
		labelComments.text = comments + " comments"
		imageNews.sample("Reader", "Politics", index + 1)
	}
}
