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
class Genres2View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var genres: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Genres"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		tableView.register(UINib(nibName: "Genres2Cell", bundle: Bundle.main), forCellReuseIdentifier: "Genres2Cell")
		tableView.tableFooterView = UIView()

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		genres.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Fantasy"
		dict1["books"] = "421"
		genres.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Adventure"
		dict2["books"] = "1138"
		genres.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Romance"
		dict3["books"] = "872"
		genres.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Mystery"
		dict4["books"] = "124"
		genres.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Horror"
		dict5["books"] = "259"
		genres.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Thriller"
		dict6["books"] = "843"
		genres.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Paranormal"
		dict7["books"] = "566"
		genres.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "Science Fiction"
		dict8["books"] = "704"
		genres.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = " Historical fiction"
		dict9["books"] = "657"
		genres.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Motivational"
		dict10["books"] = "1213"
		genres.append(dict10)

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
extension Genres2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return genres.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Genres2Cell", for: indexPath) as! Genres2Cell
		cell.bindData(index: indexPath.item, data: genres[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Genres2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 70
	}
}
