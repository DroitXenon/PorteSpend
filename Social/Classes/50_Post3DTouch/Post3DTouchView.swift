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

	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelUser: UILabel!
	@IBOutlet var imageVerified: UIImageView!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var imagePost: UIImageView!

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

		imageUser.sample("Social", "Profiles", 3)
		labelUser.text = "Fernando Harris"
		labelTime.text = "2 min ago"
		imagePost.sample("Social", "Pets", 14)
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

			let actionLike = UIAction(title: "Like", image: UIImage(systemName: "heart.fill")) { action in
				print("Like")
			}

			let actionComment = UIAction(title: "Comment", image: UIImage(systemName: "text.bubble.fill")) { action in
				print("Comment")
			}

			let actionShare = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
				print("Share")
			}

			let actionCopyLink = UIAction(title: "Copy Link", image: UIImage(systemName: "link")) { action in
				print("Copy Link")
			}

			let actionReport = UIAction(title: "Report", image: UIImage(systemName: "exclamationmark.circle.fill")) { action in
				print("Report")
			}

			return UIMenu(title: "", children: [actionLearnMore, actionLike, actionComment, actionShare, actionCopyLink, actionReport])
		}
	}
}
