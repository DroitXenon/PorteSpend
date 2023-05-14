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
class Posts11View: UIViewController {

	@IBOutlet var tableView: UITableView!
	private var news: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "News"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))

		tableView.register(UINib(nibName: "Posts11Cell", bundle: Bundle.main), forCellReuseIdentifier: "Posts11Cell")
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		news.removeAll()

		var dict1: [String: String] = [:]
		dict1["date"] = "08 MAR 2020"
		dict1["title"] = "What Made New York So Hospitable for Coronavirus?"
		dict1["author"] = "Fox News"
		news.append(dict1)

		var dict2: [String: String] = [:]
		dict2["date"] = "20 MAR 2020"
		dict2["title"] = "Last known survivor of transatlantic slave trade identified"
		dict2["author"] = "BBC News"
		news.append(dict2)

		var dict3: [String: String] = [:]
		dict3["date"] = "19 MAR 2020"
		dict3["title"] = "White House coordinator: My grandmother had to live with this for 88 years"
		dict3["author"] = "The Atlantic"
		news.append(dict3)

		var dict4: [String: String] = [:]
		dict4["date"] = "09 MAR 2020"
		dict4["title"] = "Idris Elba hits back at claims he is lying about coronavirus"
		dict4["author"] = "Washington Examiner"
		news.append(dict4)

		var dict5: [String: String] = [:]
		dict5["date"] = "12 MAR 2020"
		dict5["title"] = "Questions arise after teen's death was initially linked to coronavirus in California"
		dict5["author"] = "Us Weekly"
		news.append(dict5)

		var dict6: [String: String] = [:]
		dict6["date"] = "09 MAR 2020"
		dict6["title"] = "Video reveals lung damage in US coronavirus patient: 'People need to take this seriously'"
		dict6["author"] = "New York Times"
		news.append(dict6)

		var dict7: [String: String] = [:]
		dict7["date"] = "08 MAR 2020"
		dict7["title"] = "In a world consumer by fear, marble racing proves welcome distraction"
		dict7["author"] = "Fox News"
		news.append(dict7)

		var dict8: [String: String] = [:]
		dict8["date"] = "10 MAR 2020"
		dict8["title"] = "Instacart plans to hire 300,000 more workers as demand surges for grocery deliveries"
		dict8["author"] = "Fortune"
		news.append(dict8)

		var dict9: [String: String] = [:]
		dict9["date"] = "04 MAR 2020"
		dict9["title"] = "We’re in Disaster Mode’: Courage Inside a Brooklyn Hospital"
		dict9["author"] = "The New Yorker"
		news.append(dict9)

		var dict10: [String: String] = [:]
		dict10["date"] = "20 MAR 2020"
		dict10["title"] = "Europe’s Leaders Ditch Austerity and Fight Pandemic With Cash"
		dict10["author"] = "Us Weekly"
		news.append(dict10)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Posts11View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return news.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Posts11Cell", for: indexPath) as! Posts11Cell
		cell.bindData(index: indexPath, data: news[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Posts11View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
