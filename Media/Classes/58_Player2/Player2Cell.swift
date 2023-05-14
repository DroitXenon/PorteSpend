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
class Player2Cell: UITableViewCell {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelArtist: UILabel!
	@IBOutlet var buttonOption: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: Any]) {

		guard let title = data["name"] as? String else { return }
		guard let artist = data["artist"] as? String else { return }
		guard let isBookmark = data["isBookmark"] as? Bool else { return }
		guard let isDownload = data["isDownload"] as? Bool else { return }

		labelTitle.text = title
		labelArtist.text = artist

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
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionOption(_ sender: Any) {

		print(#function)
	}
}
