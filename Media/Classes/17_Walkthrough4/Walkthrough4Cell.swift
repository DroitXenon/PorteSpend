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
class Walkthrough4Cell: UICollectionViewCell {

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelDescription: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let description = data["description"] else { return }

		imageView.sample("Media", "Music", index + 6)
		imageView.layoutIfNeeded()
		imageView.cornerRadius = imageView.frame.size.width / 2
		labelTitle.text = title
		labelDescription.text = description
	}
}
