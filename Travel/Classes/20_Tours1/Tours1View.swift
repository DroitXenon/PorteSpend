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
class Tours1View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var tours: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Tours"

		navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .done, target: self, action: #selector(actionProfile)), UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .done, target: self, action: #selector(actionWishlist))]

		tableView.register(UINib(nibName: "Tours1Cell", bundle: nil), forCellReuseIdentifier: "Tours1Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		tours.removeAll()

		var dict1: [String: String] = [:]
		dict1["ratings"] = "7.5"
		dict1["name"] = "Ibis Deira City Centre"
		dict1["placecount"] = "2 places"
		dict1["days"] = "4 days"
		dict1["amount"] = "$3499.00"
		tours.append(dict1)

		var dict2: [String: String] = [:]
		dict2["ratings"] = "8.5"
		dict2["name"] = "Millennium Dubai"
		dict2["placecount"] = "3 places"
		dict2["days"] = "5 days"
		dict2["amount"] = "$4099.00"
		tours.append(dict2)

		var dict3: [String: String] = [:]
		dict3["ratings"] = "6.5"
		dict3["name"] = "Ibis Deira City Centre"
		dict3["placecount"] = "1 place"
		dict3["days"] = "2 days"
		dict3["amount"] = "$1499.00"
		tours.append(dict3)

		var dict4: [String: String] = [:]
		dict4["ratings"] = "9.0"
		dict4["name"] = "Millennium Dubai"
		dict4["placecount"] = "5 places"
		dict4["days"] = "9 days"
		dict4["amount"] = "$6099.00"
		tours.append(dict4)

		var dict5: [String: String] = [:]
		dict5["ratings"] = "7.0"
		dict5["name"] = "Ibis Deira City Centre"
		dict5["placecount"] = "2 places"
		dict5["days"] = "4 days"
		dict5["amount"] = "$3499.00"
		tours.append(dict5)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionWishlist() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionProfile() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSortBy(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFilters(_ sender: Any) {

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
extension Tours1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return tours.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return view.frame.size.height / 4.2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Tours1Cell", for: indexPath) as! Tours1Cell
		cell.bindData(index: indexPath.item, data: tours[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Tours1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
