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
class FindFriends2View: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var cellTwitter: UITableViewCell!
	@IBOutlet var cellFacebook: UITableViewCell!
	@IBOutlet var cellContacts: UITableViewCell!

	private var headers: [String] = []
	private var suggested: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Find Friends"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))

		tableView.register(UINib(nibName: "FindFriends2Cell", bundle: Bundle.main), forCellReuseIdentifier: "FindFriends2Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		headers = ["Connect Account", "Suggested"]

		suggested.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Brian Elwood"
		dict1["userid"] = "@brian.elwood"
		suggested.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Amy Roberts"
		dict2["userid"] = "@amy.roberts"
		suggested.append(dict2)

		suggested.append(dict1)
		suggested.append(dict2)
		suggested.append(dict1)
		suggested.append(dict2)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionRemove(_ sender: UIButton) {

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
extension FindFriends2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return headers.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 3 }

		return suggested.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


		if (indexPath.section == 0) && (indexPath.row == 0) { return cellTwitter }
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellFacebook }
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellContacts }

		if (indexPath.section == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "FindFriends2Cell", for: indexPath) as! FindFriends2Cell
			cell.buttonAdd.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
			cell.buttonRemove.addTarget(self, action: #selector(actionRemove(_:)), for: .touchUpInside)
			cell.bindData(index: indexPath.item, data: suggested[indexPath.row])
			return cell
		}
		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FindFriends2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 45 }
		return 70
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 50
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return headers[section]
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			let viewY = header.frame.size.height - 0.5
			let view = UIView(frame: CGRect(x: 0, y: viewY, width: header.frame.size.width, height: 0.5))
			view.backgroundColor = .tertiarySystemFill
			view.tag = 1001
			header.contentView.subviews.forEach { (view) in
				if (view.tag == 1001) {
					view.removeFromSuperview()
				}
			}
			header.contentView.addSubview(view)
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 10
	}
}
