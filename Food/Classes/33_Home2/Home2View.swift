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
class Home2View: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var buttonProfile: UIButton!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var viewHeader: UIView!
	@IBOutlet var imageRestaurant: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelFoodName: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var buttonShowAll: UIButton!

	private var restaurants: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		tableView.register(UINib(nibName: "Home2Cell", bundle: Bundle.main), forCellReuseIdentifier: "Home2Cell")

		buttonShowAll.layer.borderWidth = 1
		buttonShowAll.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Restaurants"
		labelSubTitle.text = "New York, USA"
		imageViewProfile.sample("Food", "Vegan", 5)
		labelName.text = "The Colony Grill Room"
		labelDescription.text = "They are grilling celebrities in their own right. You’ve seen them on TV and you see their cookbooks lined along the shelves."
		imageRestaurant.sample("Food", "Pasta", 8)
		labelName.text = "TRENDING"
		labelFoodName.text = "Child-Friendly Restaurants"
		labelDescription.text = "Explore tried & tested kids' menus, and book dining spots fit for pint-sized people."

		restaurants.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Heirloom Cafe"
		dict1["info"] = "77 Prairieview Drive"
		dict1["rate"] = "2.6"
		dict1["distance"] = "3.3"
		restaurants.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Planet of the Grapes"
		dict2["info"] = "4 Oak Valley Terrace"
		dict2["rate"] = "3.3"
		dict2["distance"] = "4.0"
		restaurants.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Montana Restaurant"
		dict3["info"] = "8 Summerview Pass"
		dict3["rate"] = "4.7"
		dict3["distance"] = "6.0"
		restaurants.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "California Pizza Kitchen"
		dict4["info"] = "5 Hazelcrest Plaza"
		dict4["rate"] = "3.8"
		dict4["distance"] = "3.6"
		restaurants.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Mama's Fish House"
		dict5["info"] = "52542 Moulton Junction"
		dict5["rate"] = "4.3"
		dict5["distance"] = "5.1"
		restaurants.append(dict5)
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllTopRated(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFavorite(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return restaurants.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Home2Cell", for: indexPath) as! Home2Cell
		cell.bindData(index: indexPath.item, data: restaurants[indexPath.row])
		cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 110
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 370
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
