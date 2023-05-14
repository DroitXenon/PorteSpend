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
class RepeatsView: UIViewController {

	@IBOutlet var labelTimer: UILabel!
	@IBOutlet var viewCircularProgress: RepeatsCircularProgressView!
	@IBOutlet var labelRemainReps: UILabel!
	@IBOutlet var labelTotalReps: UILabel!
	@IBOutlet var viewTrack: UIView!

	@IBOutlet var labelprocess: UILabel!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelReps: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTimer.text = "01:02:34"
		viewCircularProgress.setProgress(0.5)
		labelRemainReps.text = "9"
		labelTotalReps.text = "from 15 reps."
		labelprocess.text = "1/2"
		labelName.text = "Machine Bench Press"
		labelReps.text = "4 / 15 reps."
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReset(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionNext(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}
