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
class SubscribeCell: UITableViewCell {

	@IBOutlet var imageViewChannel: UIImageView!
	@IBOutlet var labelChannelName: UILabel!
	@IBOutlet var labelSubscribers: UILabel!
	@IBOutlet var labelVideos: UILabel!
	@IBOutlet var buttonMore: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let image = data["image"] else { return }
		guard let name = data["name"] else { return }
		guard let subscribers = data["subscribers"] else { return }
		guard let videos = data["videos"] else { return }

		imageViewChannel.image = UIImage(systemName: image)
		labelChannelName.text = name
		labelSubscribers.text = subscribers
		labelVideos.text = videos
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMore(_ sender: Any) {

		print(#function)
	}
}
