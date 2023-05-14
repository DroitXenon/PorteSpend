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
class Feed4Cell1: UITableViewCell {

	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var textFieldStatus: UITextField!
	@IBOutlet var buttonPhotos: UIButton!
	@IBOutlet var buttonVideo: UIButton!
	@IBOutlet var buttonLocation: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		buttonPhotos.layer.borderWidth = 1
		buttonPhotos.layer.borderColor = AppColor.Border.cgColor

		buttonVideo.layer.borderWidth = 1
		buttonVideo.layer.borderColor = AppColor.Border.cgColor

		buttonLocation.layer.borderWidth = 1
		buttonLocation.layer.borderColor = AppColor.Border.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: String) {

		imageViewProfile.sample("Social", "Portraits", index + 13)
		textFieldStatus.placeholder = data
	}
}
