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
class RecipesList4View: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var viewSortBy: UIView!
	@IBOutlet var viewFilters: UIView!

	private var recipes: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Recipes"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(actionSearch(_:)))

		viewSortBy.layer.borderWidth = 1
		viewSortBy.layer.borderColor = AppColor.Border.cgColor

		viewFilters.layer.borderWidth = 1
		viewFilters.layer.borderColor = AppColor.Border.cgColor

		tableView.register(UINib(nibName: "RecipesList4Cell", bundle: Bundle.main), forCellReuseIdentifier: "RecipesList4Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		recipes.removeAll()

		var dict1: [String: String] = [:]
		dict1["rate"] = "4.0"
		dict1["name"] = "Algernon Gaudin"
		dict1["foodName"] = "Oven-Fried Ranch Chicken"
		dict1["duration"] = "30 min"
		dict1["people"] = "12"
		recipes.append(dict1)

		var dict2: [String: String] = [:]
		dict2["rate"] = "2.4"
		dict2["name"] = "Jamie Stille"
		dict2["foodName"] = "Garlic Cheese Bread Sticks"
		dict2["duration"] = "25 min"
		dict2["people"] = "65"
		recipes.append(dict2)

		var dict3: [String: String] = [:]
		dict3["rate"] = "3.1"
		dict3["name"] = "Kippy Waltering"
		dict3["foodName"] = "Asian prawn & quinoa salad"
		dict3["duration"] = "1h 15 min"
		dict3["people"] = "22"
		recipes.append(dict3)

		var dict4: [String: String] = [:]
		dict4["rate"] = "1.2"
		dict4["name"] = "Korrie Sumers"
		dict4["foodName"] = "Easy gooseberry cobbler"
		dict4["duration"] = "40 min"
		dict4["people"] = "63"
		recipes.append(dict4)

		var dict5: [String: String] = [:]
		dict5["rate"] = "3.4"
		dict5["name"] = "Dido Andryszczak"
		dict5["foodName"] = "Chickpea & roasted parsnip curry"
		dict5["duration"] = "30 min"
		dict5["people"] = "51"
		recipes.append(dict5)

		var dict6: [String: String] = [:]
		dict6["rate"] = "1.6"
		dict6["name"] = "Mariette Woodhall"
		dict6["foodName"] = "Spicy root & lentil casserole"
		dict6["duration"] = "25 min"
		dict6["people"] = "65"
		recipes.append(dict6)

		var dict7: [String: String] = [:]
		dict7["rate"] = "4.0"
		dict7["name"] = "Edlin Barendtsen"
		dict7["foodName"] = "Easiest ever vegan gravy"
		dict7["duration"] = "1h 5 min"
		dict7["people"] = "24"
		recipes.append(dict7)

		var dict8: [String: String] = [:]
		dict8["rate"] = "1.9"
		dict8["name"] = "Ame Ketton"
		dict8["foodName"] = "Shakshuka flatbread bake"
		dict8["duration"] = "1h 40 min"
		dict8["people"] = "28"
		recipes.append(dict8)

		var dict9: [String: String] = [:]
		dict9["rate"] = "1.5"
		dict9["name"] = "Ricki Paddington"
		dict9["foodName"] = "Easy risotto with bacon & peas"
		dict9["duration"] = "45 min"
		dict9["people"] = "49"
		recipes.append(dict9)

		var dict10: [String: String] = [:]
		dict10["rate"] = "4.9"
		dict10["name"] = "Marianne Krysztowczyk"
		dict10["foodName"] = "Easy ratatouille with poached eggs"
		dict10["duration"] = "32 min"
		dict10["people"] = "16"
		recipes.append(dict10)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSearch(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSortBy(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFilter(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFavorite(_ sender: UIButton) {

		print(#function)
		sender.isSelected = !sender.isSelected
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RecipesList4View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return recipes.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesList4Cell", for: indexPath) as! RecipesList4Cell
		cell.bindData(index: indexPath, data: recipes[indexPath.row])
		cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RecipesList4View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 125
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
	}
}
