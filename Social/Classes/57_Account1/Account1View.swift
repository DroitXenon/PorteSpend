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
class Account1View: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellProfile: UITableViewCell!
	@IBOutlet var cellFollowers: UITableViewCell!
	@IBOutlet var cellFollowing: UITableViewCell!
	@IBOutlet var cellBlockedUsers: UITableViewCell!
	@IBOutlet var cellNotifications: UITableViewCell!
	@IBOutlet var cellPrivacySecurity: UITableViewCell!
	@IBOutlet var cellLanguage: UITableViewCell!
	@IBOutlet var cellTheme: UITableViewCell!
	@IBOutlet var cellLogout: UITableViewCell!

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelUsername: UILabel!
	@IBOutlet var labelFollowers: UILabel!
	@IBOutlet var labelFollowing: UILabel!
	@IBOutlet var labelBlockedUsers: UILabel!
	@IBOutlet var labelLanguage: UILabel!
	@IBOutlet var labelTheme: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "@john.smith"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Portraits", 1)
		labelName.text = "John Smith"
		labelUsername.text = "@john.smith"
		labelFollowers.text = "86.1K"
		labelFollowing.text = "16"
		labelBlockedUsers.text = "193"
		labelLanguage.text = "English"
		labelTheme.text = "Light"
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Account1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 4
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 1 }
		if (section == 1) { return 3 }
		if (section == 2) { return 4 }
		if (section == 3) { return 1 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellProfile			}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellFollowers			}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellFollowing			}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellBlockedUsers		}

		if (indexPath.section == 2) && (indexPath.row == 0) { return cellNotifications		}
		if (indexPath.section == 2) && (indexPath.row == 1) { return cellPrivacySecurity	}
		if (indexPath.section == 2) && (indexPath.row == 2) { return cellLanguage			}
		if (indexPath.section == 2) && (indexPath.row == 3) { return cellTheme				}

		if (indexPath.section == 3) && (indexPath.row == 0) { return cellLogout				}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Account1View: UITableViewDelegate {

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

		if (indexPath.section == 0) { return 70 }
		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 55 }
		if (section == 1) { return 10 }
		if (section == 2) { return 55 }
		if (section == 3) { return 10 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return "Profile"	}
		if (section == 1) { return "" 			}
		if (section == 2) { return "Settings"	}
		if (section == 3) { return ""			}
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
			header.contentView.backgroundColor = .tertiarySystemFill
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 0.01
	}
}
