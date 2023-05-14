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
class PlaylistCell: UITableViewCell {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var imageViewE: UIImageView!
	@IBOutlet var labelArtist: UILabel!
	@IBOutlet var labelDuration: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let title = data["name"] else { return }
		guard let artist = data["artist"] else { return }
		guard let duration = data["duration"] else { return }

		labelTitle.text = title
		labelArtist.text = artist
		labelDuration.text = duration
		imageViewE.isHidden = !imageViewE.isHidden
	}
}
