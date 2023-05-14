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
class Notifications3View: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellPushNotification: UITableViewCell!

	@IBOutlet var cellBreakingNews: UITableViewCell!
	@IBOutlet var cellDailyEdition: UITableViewCell!
	@IBOutlet var cellRecommendations: UITableViewCell!

	@IBOutlet var cellLikes: UITableViewCell!
	@IBOutlet var cellComments: UITableViewCell!
	@IBOutlet var cellMentions: UITableViewCell!
	@IBOutlet var cellFollowers: UITableViewCell!
	@IBOutlet var cellFriendActivity: UITableViewCell!

	@IBOutlet var switchBreakingNews: UISwitch!
	@IBOutlet var switchDailyEdition: UISwitch!
	@IBOutlet var switchRecommendations: UISwitch!

	@IBOutlet var switchLikes: UISwitch!
	@IBOutlet var switchComments: UISwitch!
	@IBOutlet var switchMentions: UISwitch!
	@IBOutlet var switchFollowers: UISwitch!
	@IBOutlet var switchFriendActivity: UISwitch!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Notifications"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		switchBreakingNews.isOn = true
		switchDailyEdition.isOn = false
		switchRecommendations.isOn = false

		switchLikes.isOn = false
		switchComments.isOn = false
		switchMentions.isOn = true
		switchFollowers.isOn = false
		switchFriendActivity.isOn = true

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Notifications3View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 1 }
		if (section == 1) { return 3 }
		if (section == 2) { return 5 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellPushNotification	}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellBreakingNews		}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellDailyEdition		}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellRecommendations	}

		if (indexPath.section == 2) && (indexPath.row == 0) { return cellLikes				}
		if (indexPath.section == 2) && (indexPath.row == 1) { return cellComments			}
		if (indexPath.section == 2) && (indexPath.row == 2) { return cellMentions			}
		if (indexPath.section == 2) && (indexPath.row == 3) { return cellFollowers			}
		if (indexPath.section == 2) && (indexPath.row == 4) { return cellFriendActivity		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Notifications3View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 25 }
		if (section == 1) { return 45 }
		if (section == 2) { return 45 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return ""		 }
		if (section == 1) { return "CONTENT" }
		if (section == 2) { return "SOCIAL"	 }
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if (section == 0) {
			if let header = view as? UITableViewHeaderFooterView {
				header.contentView.backgroundColor = .tertiarySystemFill
			}
			return
		}

		if (section != 0) {
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
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
