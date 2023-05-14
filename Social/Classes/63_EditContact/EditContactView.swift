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
class EditContactView: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellName: UITableViewCell!
	@IBOutlet var cellAddPhone: UITableViewCell!
	@IBOutlet var cellNotifications: UITableViewCell!
	@IBOutlet var cellSound: UITableViewCell!
	@IBOutlet var cellDeleteAccount: UITableViewCell!

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var textFieldFirstName: UITextField!
	@IBOutlet var textFieldLastName: UITextField!
	@IBOutlet var switchNotifications: UISwitch!
	@IBOutlet var labelSound: UILabel!

	private var phones: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Add Contact"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(actionSave(_:)))

		tableView.register(UINib(nibName: "EditContactCell", bundle: Bundle.main), forCellReuseIdentifier: "EditContactCell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Profiles", 29)

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldFirstName.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: attribute)
		textFieldLastName.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: attribute)

		phones = ["+1(513)616-5999"]

		textFieldFirstName.text = "Amy"
		textFieldLastName.text = "Roberts"
		labelSound.text = "Pulse"

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSave(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionRemove(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionPhone(_ sender: UIButton) {

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
extension EditContactView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 5
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 1 }
		if (section == 1) { return phones.count }
		if (section == 2) { return 1 }
		if (section == 3) { return 2 }
		if (section == 4) { return 1 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellName			}
		if (indexPath.section == 2) && (indexPath.row == 0) { return cellAddPhone		}
		if (indexPath.section == 3) && (indexPath.row == 0) { return cellNotifications	}
		if (indexPath.section == 3) && (indexPath.row == 1) { return cellSound			}
		if (indexPath.section == 4) && (indexPath.row == 0) { return cellDeleteAccount	}

		if (indexPath.section == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "EditContactCell", for: indexPath) as! EditContactCell
			cell.bindData(data: phones[indexPath.row])
			cell.buttonRemove.addTarget(self, action: #selector(actionRemove(_:)), for: .touchUpInside)
			cell.buttonPhone.addTarget(self, action: #selector(actionPhone(_:)), for: .touchUpInside)
			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension EditContactView: UITableViewDelegate {

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

		if (indexPath.section == 0) { return 120 }
		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 0.01 }
		if (section == 1) { return 55 }
		if (section == 2) { return 10 }
		if (section == 3) { return 55 }
		if (section == 4) { return 55 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 1) { return "" 	}
		if (section == 2) { return ""	}
		if (section == 3) { return ""	}
		if (section == 4) { return ""	}

		return ""
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			header.contentView.backgroundColor = .tertiarySystemFill
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 0.01
	}
}
