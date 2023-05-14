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
class FriendsList2View: UIViewController {

	@IBOutlet var viewAdd: UIView!
	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var viewHeader: UIView!

	private var inviteFriends: [[String: String]] = []
	private var contacts: [[String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Contacts"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewAdd)

		tableView.register(UINib(nibName: "FriendsList2Cell1", bundle: Bundle.main), forCellReuseIdentifier: "FriendsList2Cell1")
		tableView.register(UINib(nibName: "FriendsList2Cell2", bundle: Bundle.main), forCellReuseIdentifier: "FriendsList2Cell2")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		contacts = [["Amy Roberts", "Alan Nickerson", "Alan Roberts"], ["Chloe Adams", "Chris Michael", "Chloe Michael"], ["Doris Royston", "Dave Smith"], ["Emma Harris", "Egon Pratt"]]

		inviteFriends.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Chloe Adams"
		dict1["status"] = "Online"
		inviteFriends.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Emma Harris"
		dict2["status"] = "Online"
		inviteFriends.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Betty Hansen"
		dict3["status"] = "Last seen 1 minute ago"
		inviteFriends.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Egon Pratt"
		dict4["status"] = "Last seen 5 minutes ago"
		inviteFriends.append(dict4)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAdd(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionInvite(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionInviteFriend(_ sender: UIButton) {

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
extension FriendsList2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return contacts.count+1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return inviteFriends.count }
		return contacts[section-1].count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsList2Cell1", for: indexPath) as! FriendsList2Cell1
			cell.bindData(index: indexPath.item, data: inviteFriends[indexPath.row])
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsList2Cell2", for: indexPath) as! FriendsList2Cell2
			cell.bindData(index: indexPath.item + (indexPath.section * 3), name: contacts[indexPath.section-1][indexPath.row])
			cell.buttonInvite.addTarget(self, action: #selector(actionInvite(_:)), for: .touchUpInside)
			return cell
		}
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FriendsList2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 70 }
		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 45 }
		return 30
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return nil }
		if let firstLetter = contacts[section-1].first?.first {
			return String(firstLetter).capitalized
		}
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		if (section == 0) { return viewHeader }
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			if (section != 0) {
				header.contentView.backgroundColor = .tertiarySystemFill
			}
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 0.01
	}
}
