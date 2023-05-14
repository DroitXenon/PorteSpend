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
class Settings2View: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellUser: UITableViewCell!
	@IBOutlet var cellNotifications: UITableViewCell!
	@IBOutlet var cellInviteFriends: UITableViewCell!
	@IBOutlet var cellTouchID: UITableViewCell!
	@IBOutlet var cellCards: UITableViewCell!
	@IBOutlet var cellSupport: UITableViewCell!
	@IBOutlet var cellFeedack: UITableViewCell!

	@IBOutlet var imageViewUser: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelEmail: UILabel!
	@IBOutlet var switchTouchID: UISwitch!
	@IBOutlet var labelCards: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Settings"
		navigationController?.navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewUser.sample("Finance", "BusinessWomen", 1)
		labelName.text = "John Smith"
		labelEmail.text = "info@related.blog"
		switchTouchID.setOn(true, animated: true)
		labelCards.text = "5"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSwitchTouchID(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Settings2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return 7
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.row == 0) { return cellUser			}
		if (indexPath.row == 1) { return cellNotifications	}
		if (indexPath.row == 2) { return cellInviteFriends	}
		if (indexPath.row == 3) { return cellTouchID		}
		if (indexPath.row == 4) { return cellCards			}
		if (indexPath.row == 5) { return cellSupport		}
		if (indexPath.row == 6) { return cellFeedack		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Settings2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.row == 0) { return 95 }
		return 55
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
