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
class Article2View: UIViewController {

	@IBOutlet var labelDate: UILabel!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelUsername: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelComments: UILabel!
	@IBOutlet var labelViews: UILabel!
	@IBOutlet var labelShares: UILabel!
	@IBOutlet var viewCommetns: UIView!
	@IBOutlet var viewShare: UIView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let buttonFont = UIBarButtonItem(image: UIImage(systemName: "text.cursor"), style: .plain, target: self, action: #selector(actionFont(_:)))
		let buttonMore = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))
		navigationItem.rightBarButtonItems = [buttonMore, buttonFont]

		viewCommetns.layer.borderWidth = 1
		viewCommetns.layer.borderColor = AppColor.Border.cgColor

		viewShare.layer.borderWidth = 1
		viewShare.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageUser.sample("Reader", "News", 23)
		labelDate.text = "26 MAR 2020"
		labelTitle.text = "Surging Traffic Is Slowing Down Our Internet"
		labelUsername.text = "New York Times"
		labelDescription.text = """
		WASHINGTON — In late January, as China locked down some provinces to contain the spread of the coronavirus, average internet speeds in the country slowed as people who were stuck inside went online more and clogged the networks. In Hubei Province, the epicenter of infections, mobile broadband speeds fell by more than half.

		In mid-February, when the virus hit Italy, Germany and Spain, internet speeds in those countries also began to deteriorate.

		And last week, as a wave of stay-at-home orders rolled out across the United States, the average time it took to download videos, emails and documents increased as broadband speeds declined 4.9 percent from the previous week, according to Ookla, a broadband speed testing service. Median download speeds dropped 38 percent in San Jose, Calif., and 24 percent in New York, according to Broadband Now, a consumer broadband research site.

		Quarantines around the world have made people more reliant on the internet to communicate, work, learn and stay entertained. But as the use of YouTube, Netflix, Zoom videoconferencing, Facebook calls and videogaming has surged to new highs, the stress on internet infrastructure is starting to show in Europe and the United States — and the traffic is probably far from its peak.
		"""
		labelComments.text = "81"
		labelViews.text = "9381"
		labelShares.text = "34"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFont(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionComments(_ sender: UIButton) {

		print(#function)
	}
}
