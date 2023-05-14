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
class Categories4View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var categories: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Categories"

		tableView.register(UINib(nibName: "Categories4Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Categories4Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		categories.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Shoes"
		dict1["items"] = "812"
		categories.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Sneakers"
		dict2["items"] = "1.4K"
		categories.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Jeans"
		dict3["items"] = "91.9K"
		categories.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Accessories"
		dict4["items"] = "12.3K"
		categories.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Casual Trousers"
		dict5["items"] = "996"
		categories.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Shorts"
		dict6["items"] = "2.5K"
		categories.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Track Pants"
		dict7["items"] = "17K"
		categories.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Jackets"
		dict8["items"] = "20K"
		categories.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Blazers"
		dict9["items"] = "915"
		categories.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "Socks"
		dict10["items"] = "75.1K"
		categories.append(dict10)

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
extension Categories4View: UITableViewDataSource {

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

		let cell = tableView.dequeueReusableCell(withIdentifier: "Categories4Cell1", for: indexPath) as! Categories4Cell1
		cell.bindData(index: indexPath, data: categories[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories4View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 150
	}
}
