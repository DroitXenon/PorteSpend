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

	private var categories: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Categories"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(actionClose(_:)))
		tableView.register(UINib(nibName: "Categories4Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Categories4Cell1")
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		categories.removeAll()

		var data1: [[String: String]] = []
		var data2: [[String: String]] = []
		var data3: [[String: String]] = []
		var data4: [[String: String]] = []
		var data5: [[String: String]] = []

		var dict1: [String: String] = [:]
		dict1["image"] = "Art"
		dict1["date"] = "22 MAR 2020"
		dict1["title"] = "Europe’s Leaders Ditch Austerity and Fight Pandemic With Cash"
		data1.append(dict1)

		var dict2: [String: String] = [:]
		dict2["image"] = "Art"
		dict2["date"] = "13 MAR 2020"
		dict2["title"] = "‘It’s a Wreck’: 3.3 Million File Jobless Claims as Economy Comes Apart"
		data1.append(dict2)

		var dict3: [String: String] = [:]
		dict3["image"] = "Art"
		dict3["date"] = "10 MAR 2020"
		dict3["title"] = "3.3 Million in U.S. Filed for Unemployment: Live Business Updates"
		data1.append(dict3)

		var dict4: [String: String] = [:]
		dict4["image"] = "Politics"
		dict4["date"] = "18 MAR 2020"
		dict4["title"] = "Senate Approves $2 Trillion Stimulus After Bipartisan Deal"
		data2.append(dict4)

		var dict5: [String: String] = [:]
		dict5["image"] = "Politics"
		dict5["date"] = "10 MAR 2020"
		dict5["title"] = "On Politics: The Bill’s Being Sold. Does It Have the Goods?"
		data2.append(dict5)

		var dict6: [String: String] = [:]
		dict6["image"] = "Technology"
		dict6["date"] = "11 MAR 2020"
		dict6["title"] = "Surging Traffic Is Slowing Down Our Internet"
		data3.append(dict6)

		var dict7: [String: String] = [:]
		dict7["image"] = "Technology"
		dict7["date"] = "03 MAR 2020"
		dict7["title"] = "The Dos and Don’ts of Online Video Meetings"
		data3.append(dict7)

		var dict8: [String: String] = [:]
		dict8["image"] = "Technology"
		dict8["date"] = "18 MAR 2020"
		dict8["title"] = "Lawmakers Question Start-Ups on At-Home Kits for Coronavirus Testing"
		data3.append(dict8)

		var dict9: [String: String] = [:]
		dict9["image"] = "Environment"
		dict9["date"] = "21 MAR 2020"
		dict9["title"] = "Floyd Cardoz, 59, Dies; Gave American Fine Dining an Indian Flavor"
		data4.append(dict9)

		var dict10: [String: String] = [:]
		dict10["image"] = "Environment"
		dict10["date"] = "14 MAR 2020"
		dict10["title"] = "Cocktails, Now to Go"
		data4.append(dict10)

		var dict11: [String: String] = [:]
		dict11["image"] = "Sport"
		dict11["date"] = "20 MAR 2020"
		dict11["title"] = "Why the U.S. Lagged Behind in the Drive to Postpone the Summer Olympics"
		data5.append(dict11)

		var dict12: [String: String] = [:]
		dict12["image"] = "Sport"
		dict12["date"] = "12 MAR 2020"
		dict12["title"] = "How the Yankees’ Minor Leaguers Spent 2 Weeks in Quarantine"
		data5.append(dict12)

		var dataDict1: [String: Any] = [:]
		dataDict1["category"] = "Business"
		dataDict1["news"] = data1
		categories.append(dataDict1)

		var dataDict2: [String: Any] = [:]
		dataDict2["category"] = "Politics"
		dataDict2["news"] = data2
		categories.append(dataDict2)

		var dataDict3: [String: Any] = [:]
		dataDict3["category"] = "Technology"
		dataDict3["news"] = data3
		categories.append(dataDict3)

		var dataDict4: [String: Any] = [:]
		dataDict4["category"] = "Food"
		dataDict4["news"] = data4
		categories.append(dataDict4)

		var dataDict5: [String: Any] = [:]
		dataDict5["category"] = "Sports"
		dataDict5["news"] = data5
		categories.append(dataDict5)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionClose(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFollow(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
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
		cell.bindData(data: categories[indexPath.row])
		cell.buttonFollow.addTarget(self, action: #selector(actionFollow(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories4View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 250
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
