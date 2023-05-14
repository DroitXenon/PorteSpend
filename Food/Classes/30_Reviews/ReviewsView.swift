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
class ReviewsView: UIViewController {

	@IBOutlet var viewRate: UIView!
	@IBOutlet var labelRate: UILabel!
	@IBOutlet var labelReview: UILabel!

	@IBOutlet var progressView1: UIProgressView!
	@IBOutlet var progressView2: UIProgressView!
	@IBOutlet var progressView3: UIProgressView!
	@IBOutlet var progressView4: UIProgressView!
	@IBOutlet var progressView5: UIProgressView!

	@IBOutlet var labelReviewCount1: UILabel!
	@IBOutlet var labelReviewCount2: UILabel!
	@IBOutlet var labelReviewCount3: UILabel!
	@IBOutlet var labelReviewCount4: UILabel!
	@IBOutlet var labelReviewCount5: UILabel!

	@IBOutlet var viewHeader: UIView!
	@IBOutlet var tableView: UITableView!

	private var reviews: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Reviews"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))

		tableView.register(UINib(nibName: "ReviewsCell", bundle: Bundle.main), forCellReuseIdentifier: "ReviewsCell")
		tableView.tableFooterView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 80, height: 80)))

		viewRate.layer.borderWidth = 1
		viewRate.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelRate.text = "4.9"
		labelReview.text = "34 reviews"

		progressView1.progress = 0.75
		progressView2.progress = 0.4
		progressView3.progress = 0.2
		progressView4.progress = 0.0
		progressView5.progress = 0.1

		labelReviewCount1.text = "20"
		labelReviewCount2.text = "8"
		labelReviewCount3.text = "4"
		labelReviewCount4.text = "0"
		labelReviewCount5.text = "2"

		reviews.removeAll()

		var dict1: [String: String] = [:]
		dict1["rating"] = "3"
		dict1["description"] = "This is my fourth pair of Clarks and I have never been disappointed. The look and comfort are well worth the price"
		dict1["username"] = "Alan Nickerson"
		dict1["date"] = "25 Sep 2018 "
		dict1["like"] = "35"
		dict1["unlike"] = "14"
		reviews.append(dict1)

		var dict2: [String: String] = [:]
		dict2["rating"] = "5"
		dict2["description"] = "Cute but not so comfy. I purchased these for my hubby for Christmas. He wore them a couple of times with very heavy socks."
		dict2["username"] = "Brian Elwood"
		dict2["date"] = "04 Mar 2019"
		dict2["like"] = "87"
		dict2["unlike"] = "33"
		reviews.append(dict2)

		var dict3: [String: String] = [:]
		dict3["rating"] = "1"
		dict3["description"] = "Great shoes, but they do run a little big. Make sure you put water protector on before going in the rain."
		dict3["username"] = "Chris Michael"
		dict3["date"] = "31 Jul 2019"
		dict3["like"] = "48"
		dict3["unlike"] = "4"
		reviews.append(dict3)

		var dict4: [String: String] = [:]
		dict4["rating"] = "4"
		dict4["description"] = "Not able to tell you how happy I am with e commerce. E commerce is worth much more than I paid"
		dict4["username"] = "Dave Smith"
		dict4["date"] = "12 Sep 2019"
		dict4["like"] = "15"
		dict4["unlike"] = "67"
		reviews.append(dict4)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionLike(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionUnike(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAdd(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ReviewsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return reviews.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsCell", for: indexPath) as! ReviewsCell
		cell.bindData(index: indexPath.item, data: reviews[indexPath.row])
		cell.buttonLikeCount.addTarget(self, action: #selector(actionLike(_:)), for: .touchUpInside)
		cell.buttonUnlikeCount.addTarget(self, action: #selector(actionUnike(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ReviewsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 210
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		return viewHeader
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
	}
}
