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
class LimitsView: UIViewController {

	@IBOutlet var labelOnlinePaymentsAmount: UILabel!
	@IBOutlet var labelPaymentsInStoresAmount: UILabel!
	@IBOutlet var labelCashWithdrawalsAmount: UILabel!

	@IBOutlet var sliderOnlinePayments: UISlider!
	@IBOutlet var sliderPaymentsInStores: UISlider!
	@IBOutlet var sliderCashWithdrawals: UISlider!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Limits"
		navigationController?.navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true

		let userImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemGray, renderingMode: .alwaysOriginal)
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(actionProfile(_:)))

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelOnlinePaymentsAmount.text = "$5000.00"
		labelPaymentsInStoresAmount.text = "$1200.00"
		labelCashWithdrawalsAmount.text = "$3000.00"

		sliderOnlinePayments.value = 0.75
		sliderPaymentsInStores.value = 0.35
		sliderCashWithdrawals.value = 0.55
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionProfile(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionUpdateLimits(_ sender: UIButton) {

		print(#function)
	}
}
