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
class Video4View: UIViewController {

	@IBOutlet var imageViewVideo: UIImageView!
	@IBOutlet var buttonPlayPause: UIButton!
	@IBOutlet var labelTimeElapsed: UILabel!
	@IBOutlet var slider: UISlider!

	private var navigationBackgroundImage: UIImage?

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Bob Marley - Is This Love (Montmartre Remix)"

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .done, target: self, action: #selector(actionMinimize))
		navigationItem.rightBarButtonItems = [
			UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore)),
			UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(actionSetting)),
			UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.on.square.fill"), style: .done, target: self, action: #selector(actionScreenShare))]

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewVideo.sample("Media", "Music", 19)
		labelTimeElapsed.text = "0:10 - 11:19"
		slider.value = 0.5
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMinimize() {

		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSetting() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionScreenShare() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPlayPause(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionExpandVideo(_ sender: Any) {

		print(#function)
	}
}
