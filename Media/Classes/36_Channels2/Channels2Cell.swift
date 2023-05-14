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
class Channels2Cell: UITableViewCell {

	@IBOutlet var imageViewBackground: UIImageView!
	@IBOutlet var imageViewChannel: UIImageView!
	@IBOutlet var labelChannelName: UILabel!
	@IBOutlet var labelSubscribers: UILabel!
	@IBOutlet var labelVideos: UILabel!
	@IBOutlet var buttonSubscribe: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: Any]) {

		guard let name = data["name"] as? String else { return }
		guard let subscribers = data["subscribers"] as? String else { return }
		guard let videos = data["videos"] as? String else { return }
		guard let isSubscribed = data["isSubscribed"] as? Bool else { return }

		imageViewBackground.sample("Media", "Bands", index)
		imageViewChannel.sample("Media", "Music", index)
		labelChannelName.text = name
		labelSubscribers.text = subscribers
		labelVideos.text = videos
		updateSubscribeButton(isSubscribed)
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSubscribe(_ sender: Any) {

		updateSubscribeButton(!buttonSubscribe.isSelected)
	}

	// MARK: - Subscribe methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateSubscribeButton(_ isSubscribed: Bool) {

		buttonSubscribe.isSelected = isSubscribed
		if isSubscribed {
			buttonSubscribe.backgroundColor = UIColor.systemBackground
			buttonSubscribe.borderColor = AppColor.Border
			buttonSubscribe.borderWidth = 0.5
			buttonSubscribe.tintColor = UIColor.label
		}
		else {
			buttonSubscribe.backgroundColor = AppColor.Theme
			buttonSubscribe.borderWidth = 0
			buttonSubscribe.tintColor = UIColor.white
		}
	}
}
