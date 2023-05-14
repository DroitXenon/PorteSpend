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
class VideoCall3View: UIViewController {

	@IBOutlet var imageViewSelf: UIImageView!
	@IBOutlet var imageViewOther: UIImageView!
	@IBOutlet var viewSpeaker: UIView!
	@IBOutlet var viewMute: UIView!
	@IBOutlet var viewRotate: UIView!
	@IBOutlet var viewCall: UIView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewSelf.sample("Social", "Profiles", 18)
		imageViewOther.sample("Social", "Portraits", 15)

		viewSpeaker.layer.borderWidth = 1
		viewSpeaker.layer.borderColor = AppColor.Border.cgColor

		viewMute.layer.borderWidth = 1
		viewMute.layer.borderColor = AppColor.Border.cgColor

		viewRotate.layer.borderWidth = 1
		viewRotate.layer.borderColor = AppColor.Border.cgColor
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSpeaker(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMute(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionRotate(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCall(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}
