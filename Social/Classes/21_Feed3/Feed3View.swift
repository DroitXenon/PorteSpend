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
class Feed3View: UIViewController {

	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var tableView: UITableView!

	private var feeds: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		tableView.register(UINib(nibName: "Feed3Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Feed3Cell1")
		tableView.register(UINib(nibName: "Feed3Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Feed3Cell2")
		tableView.register(UINib(nibName: "Feed3Cell3", bundle: Bundle.main), forCellReuseIdentifier: "Feed3Cell3")
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		feeds.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Chris Michael"
		dict1["location"] = "New York, USA"
		dict1["time"] = "2 min ago"
		dict1["content"] = "Life on planet Earth"
		dict1["otherName"] = "Dave Smith"
		dict1["otherCount"] = "3 others"
		dict1["likes"] = "61"
		dict1["comments"] = "417"
		dict1["shares"] = "1"
		feeds.append(dict1)

		var dict2: [String: String] = [:]
		dict2["sharePerson"] = "Fernando Harris"
		dict2["name"] = "Betty Hansen"
		dict2["time"] = "Yesterday at 18:04"
		dict2["content"] = "Without music, life would be a mistake."
		dict2["likes"] = "61"
		dict2["comments"] = "417"
		dict2["shares"] = "1"
		feeds.append(dict2)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionPhotos(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionVideo(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionLocation(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionLike(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionComment(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

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
extension Feed3View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.row == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Feed3Cell1", for: indexPath) as! Feed3Cell1
			cell.buttonPhotos.addTarget(self, action: #selector(actionPhotos(_:)), for: .touchUpInside)
			cell.buttonVideo.addTarget(self, action: #selector(actionVideo(_:)), for: .touchUpInside)
			cell.buttonLocation.addTarget(self, action: #selector(actionLocation(_:)), for: .touchUpInside)
			cell.bindData(index: indexPath.item, data: "What’s new, John?")
			return cell
		}
		if (indexPath.row == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Feed3Cell2", for: indexPath) as! Feed3Cell2
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			cell.buttonlike.addTarget(self, action: #selector(actionLike(_:)), for: .touchUpInside)
			cell.buttonComment.addTarget(self, action: #selector(actionComment(_:)), for: .touchUpInside)
			cell.buttonShare.addTarget(self, action: #selector(actionShare(_:)), for: .touchUpInside)
			cell.bindData(index: indexPath.item, data: feeds[0])
			return cell
		}
		if (indexPath.row == 2) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Feed3Cell3", for: indexPath) as! Feed3Cell3
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			cell.buttonlike.addTarget(self, action: #selector(actionLike(_:)), for: .touchUpInside)
			cell.buttonComment.addTarget(self, action: #selector(actionComment(_:)), for: .touchUpInside)
			cell.buttonShare.addTarget(self, action: #selector(actionShare(_:)), for: .touchUpInside)
			cell.bindData(index: indexPath.item, data: feeds[1])
			return cell
		}
		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Feed3View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
