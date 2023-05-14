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
class Items3View: UIViewController {

	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var viewSortBy: UIView!
	@IBOutlet var viewFilters: UIView!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Polo Shirts"
		labelSubTitle.text = "617 items"

		viewSortBy.layer.borderWidth = 1
		viewSortBy.layer.borderColor = AppColor.Border.cgColor

		viewFilters.layer.borderWidth = 1
		viewFilters.layer.borderColor = AppColor.Border.cgColor

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		tableView.register(UINib(nibName: "Items3Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Items3Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Black Regular Fit Printed Casual Shirt"
		dict1["brand"] = "Arrow"
		dict1["price"] = "$599"
		dict1["originalPrice"] = "$1099"
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Blue Full Sleeves Formal Shirt"
		dict2["brand"] = "Peter England"
		dict2["price"] = "$760"
		dict2["originalPrice"] = ""
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Van Heusen Grey Shirt"
		dict3["brand"] = "Van Heusen"
		dict3["price"] = "$463"
		dict3["originalPrice"] = ""
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Black Barocco Track Jacket"
		dict4["brand"] = "Versace"
		dict4["price"] = "$1500"
		dict4["originalPrice"] = "$2100"
		products.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Permapress White Shirt"
		dict5["brand"] = "Louis Phillipe"
		dict5["price"] = "$999"
		dict5["originalPrice"] = ""
		products.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Regular fit Casual Shirt"
		dict6["brand"] = "Red Tape"
		dict6["price"] = "$799"
		dict6["originalPrice"] = ""
		products.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Slim fit Casual Shirt"
		dict7["brand"] = "KILLER"
		dict7["price"] = "$879"
		dict7["originalPrice"] = "$1250"
		products.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "Full Sleeve Casual Shirt"
		dict8["brand"] = "Campus Sutra"
		dict8["price"] = "$780"
		dict8["originalPrice"] = ""
		products.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = "Geometric Print Regular Fit Shirt"
		dict9["brand"] = "Jack & Jones"
		dict9["price"] = "$874"
		dict9["originalPrice"] = ""
		products.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Checkered Slim fit Shirt"
		dict10["brand"] = "Indian Terrain"
		dict10["price"] = "$1209"
		dict10["originalPrice"] = ""
		products.append(dict10)

		var dict11: [String: String] = [:]
		dict11["title"] = "Solid Regular Fit Casual Shirt"
		dict11["brand"] = "US Polo"
		dict11["price"] = "$1299"
		dict11["originalPrice"] = "$2500"
		products.append(dict11)

		var dict12: [String: String] = [:]
		dict12["title"] = "Printed Slim Fit Casual Shirt"
		dict12["brand"] = "Spykar"
		dict12["price"] = "$599"
		dict12["originalPrice"] = "$1020"
		products.append(dict12)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSortBy(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFilter(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items3View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return products.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Items3Cell1", for: indexPath) as! Items3Cell1
		cell.bindData(index: indexPath.row, data: products[indexPath.row])
		cell.buttonMore.tag = indexPath.row
		cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items3View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 80
	}
}
