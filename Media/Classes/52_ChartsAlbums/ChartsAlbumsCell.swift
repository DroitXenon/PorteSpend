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
class ChartsAlbumsCell: UITableViewCell {

	@IBOutlet var labelNumber: UILabel!
	@IBOutlet var imageViewIcon: UIImageView!
	@IBOutlet var imageViewLogo: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var imageViewExplicit: UIImageView!
	@IBOutlet var labelArtist: UILabel!
	@IBOutlet var labelGenre: UILabel!
	@IBOutlet var labelRating: UILabel!
	@IBOutlet var buttonOption: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: Any]) {

		guard let title = data["name"] as? String else { return }
		guard let artist = data["artist"] as? String else { return }
		guard let genre = data["genre"] as? String else { return }
		guard let isExplicit = data["isExplicit"] as? Bool else { return }
		guard let isBookmark = data["isBookmark"] as? Bool else { return }
		guard let isDownload = data["isDownload"] as? Bool else { return }

		imageViewLogo.sample("Media", "Music", (index + 15))
		labelNumber.text = "\(index + 1)"
		labelTitle.text = title
		labelArtist.text = artist
		labelGenre.text = genre
		imageViewExplicit.isHidden = !(isExplicit)

		if isBookmark {
			if isDownload {
				buttonOption.setImage(UIImage(systemName: "ellipsis"), for: .normal)
			}
			else {
				buttonOption.setImage(UIImage(systemName: "icloud.and.arrow.down.fill"), for: .normal)
			}
		}
		else {
			buttonOption.setImage(UIImage(systemName: "text.badge.plus"), for: .normal)
		}

		if index == 2 {
			imageViewIcon.isHidden = false
			imageViewIcon.image = UIImage(systemName: "arrow.down")
		}
		else if index == 4 {
			imageViewIcon.isHidden = false
			imageViewIcon.image = UIImage(systemName: "star.fill")
		}
		else {
			imageViewIcon.isHidden = true
		}
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionOption(_ sender: Any) {

		print(#function)
	}
}
