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
class Review2View: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var segmentedControl: UISegmentedControl!

	@IBOutlet var imageRating1: UIImageView!
	@IBOutlet var imageRating2: UIImageView!
	@IBOutlet var imageRating3: UIImageView!
	@IBOutlet var imageRating4: UIImageView!
	@IBOutlet var imageRating5: UIImageView!
	@IBOutlet var labelReviews: UILabel!

	private var expandedCells: Set<Int> = []
	private var reviews: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Chukka Boots"

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))

		tableView.register(UINib(nibName: "Review2Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Review2Cell1")
		tableView.estimatedRowHeight = 150

		updateUI()

		DispatchQueue.main.async {
			self.tableView.layoutIfNeeded()
			self.tableView.reloadData()
		}

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelReviews.text = "12.1K Reviews"
		if let rate = Int("3") {
			imageRating1.tintColor = (rate>=1) ? AppColor.Theme : UIColor.systemGray
			imageRating2.tintColor = (rate>=2) ? AppColor.Theme : UIColor.systemGray
			imageRating3.tintColor = (rate>=3) ? AppColor.Theme : UIColor.systemGray
			imageRating4.tintColor = (rate>=4) ? AppColor.Theme : UIColor.systemGray
			imageRating5.tintColor = (rate>=5) ? AppColor.Theme : UIColor.systemGray
		}

		reviews.removeAll()

		var dict1: [String: String] = [:]
		dict1["username"] = "Alan Nickerson"
		dict1["date"] = "25 Sep 2018 "
		dict1["rating"] = "3"
		dict1["like"] = "35"
		dict1["unlike"] = "14"
		dict1["merits"] = "this crop top looks nice and stylist, and design is also good and material is also ok for this prize. fitting is also good."
		dict1["demerits"] = "The stitching is not so good"
		reviews.append(dict1)

		var dict2: [String: String] = [:]
		dict2["username"] = "Brian Elwood"
		dict2["date"] = "04 Mar 2019"
		dict2["rating"] = "5"
		dict2["like"] = "87"
		dict2["unlike"] = "33"
		dict2["merits"] = "It has a unique design and is not too short . I like how it isn't transparent and fits perfectly. Can wear it for parties or even everyday. Fancy sleeves that are cut out well. Good top to buy."
		dict2["demerits"] = "Nice looking but quality is not good"
		reviews.append(dict2)

		var dict3: [String: String] = [:]
		dict3["username"] = "Chris Michael"
		dict3["date"] = "2 Nov 2019"
		dict3["rating"] = "2"
		dict3["like"] = "107"
		dict3["unlike"] = "44"
		dict3["merits"] = "Teenage companion. Living in Lagos, Nigeria in 1971, these were the only real quality shoes you could buy. "
		dict3["demerits"] = "Our \"dessies\" felt right at home when we were in Kenya's Tsavo game park sneaking through the red dust and acquiring"
		reviews.append(dict3)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		let background = UIColor.systemBackground.image(segmentedControl.frame.size)
		let selected = AppColor.Theme.image(segmentedControl.frame.size)

		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
		segmentedControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
		segmentedControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
		segmentedControl.setDividerImage(UIColor.systemBackground.image(), forLeftSegmentState: .normal, rightSegmentState: [.normal, .highlighted, .selected], barMetrics: .default)
		segmentedControl.layer.borderWidth = 1
		segmentedControl.layer.borderColor = AppColor.Theme.cgColor
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

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
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Review2View: UITableViewDataSource {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "Review2Cell1", for: indexPath) as! Review2Cell1
		cell.bindData(data: reviews[indexPath.row])
		cell.buttonLikeCount.addTarget(self, action: #selector(actionLike(_:)), for: .touchUpInside)
		cell.buttonUnlikeCount.addTarget(self, action: #selector(actionUnike(_:)), for: .touchUpInside)
		cell.buttonUnlikeCount.addTarget(self, action: #selector(actionUnike(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Review2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - UIColor
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension UIColor {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

		return UIGraphicsImageRenderer(size: size).image { rendererContext in
			setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}
