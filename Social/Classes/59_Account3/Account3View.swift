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
class Account3View: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellBlockedUsers: UITableViewCell!
	@IBOutlet var cellLastSeen: UITableViewCell!
	@IBOutlet var cellVoiceCalls: UITableViewCell!
	@IBOutlet var cellGroups: UITableViewCell!
	@IBOutlet var cellPasscodeTouchID: UITableViewCell!
	@IBOutlet var cellTwoStepVerification: UITableViewCell!
	@IBOutlet var cellActiveSessions: UITableViewCell!
	@IBOutlet var cellAwayFor: UITableViewCell!

	@IBOutlet var labelBlockedUsers: UILabel!
	@IBOutlet var labelLastSeen: UILabel!
	@IBOutlet var labelVoiceCalls: UILabel!
	@IBOutlet var labelGroups: UILabel!
	@IBOutlet var labelAwayFor: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Privacy & Security"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelBlockedUsers.text = "9"
		labelLastSeen.text = "My Contacts"
		labelVoiceCalls.text = "Everybody"
		labelGroups.text = "My Contacts"
		labelAwayFor.text = "6 months"
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Account3View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 4 }
		if (section == 1) { return 3 }
		if (section == 2) { return 1 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellBlockedUsers			}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellLastSeen				}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellVoiceCalls				}
		if (indexPath.section == 0) && (indexPath.row == 3) { return cellGroups					}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellPasscodeTouchID		}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellTwoStepVerification	}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellActiveSessions			}

		if (indexPath.section == 2) && (indexPath.row == 0) { return cellAwayFor				}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Account3View: UITableViewDelegate {

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

		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 55
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return "Privacy"			}
		if (section == 1) { return "Security" 			}
		if (section == 2) { return "Delete my Account"	}
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		if(section == 2) { return 80 }
		return 0.01
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {

		if (section == 2) { return "If you do not come online at least once within this period, your account will be deleted along with all messages and contacts" }
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {

		if let footer = view as? UITableViewHeaderFooterView {
			footer.contentView.backgroundColor = .tertiarySystemFill
			footer.textLabel?.font = UIFont.systemFont(ofSize: 14)
		}
	}
}
