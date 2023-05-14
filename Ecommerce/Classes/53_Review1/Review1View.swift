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
class Review1View: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var buttonTab1: UIButton!
	@IBOutlet var buttonTab2: UIButton!

	@IBOutlet var viewTab1: UIView!
	@IBOutlet var viewTab2: UIView!

	@IBOutlet var imageRating1: UIImageView!
	@IBOutlet var imageRating2: UIImageView!
	@IBOutlet var imageRating3: UIImageView!
	@IBOutlet var imageRating4: UIImageView!
	@IBOutlet var imageRating5: UIImageView!
	@IBOutlet var labelReviews: UILabel!

	private var reviews: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Reviews"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add a Review", style: .done, target: self, action: #selector(actionAddReview(_:)))

		tableView.register(UINib(nibName: "Review1Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Review1Cell1")
		tableView.estimatedRowHeight = 100

		loadData()
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
		dict1["rating"] = "3"
		dict1["description"] = "This is my fourth pair of Clarks and I have never been disappointed. The look and comfort are well worth the price"
		dict1["username"] = "Alan Nickerson"
		dict1["date"] = "25 Sep 2018 "
		dict1["location"] = "London, UK"
		dict1["like"] = "35"
		dict1["unlike"] = "14"
		reviews.append(dict1)

		var dict2: [String: String] = [:]
		dict2["rating"] = "5"
		dict2["description"] = "Cute but not so comfy. I purchased these for my hubby for Christmas. He wore them a couple of times with very heavy socks."
		dict2["username"] = "Brian Elwood"
		dict2["date"] = "04 Mar 2019"
		dict2["location"] = "Rome, Italy"
		dict2["like"] = "87"
		dict2["unlike"] = "33"
		reviews.append(dict2)

		var dict3: [String: String] = [:]
		dict3["rating"] = "1"
		dict3["description"] = "Great shoes, but they do run a little big. Make sure you put water protector on before going in the rain."
		dict3["username"] = "Chris Michael"
		dict3["date"] = "31 Jul 2019"
		dict3["location"] = "Moscow, Russia"
		dict3["like"] = "48"
		dict3["unlike"] = "4"
		reviews.append(dict3)

		var dict4: [String: String] = [:]
		dict4["rating"] = "4"
		dict4["description"] = "Not able to tell you how happy I am with e commerce. E commerce is worth much more than I paid"
		dict4["username"] = "Dave Smith"
		dict4["date"] = "12 Sep 2019"
		dict4["location"] = "Madrid, Spain"
		dict4["like"] = "15"
		dict4["unlike"] = "67"
		reviews.append(dict4)

		var dict5: [String: String] = [:]
		dict5["rating"] = "2"
		dict5["description"] = "Great job, I will definitely be ordering again! E commerce is exactly what our business has been lacking"
		dict5["username"] = "Egon Pratt"
		dict5["date"] = "2 Nov 2019"
		dict5["location"] = "Paris, France"
		dict5["like"] = "107"
		dict5["unlike"] = "44"
		reviews.append(dict5)

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

		buttonTab1.titleLabel?.textColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.label
		buttonTab2.titleLabel?.textColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.label

		viewTab1.backgroundColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
		viewTab2.backgroundColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAddReview(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab1(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = true
		buttonTab2.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab2(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = true
		updateUI()
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
extension Review1View: UITableViewDataSource {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "Review1Cell1", for: indexPath) as! Review1Cell1
		cell.bindData(data: reviews[indexPath.row])
		cell.buttonLikeCount.addTarget(self, action: #selector(actionLike(_:)), for: .touchUpInside)
		cell.buttonUnlikeCount.addTarget(self, action: #selector(actionUnike(_:)), for: .touchUpInside)
		cell.buttonUnlikeCount.addTarget(self, action: #selector(actionUnike(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Review1View: UITableViewDelegate {

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
