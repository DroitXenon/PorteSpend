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
class Categories1View: UIViewController {

	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var tableView: UITableView!

	private var categories: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Categories"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		tableView.register(UINib(nibName: "Categories1Cell", bundle: Bundle.main), forCellReuseIdentifier: "Categories1Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSubTitle.text = "Every category contains various recipes"

		categories.removeAll()

		var dict1: [String: String] = [:]
		dict1["category"] = "Burger"
		dict1["recipeCount"] = "65"
		categories.append(dict1)

		var dict2: [String: String] = [:]
		dict2["category"] = "Baked Potato"
		dict2["recipeCount"] = "83"
		categories.append(dict2)

		var dict3: [String: String] = [:]
		dict3["category"] = "Casserole"
		dict3["recipeCount"] = "76"
		categories.append(dict3)

		var dict4: [String: String] = [:]
		dict4["category"] = "Chicken salad"
		dict4["recipeCount"] = "87"
		categories.append(dict4)

		var dict5: [String: String] = [:]
		dict5["category"] = "Crumble"
		dict5["recipeCount"] = "38"
		categories.append(dict5)

		var dict6: [String: String] = [:]
		dict6["category"] = "Curry"
		dict6["recipeCount"] = "46"
		categories.append(dict6)

		var dict7: [String: String] = [:]
		dict7["category"] = "Pizza"
		dict7["recipeCount"] = "62"
		categories.append(dict7)

		var dict8: [String: String] = [:]
		dict8["category"] = "Frittata"
		dict8["recipeCount"] = "94"
		categories.append(dict8)

		var dict9: [String: String] = [:]
		dict9["category"] = "Hummus"
		dict9["recipeCount"] = "98"
		categories.append(dict9)

		var dict10: [String: String] = [:]
		dict10["category"] = "Ice cream"
		dict10["recipeCount"] = "93"
		categories.append(dict10)

		var dict11: [String: String] = [:]
		dict11["category"] = "Meatballs"
		dict11["recipeCount"] = "34"
		categories.append(dict11)

		var dict12: [String: String] = [:]
		dict12["category"] = "Noodle"
		dict12["recipeCount"] = "54"
		categories.append(dict12)

		var dict13: [String: String] = [:]
		dict13["category"] = "Omelette"
		dict13["recipeCount"] = "81"
		categories.append(dict13)

		var dict14: [String: String] = [:]
		dict14["category"] = "One-pot"
		dict14["recipeCount"] = "67"
		categories.append(dict14)

		var dict15: [String: String] = [:]
		dict15["category"] = "Chutney"
		dict15["recipeCount"] = "55"
		categories.append(dict15)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return categories.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Categories1Cell", for: indexPath) as! Categories1Cell
		cell.bindData(data: categories[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 80
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}
}
