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
class AlbumCell: UITableViewCell {

	@IBOutlet var labelNumber: UILabel!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var imageViewExplicit: UIImageView!
	@IBOutlet var labelDuration: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: Any], index: Int) {

		guard let title = data["name"] as? String else { return }
		guard let duration = data["duration"] as? String else { return }
		guard let isExplicit = data["isExplicit"] as? Bool else { return }

		labelNumber.text = "\(index)"
		labelTitle.text = title
		labelDuration.text = duration
		imageViewExplicit.isHidden = !(isExplicit)
	}
}
