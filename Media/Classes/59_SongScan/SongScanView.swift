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
class SongScanView: UIViewController {

	@IBOutlet var imageViewMain: UIImageView!
	@IBOutlet var imageViewBG1: UIImageView!
	@IBOutlet var imageViewBG2: UIImageView!

	private var timer = Timer()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Song Search"

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(actionAdd))

		imageViewBG1.alpha = 0
		imageViewBG2.alpha = 0
		timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAnimation), userInfo: nil, repeats: true)
	}

	// MARK: - Animation method
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func updateAnimation() {

		UIView.animate(withDuration: 0.25, animations: {
			self.imageViewBG1.alpha = 0.5
		}) { (value) in
			UIView.animate(withDuration: 0.25, animations: {
				self.imageViewBG2.alpha = 0.2
			}) { (value) in
				UIView.animate(withDuration: 0.25, animations: {
					self.imageViewBG2.alpha = 0
				}) { (value) in
					UIView.animate(withDuration: 0.25, animations: {
						self.imageViewBG1.alpha = 0
					}) { (value) in
					}
				}
			}
		}
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd() {

		print(#function)
	}
}
