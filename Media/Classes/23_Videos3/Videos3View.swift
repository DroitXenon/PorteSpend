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
class Videos3View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var videos: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Category"

		tableView.register(UINib(nibName: "Videos3Cell", bundle: nil), forCellReuseIdentifier: "Videos3Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		videos.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "AC/DC - Thunderstruck (Official Video)"
		dict1["views"] = "466M views · 5 years ago"
		dict1["type"] = "AC/DC Official"
		videos.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Evanescence - My Immortal)"
		dict2["views"] = "510M views · 8 years ago"
		dict2["type"] = "Evanescence"
		videos.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Call Me - Shinedown Lyrics"
		dict3["views"] = "466M views · 5 years ago"
		dict3["type"] = "AC/DC Official"
		videos.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Shinedown - 45 (Official Music Video)"
		dict4["views"] = "510M views · 8 years ago"
		dict4["type"] = "Evanescence"
		videos.append(dict4)

		videos.append(dict1)
		videos.append(dict2)
		videos.append(dict3)
		videos.append(dict4)

		refreshTableView()
	}

	// MARK: - User actions
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
extension Videos3View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return videos.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 120
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Videos3Cell", for: indexPath) as! Videos3Cell
		cell.bindData(index: indexPath.item + 15, data: videos[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Videos3View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
