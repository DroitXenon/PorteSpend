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
class Login4View: UIViewController {

	@IBOutlet var imageViewLogo: UIImageView!
	@IBOutlet var imageViewProfile: UIButton!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelEmail: UILabel!
	@IBOutlet var buttonContinue: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationController?.setNavigationBarHidden(true, animated: false)

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewLogo.image = UIImage(systemName: "circles.hexagongrid.fill")
		labelName.text = "Larry Dennis"
		labelEmail.text = "larry.dennis@mail.io"
		buttonContinue.setTitle("Continue as Dennis", for: .normal)
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionContinue(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionChooseAnother(_ sender: Any) {

		print(#function)
		dismiss(animated: true)
	}
}
