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
class AccountView: UIViewController {

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var labelLongSampleText: UILabel!
	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellOrders: UITableViewCell!
	@IBOutlet var cellCart: UITableViewCell!
	@IBOutlet var cellWishlist: UITableViewCell!

	@IBOutlet var cellAccountDetails: UITableViewCell!
	@IBOutlet var cellAddress: UITableViewCell!
	@IBOutlet var cellPayments: UITableViewCell!
	@IBOutlet var cellSocialAccounts: UITableViewCell!

	@IBOutlet var cellNeedHelp: UITableViewCell!

	@IBOutlet var labelOrders: UILabel!
	@IBOutlet var labelCart: UILabel!
	@IBOutlet var labelWishlist: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(actionSignOut(_:)))

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Portraits", 1)
		labelLongSampleText.text = "John Smith"
		labelOrders.text = "2"
		labelCart.text = "Empty"
		labelWishlist.text = "13"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSignOut(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AccountView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 3 }
		if (section == 1) { return 4 }
		if (section == 2) { return 1 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellOrders			}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellCart			}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellWishlist		}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellAccountDetails	}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellAddress		}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellPayments		}
		if (indexPath.section == 1) && (indexPath.row == 3) { return cellSocialAccounts	}

		if (indexPath.section == 2) && (indexPath.row == 0) { return cellNeedHelp		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AccountView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if (section == 0) {
			if let header = view as? UITableViewHeaderFooterView {
				header.contentView.backgroundColor = .tertiarySystemFill
			}
			return;
		}

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
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 30 }

		return 50
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return ""				}
		if (section == 1) { return "PERSONAL INFO"	}
		if (section == 2) { return "SUPPORT"		}

		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 45
	}
}
