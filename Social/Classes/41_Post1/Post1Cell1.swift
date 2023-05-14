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
class Post1Cell1: UITableViewCell {

	@IBOutlet var imageMusic: UIImageView!
	@IBOutlet var labelMusic: UILabel!
	@IBOutlet var labelArtist: UILabel!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var buttonMore: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let music = data["music"] else { return }
		guard let artist = data["artist"] else { return }
		guard let time = data["time"] else { return }

		labelMusic.text = music
		labelArtist.text = artist
		labelTime.text = time
	}
}
