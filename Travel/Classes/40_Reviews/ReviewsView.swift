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

	@IBOutlet var labelRatings: UILabel!
	@IBOutlet var labelRatingHotelCount: UILabel!
	@IBOutlet var labelCleanlinessRate: UILabel!
	@IBOutlet var progressViewCleanliness: UIProgressView!
	@IBOutlet var labelComfortRate: UILabel!
	@IBOutlet var progressViewComfort: UIProgressView!
	@IBOutlet var labelLocationRate: UILabel!
	@IBOutlet var progressViewLocation: UIProgressView!
	@IBOutlet var labelFacilitiesRate: UILabel!
	@IBOutlet var progressViewFacilities: UIProgressView!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var constraintsTableViewHeight: NSLayoutConstraint!

	private var reviews: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Reviews"

		tableView.register(UINib(nibName: "ReviewsCell", bundle: nil), forCellReuseIdentifier: "ReviewsCell")
		tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)

		loadData()
	}

	// MARK: - observeValue methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

		if let obj = object as? UITableView {
			if obj == self.tableView && keyPath == "contentSize" {
				if let newSize = change?[NSKeyValueChangeKey.newKey] as? CGSize {
					self.constraintsTableViewHeight.constant = newSize.height
				}
			}
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelRatings.text = "8.5"
		labelRatingHotelCount.text = "Based on\n646 hotel reviews"
		labelCleanlinessRate.text = "9.3"
		progressViewCleanliness.progress = 9.3/10
		labelComfortRate.text = "8.7"
		progressViewComfort.progress = 8.7/10
		labelLocationRate.text = "7.0"
		progressViewLocation.progress = 7.0/10
		labelFacilitiesRate.text = "9.0"
		progressViewFacilities.progress = 9.0/10

		reviews.removeAll()

		var dict1: [String: String] = [:]
		dict1["username"] = "Alan Nickerson"
		dict1["areaDate"] = "New York, USA • 16 Oct 2016"
		dict1["rating"] = "9.1"
		dict1["review"] = "We love this place we will come back again for sure"
		dict1["advantages"] = "The views from the hotel room and Sky Bar where breath taking. The room was very comfortable and when I couldn't go to breakfast they gave me a breakfast box to go. The spa was amazing and the staff was nice."
		dict1["disadvantages"] = "The concierge was rude and gave me attitude when I asked for information. I didn't find them helpful at all."
		reviews.append(dict1)
		reviews.append(dict1)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeHotelRating(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddRating(_ sender: Any) {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ReviewsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return reviews.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsCell", for: indexPath) as! ReviewsCell
		cell.bindData(review: reviews[indexPath.row])
		return cell
	}
}
