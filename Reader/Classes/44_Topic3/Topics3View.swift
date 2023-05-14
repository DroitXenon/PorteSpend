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
class Topics3View: UIViewController {

	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var tableView: UITableView!

	private var topics: [[String: String]] = []
	private var indexPaths: Set<IndexPath> = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Topics"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		tableView.register(UINib(nibName: "Topics3Cell", bundle: Bundle.main), forCellReuseIdentifier: "Topics3Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSubTitle.text = "Subscribe to topics of interest to surface "

		topics.removeAll()

		var dict1: [String: String] = [:]
		dict1["topic1"] = "Politics"
		dict1["topic2"] = "737 reading about this"
		topics.append(dict1)

		var dict2: [String: String] = [:]
		dict2["topic1"] = "Business"
		dict2["topic2"] = "561 reading about this"
		topics.append(dict2)

		var dict3: [String: String] = [:]
		dict3["topic1"] = "Opinion"
		dict3["topic2"] = "906 reading about this"
		topics.append(dict3)

		var dict4: [String: String] = [:]
		dict4["topic1"] = "Tech"
		dict4["topic2"] = "439 reading about this"
		topics.append(dict4)

		var dict5: [String: String] = [:]
		dict5["topic1"] = "Science"
		dict5["topic2"] = "557 reading about this"
		topics.append(dict5)

		var dict6: [String: String] = [:]
		dict6["topic1"] = "Health"
		dict6["topic2"] = "547 reading about this"
		topics.append(dict6)

		var dict7: [String: String] = [:]
		dict7["topic1"] = "Sports"
		dict7["topic2"] = "233 reading about this"
		topics.append(dict7)

		var dict8: [String: String] = [:]
		dict8["topic1"] = "Arts"
		dict8["topic2"] = "165 reading about this"
		topics.append(dict8)

		var dict9: [String: String] = [:]
		dict9["topic1"] = "Books"
		dict9["topic2"] = "349 reading about this"
		topics.append(dict9)

		var dict10: [String: String] = [:]
		dict10["topic1"] = "Style"
		dict10["topic2"] = "522 reading about this"
		topics.append(dict10)

		var dict11: [String: String] = [:]
		dict11["topic1"] = "Food"
		dict11["topic2"] = "271 reading about this"
		topics.append(dict11)

		var dict12: [String: String] = [:]
		dict12["topic1"] = "Travel"
		dict12["topic2"] = "124 reading about this"
		topics.append(dict12)

		var dict13: [String: String] = [:]
		dict13["topic1"] = "Real Estate"
		dict13["topic2"] = "586 reading about this"
		topics.append(dict13)

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
extension Topics3View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return topics.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Topics3Cell", for: indexPath) as! Topics3Cell
		cell.bindData(index: indexPath.item, data: topics[indexPath.row])
		cell.accessoryType = (indexPaths.contains(indexPath)) ? .checkmark : .none
		cell.tintColor = AppColor.Theme

		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Topics3View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 75
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if (indexPaths.contains(indexPath)) {
			indexPaths.remove(indexPath)
		} else {
			indexPaths.insert(indexPath)
		}
		tableView.reloadRows(at: [indexPath], with: .none)
	}
}
