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
class Categories3View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var categories: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Categories"

		tableView.register(UINib(nibName: "Categories3Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Categories3Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		categories.removeAll()

		var data1: [[String: String]] = []
		var dataDict1: [String: String] = [:]
		dataDict1["image"] = "Shoes"
		dataDict1["title"] = "Rezz Casual Sneaker"
		dataDict1["brand"] = "Tommy Hilfiger"
		dataDict1["price"] = "$54.99"
		dataDict1["originalPrice"] = "$139.50"
		data1.append(dataDict1)

		var dataDict2: [String: String] = [:]
		dataDict2["image"] = "Shoes"
		dataDict2["title"] = "Ward Low Top Sneaker"
		dataDict2["brand"] = "Vans"
		dataDict2["price"] = "$34.00"
		dataDict2["originalPrice"] = ""
		data1.append(dataDict2)

		var dataDict3: [String: String] = [:]
		dataDict3["image"] = "Shoes"
		dataDict3["title"] = "Air Max Motion"
		dataDict3["brand"] = "Nike"
		dataDict3["price"] = "$64.00"
		dataDict3["originalPrice"] = ""
		data1.append(dataDict3)

		var dataDict4: [String: String] = [:]
		dataDict4["image"] = "Shoes"
		dataDict4["title"] = "Trainers"
		dataDict4["brand"] = "H&M"
		dataDict4["price"] = "$59.00"
		dataDict4["originalPrice"] = "$125.00"
		data1.append(dataDict4)

		var dataDict5: [String: String] = [:]
		dataDict5["image"] = "Shoes"
		dataDict5["title"] = "Suede Chukka Boots"
		dataDict5["brand"] = "River Island"
		dataDict5["price"] = "$79.00"
		dataDict5["originalPrice"] = ""
		data1.append(dataDict5)

		var dict1: [String: Any] = [:]
		dict1["name"] = "Shoes"
		dict1["items"] = data1
		categories.append(dict1)

		var data2: [[String: String]] = []
		var dataDict6: [String: String] = [:]
		dataDict6["image"] = "Cosmetics"
		dataDict6["title"] = "Lakme Insta Eye Liner 9 ml"
		dataDict6["brand"] = "Lakme"
		dataDict6["price"] = "$18.00"
		dataDict6["originalPrice"] = ""
		data2.append(dataDict6)

		var dataDict7: [String: String] = [:]
		dataDict7["image"] = "Cosmetics"
		dataDict7["title"] = "Translucent Loose Setting Powder"
		dataDict7["brand"] = "Laura Mercier"
		dataDict7["price"] = "$39.00"
		dataDict7["originalPrice"] = ""
		data2.append(dataDict7)

		var dataDict8: [String: String] = [:]
		dataDict8["image"] = "Cosmetics"
		dataDict8["title"] = "Moisture Rich Foaming Cleanser"
		dataDict8["brand"] = "Estee Lauder"
		dataDict8["price"] = "$29.00"
		dataDict8["originalPrice"] = "$83.00"
		data2.append(dataDict8)

		var dataDict9: [String: String] = [:]
		dataDict9["image"] = "Cosmetics"
		dataDict9["title"] = "Kajal with Liner Magique"
		dataDict9["brand"] = "L'Oreal"
		dataDict9["price"] = "$73.00"
		dataDict9["originalPrice"] = ""
		data2.append(dataDict9)

		var dataDict10: [String: String] = [:]
		dataDict10["image"] = "Cosmetics"
		dataDict10["title"] = "Nars Radiant Creamy Concealer"
		dataDict10["brand"] = "Sephora"
		dataDict10["price"] = "$30.00"
		dataDict10["originalPrice"] = ""
		data2.append(dataDict10)

		var dict2: [String: Any] = [:]
		dict2["name"] = "Accessories"
		dict2["items"] = data2
		categories.append(dict2)

		var data3: [[String: String]] = []
		var dataDict11: [String: String] = [:]
		dataDict11["image"] = "Clothes"
		dataDict11["title"] = "Krista Super Skinny Cropped Jeans"
		dataDict11["brand"] = "HUDSON Jeans"
		dataDict11["price"] = "$49.98"
		dataDict11["originalPrice"] = "$185.00"
		data3.append(dataDict11)

		var dataDict12: [String: String] = [:]
		dataDict12["image"] = "Clothes"
		dataDict12["title"] = "High Rise Skinny Jeans"
		dataDict12["brand"] = "Madewell"
		dataDict12["price"] = "$68.97"
		dataDict12["originalPrice"] = ""
		data3.append(dataDict12)

		var dataDict13: [String: String] = [:]
		dataDict13["image"] = "Clothes"
		dataDict13["title"] = "Katy Boyfriend Jeans"
		dataDict13["brand"] = "KUT from the Kloth"
		dataDict13["price"] = "$89.00"
		dataDict13["originalPrice"] = ""
		data3.append(dataDict13)

		var dataDict14: [String: String] = [:]
		dataDict14["image"] = "Clothes"
		dataDict14["title"] = "Heather High Rise Skinny Jeans"
		dataDict14["brand"] = "Articles of Society"
		dataDict14["price"] = "$25.88"
		dataDict14["originalPrice"] = "$66.00"
		data3.append(dataDict14)

		var dataDict15: [String: String] = [:]
		dataDict15["image"] = "Clothes"
		dataDict15["title"] = "Bombshell High Waist Cutoff Denim Shorts"
		dataDict15["brand"] = "Good American"
		dataDict15["price"] = "$137.00"
		dataDict15["originalPrice"] = ""
		data3.append(dataDict15)

		var dict3: [String: Any] = [:]
		dict3["name"] = "Jeans"
		dict3["items"] = data3
		categories.append(dict3)

		var data4: [[String: String]] = []
		var dataDict16: [String: String] = [:]
		dataDict16["image"] = "Shirts"
		dataDict16["title"] = "Black Regular Fit Printed Casual Shirt"
		dataDict16["brand"] = "Arrow"
		dataDict16["price"] = "$599"
		dataDict16["originalPrice"] = "$1099"
		data4.append(dataDict16)

		var dataDict17: [String: String] = [:]
		dataDict17["image"] = "Shirts"
		dataDict17["title"] = "Blue Full Sleeves Formal Shirt"
		dataDict17["brand"] = "Peter England"
		dataDict17["price"] = "$760"
		dataDict17["originalPrice"] = ""
		data4.append(dataDict17)

		var dataDict18: [String: String] = [:]
		dataDict18["image"] = "Shirts"
		dataDict18["title"] = "Van Heusen Grey Shirt"
		dataDict18["brand"] = "Van Heusen"
		dataDict18["price"] = "$463"
		dataDict18["originalPrice"] = ""
		data4.append(dataDict18)

		var dataDict19: [String: String] = [:]
		dataDict19["image"] = "Shirts"
		dataDict19["title"] = "Black Barocco Track Jacket"
		dataDict19["brand"] = "Versace"
		dataDict19["price"] = "$1500"
		dataDict19["originalPrice"] = "$2100"
		data4.append(dataDict19)

		var dataDict20: [String: String] = [:]
		dataDict20["image"] = "Shirts"
		dataDict20["title"] = "Permapress White Shirt"
		dataDict20["brand"] = "Louis Phillipe"
		dataDict20["price"] = "$999"
		dataDict20["originalPrice"] = ""
		data4.append(dataDict20)

		var dict4: [String: Any] = [:]
		dict4["name"] = "Shirts"
		dict4["items"] = data4
		categories.append(dict4)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSeeAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories3View: UITableViewDataSource {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "Categories3Cell1", for: indexPath) as! Categories3Cell1
		cell.bindData(data: categories[indexPath.row])
		cell.buttonSeeAll.tag = indexPath.row
		cell.buttonSeeAll.addTarget(self, action: #selector(actionSeeAll(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories3View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 300
	}
}
