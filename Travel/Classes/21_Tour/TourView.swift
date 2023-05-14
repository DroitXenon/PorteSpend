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
class TourView: UIViewController {

	@IBOutlet var imageViewTour: UIImageView!
	@IBOutlet var labelTourName: UILabel!
	@IBOutlet var labelPlacesCount: UILabel!
	@IBOutlet var labelDays: UILabel!
	@IBOutlet var labelAmount: UILabel!
	@IBOutlet var buttonLikeDislike: UIButton!
	@IBOutlet var labelRatings: UILabel!
	@IBOutlet var labelReviews: UILabel!
	@IBOutlet var tableView1: UITableView!
	@IBOutlet var constraintTableView1Height: NSLayoutConstraint!
	@IBOutlet var tableView2: UITableView!
	@IBOutlet var constraintTableView2Height: NSLayoutConstraint!

	private var navigationBackgroundImage: UIImage?
	private var data1: [[String: String]] = []
	private var data2: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Costa Rica Tours"

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: setupBuyButton())

		tableView1.register(UINib(nibName: "TourCell1", bundle: nil), forCellReuseIdentifier: "TourCell1")
		tableView2.register(UINib(nibName: "TourCell2", bundle: nil), forCellReuseIdentifier: "TourCell2")

		tableView1.tableFooterView = UIView()

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintTableView1Height.constant = tableView1.contentSize.height - 1
		constraintTableView2Height.constant = tableView2.contentSize.height
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewTour.sample("Travel", "CarTrip", 28)
		labelTourName.text = "Central American Journey"
		labelPlacesCount.text = "2 places"
		labelDays.text = "4 days"
		labelAmount.text = "$3499.00"
		labelRatings.text = "7.5"
		labelReviews.text = "78 reviews"

		data1.removeAll()
		data2.removeAll()

		var dict1: [String: String] = [:]
		dict1["title1"] = "TRIP TYPE"
		dict1["title2"] = "Small Group"
		data1.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title1"] = "DEPARTURE / RETURN"
		dict2["title2"] = "Playa del Carmen - San José"
		data1.append(dict2)

		var dict3: [String: String] = [:]
		dict3["day"] = "1 DAY"
		dict3["title"] = "Playa del Carmen"
		dict3["description"] = "Check into our hotel and enjoy the city. Additional Notes: Shuttles and buses from the Cancún airport are easy to find and reasonably priced."
		data2.append(dict3)

		var dict4: [String: String] = [:]
		dict4["day"] = "2-3 DAYS"
		dict4["title"] = "Playa del Carmen"
		dict4["description"] = "Check into our hotel and enjoy the city. Additional Notes: Shuttles and buses from the Cancún airport are easy to find and reasonably priced."
		data2.append(dict4)

		var dict5: [String: String] = [:]
		dict5["day"] = "4 DAY"
		dict5["title"] = "Playa del Carmen"
		dict5["description"] = "Check into our hotel and enjoy the city. Additional Notes: Shuttles and buses from the Cancún airport are easy to find and reasonably priced."
		data2.append(dict5)

		refreshTableView1()
		refreshTableView2()
	}

	// MARK: - Navigation methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setupBuyButton() -> UIButton {

		let button = UIButton()
		button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
		button.setTitle("BUY", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
		button.backgroundColor = AppColor.Theme
		button.sizeToFit()
		button.cornerRadius = button.frame.size.height / 2
		button.addTarget(self, action: #selector(actionBuy), for: .touchUpInside)
		return button
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionBuy() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLikeDislike(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReviews(_ sender: Any) {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView1() {

		tableView1.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView2() {

		tableView2.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension TourView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if tableView == tableView1 { return data1.count }
		if tableView == tableView2 { return data2.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if tableView == tableView1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "TourCell1", for: indexPath) as! TourCell1
			cell.bindData(data: data1[indexPath.row])
			return cell
		}
		if tableView == tableView2 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "TourCell2", for: indexPath) as! TourCell2
			cell.bindData(data: data2[indexPath.row])
			return cell
		}
		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension TourView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
