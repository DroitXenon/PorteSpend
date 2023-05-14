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
class CreateGroupView: UIViewController {

	@IBOutlet var iamgeProfile: UIImageView!
	@IBOutlet var textFieldGroupName: UITextField!
	@IBOutlet var labelMembersName: UILabel!
	@IBOutlet var layoutConstraintLabelMembersNameHeight: NSLayoutConstraint!
	@IBOutlet var tableView: UITableView!

	private var sections: [String] = []
	private var sectionIndex: [String] = []
	private var contacts: [[String]] = []
	private var status: [[String]] = []
	private var indexPaths: Set<IndexPath> = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Create Group"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(actionCancel(_:)))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(actionDone(_:)))

		tableView.register(UINib(nibName: "CreateGroupCell", bundle: Bundle.main), forCellReuseIdentifier: "CreateGroupCell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldGroupName.attributedPlaceholder = NSAttributedString(string: "Group Name", attributes: attribute)

		sectionIndex = ["#", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
		contacts = [["Amy Roberts", "Alan Nickerson"], ["Betty Hansen", "Brian Elwood"], ["Chloe Adams", "Chris Michael"], ["Doris Royston", "Dave Smith"], ["Emma Harris", "Egon Pratt"], ["Fabia Smith", "Fernando Harris"]]
		status = [["Online", "Last seen 1 minute ago"], ["Last seen 1 minute ago", "Online"], ["Last seen 1 minute ago", "Online"], ["Last seen 1 minute ago", "Online"], ["Last seen 1 minute ago", "Online"], ["Last seen 1 minute ago", "Online"]]

		for value in contacts {
			if let firstLetter = value.first?.first {
				sections.append(String(firstLetter).capitalized)
			}
		}
		updateMembers()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateMembers() {

		var members = ""
		for indexPath in indexPaths {
			members += (members != "") ? ", " : ""
			members += contacts[indexPath.section][indexPath.row]
		}
		labelMembersName.text = members
		if let membersNameHeight = labelMembersName.text?.height(withConstrainedWidth: labelMembersName.frame.size.width, font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)) {
			layoutConstraintLabelMembersNameHeight.constant = membersNameHeight
		}
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCancel(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDone(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CreateGroupView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return contacts.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return contacts[section].count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "CreateGroupCell", for: indexPath) as! CreateGroupCell
		cell.bindData(index: (indexPath.item + (indexPath.section * 3)), name: contacts[indexPath.section][indexPath.row], status: status[indexPath.section][indexPath.row])
		cell.setSelected(indexPaths.contains(indexPath))
		return cell
	}

	func sectionIndexTitles(for tableView: UITableView) -> [String]? {

		return sectionIndex
	}

	func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {

		if let index = sections.firstIndex(of: title) {
			return index
		}
		return -1
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CreateGroupView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 70
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 30
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if let firstLetter = contacts[section].first?.first {
			return String(firstLetter).capitalized
		}
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			let viewY = header.frame.size.height - 0.5
			let view = UIView(frame: CGRect(x: 0, y: viewY, width: header.frame.size.width, height: 1))
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
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if (indexPaths.contains(indexPath)) {
			indexPaths.remove(indexPath)
		} else {
			indexPaths.insert(indexPath)
		}
		updateMembers()
		tableView.reloadData()
	}
}

// MARK: - String
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension String {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.width)
	}
}
