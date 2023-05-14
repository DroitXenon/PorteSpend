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
class VoiceCall1View: UIViewController {

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelCallStatus: UILabel!
	@IBOutlet var viewVideo: UIView!
	@IBOutlet var viewContacts: UIView!
	@IBOutlet var viewSpeaker: UIView!
	@IBOutlet var viewMute: UIView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		viewVideo.layer.borderWidth = 1
		viewVideo.layer.borderColor = AppColor.Border.cgColor

		viewContacts.layer.borderWidth = 1
		viewContacts.layer.borderColor = AppColor.Border.cgColor

		viewSpeaker.layer.borderWidth = 1
		viewSpeaker.layer.borderColor = AppColor.Border.cgColor

		viewMute.layer.borderWidth = 1
		viewMute.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Portraits", 14)
		labelName.text = "Emma Harris"
		labelCallStatus.text = "Voice calling..."
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionVideo(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionContacts(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

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
	@IBAction func actionCall(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}
