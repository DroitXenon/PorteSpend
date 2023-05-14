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
class Post3DTouchView: UIViewController {

	@IBOutlet var viewMain: UIView!

	@IBOutlet var imageNews: UIImageView!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var labelTitle: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let interaction = UIContextMenuInteraction(delegate: self)
		viewMain.addInteraction(interaction)

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageNews.sample("Reader", "Environment", 28)
		labelTitle.text = "The 2020 Debate Over Health Care Is Getting ‘a Lot More Real"
		labelDate.text = "17 MAR 2020"
	}
}

// MARK: - UIContextMenuInteractionDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Post3DTouchView: UIContextMenuInteractionDelegate {

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

			let actionAddBookmark = UIAction(title: "Add to Bookmark", image: UIImage(systemName: "bookmark.fill")) { action in
				print("Add to Cart")
			}

			let actionShare = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
				print("Share")
			}

			return UIMenu(title: "", children: [actionLearnMore, actionAddBookmark, actionShare])
		}
	}
}
