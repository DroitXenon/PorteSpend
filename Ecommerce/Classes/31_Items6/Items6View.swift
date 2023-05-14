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
class Items6View: UIViewController {

	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var viewSortBy: UIView!
	@IBOutlet var viewFilters: UIView!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Sneakers"
		labelSubTitle.text = "981 items"

		viewSortBy.layer.borderWidth = 1
		viewSortBy.layer.borderColor = AppColor.Border.cgColor

		viewFilters.layer.borderWidth = 1
		viewFilters.layer.borderColor = AppColor.Border.cgColor

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		tableView.register(UINib(nibName: "Items6Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Items6Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Rick Point NU IDP Sneakers"
		dict1["brand"] = "Puma"
		dict1["price"] = "$599"
		dict1["originalPrice"] = "$1099"
		dict1["rating"] = "3"
		dict1["review"] = "10"
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Unisex's Bari Sneakers"
		dict2["brand"] = "Sparx"
		dict2["price"] = "$760"
		dict2["originalPrice"] = ""
		dict2["rating"] = "4"
		dict2["review"] = "25"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "K11 Speed Laces Sneakers"
		dict3["brand"] = "Mactree"
		dict3["price"] = "$463"
		dict3["originalPrice"] = ""
		dict3["rating"] = "5"
		dict3["review"] = "28"
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Men's Multi-Coloured Canvas"
		dict4["brand"] = "Camfoot"
		dict4["price"] = "$1500"
		dict4["originalPrice"] = "$2100"
		dict4["rating"] = "1"
		dict4["review"] = "75"
		products.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Mesh Casual Sneakers"
		dict5["brand"] = "Bucik"
		dict5["price"] = "$999"
		dict5["originalPrice"] = ""
		dict5["rating"] = "5"
		dict5["review"] = "108"
		products.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Canvas Sneakers Casual Shoes"
		dict6["brand"] = "Fausto"
		dict6["price"] = "$799"
		dict6["originalPrice"] = ""
		dict6["rating"] = "3"
		dict6["review"] = "12"
		products.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Quilted PU Leather Oxford"
		dict7["brand"] = "Bacca Bucci"
		dict7["price"] = "$879"
		dict7["originalPrice"] = "$1250"
		dict7["rating"] = "1"
		dict7["review"] = "81"
		products.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "High Top Synthetic Sneaker Shoes"
		dict8["brand"] = "Appett"
		dict8["price"] = "$780"
		dict8["originalPrice"] = ""
		dict8["rating"] = "4"
		dict8["review"] = "96"
		products.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = "Airsocks Men's Knitted Socks Sneakers"
		dict9["brand"] = "Plufra"
		dict9["price"] = "$1299"
		dict9["originalPrice"] = "2500"
		dict9["rating"] = "2"
		dict9["review"] = "103"
		products.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Women's Casual Slip On Sneakers"
		dict10["brand"] = "Lil Firestar"
		dict10["price"] = "$1209"
		dict10["originalPrice"] = ""
		dict10["rating"] = "5"
		dict10["review"] = "481"
		products.append(dict10)

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
extension Items6View: UITableViewDataSource {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "Items6Cell1", for: indexPath) as! Items6Cell1
		cell.bindData(index: indexPath, data: products[indexPath.row])
		cell.buttonMore.tag = indexPath.row
		cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items6View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 110
	}
}
