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
class ContactInfoView: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellName: UITableViewCell!
	@IBOutlet var cellMobile: UITableViewCell!
	@IBOutlet var cellUsername: UITableViewCell!
	@IBOutlet var cellBio: UITableViewCell!
	@IBOutlet var cellSendMessage: UITableViewCell!
	@IBOutlet var cellShareContact: UITableViewCell!
	@IBOutlet var cellSharedMedia: UITableViewCell!
	@IBOutlet var cellNotifications: UITableViewCell!
	@IBOutlet var cellBlockUser: UITableViewCell!

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelLastSeen: UILabel!
	@IBOutlet var buttonCall: UIButton!
	@IBOutlet var labelMobile: UILabel!
	@IBOutlet var labelUsername: UILabel!
	@IBOutlet var labelBio: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Contact Info"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(actionEdit(_:)))

		buttonCall.layer.borderWidth = 1
		buttonCall.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Portraits", 19)
		labelName.text = "John Smith"
		labelLastSeen.text = "Last seen 2 min ago"
		labelMobile.text = "+1(513)616-5999"
		labelUsername.text = "@appdesignkit"
		labelBio.text = "Designer at App Design Kit"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionEdit(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCall(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ContactInfoView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 5
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 1 }
		if (section == 1) { return 3 }
		if (section == 2) { return 2 }
		if (section == 3) { return 2 }
		if (section == 4) { return 1 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellName			}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellMobile			}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellUsername		}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellBio			}

		if (indexPath.section == 2) && (indexPath.row == 0) { return cellSendMessage	}
		if (indexPath.section == 2) && (indexPath.row == 1) { return cellShareContact	}

		if (indexPath.section == 3) && (indexPath.row == 0) { return cellSharedMedia	}
		if (indexPath.section == 3) && (indexPath.row == 1) { return cellNotifications	}

		if (indexPath.section == 4) && (indexPath.row == 0) { return cellBlockUser		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ContactInfoView: UITableViewDelegate {

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

		if (indexPath.section == 0) { return 100	}
		if (indexPath.section == 1) { return 70		}
		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 0.01 }
		if (section == 1) { return 10 }
		if (section == 2) { return 55 }
		if (section == 3) { return 10 }
		if (section == 4) { return 10 }
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
