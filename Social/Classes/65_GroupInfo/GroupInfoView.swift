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
class GroupInfoView: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellInfo: UITableViewCell!
	@IBOutlet var cellSharedMedia: UITableViewCell!
	@IBOutlet var cellNotifications: UITableViewCell!
	@IBOutlet var cellAddNewMember: UITableViewCell!

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelOnlineMember: UILabel!
	@IBOutlet var switchNotifications: UISwitch!

	private var members: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Group Info"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(actionEdit(_:)))

		tableView.register(UINib(nibName: "GroupInfoCell", bundle: Bundle.main), forCellReuseIdentifier: "GroupInfoCell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Work", 23)
		labelName.text = "App Design Kit"
		labelOnlineMember.text = "2 members online"

		members.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Egon Pratt"
		dict1["status"] = "Online"
		members.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Chris Michael"
		dict2["status"] = "Last seen 1 minute ago"
		members.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Fernando Harris"
		dict3["status"] = "Last seen 1 hour ago"
		members.append(dict3)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionEdit(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSetPhoto(_ sender: UIButton) {

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
extension GroupInfoView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 1 }
		if (section == 1) { return 2 }
		if (section == 2) { return members.count+1 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellInfo			}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellSharedMedia	}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellNotifications	}

		if (indexPath.section == 2) && (indexPath.row == 0) { return cellAddNewMember	}
		if (indexPath.section == 2) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "GroupInfoCell", for: indexPath) as! GroupInfoCell
			cell.bindData(index: indexPath.item, data: members[indexPath.row-1])
			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension GroupInfoView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

		cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) && (indexPath.row == 0) { return 135	}
		if (indexPath.section == 1) && (indexPath.row == 0) { return 45		}
		if (indexPath.section == 1) && (indexPath.row == 1) { return 45		}
		if (indexPath.section == 2) && (indexPath.row == 0) { return 45		}
		return 70
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 0.01	}
		if (section == 1) { return 10	}
		if (section == 2) { return 55	}
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return ""	}
		if (section == 1) { return "" 	}
		if (section == 2) { return "\(members.count) Members"	}
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
			if (section == 1) {
				header.contentView.backgroundColor = .tertiarySystemFill
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 0.01
	}
}
