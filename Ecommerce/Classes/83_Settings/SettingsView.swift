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
class SettingsView: UIViewController {

	@IBOutlet var viewAccount: UIView!

	@IBOutlet var cellCountry: UITableViewCell!
	@IBOutlet var cellLanguage: UITableViewCell!
	@IBOutlet var cellCurrency: UITableViewCell!
	@IBOutlet var cellSizes: UITableViewCell!
	@IBOutlet var cellShop: UITableViewCell!

	@IBOutlet var cellNotification: UITableViewCell!
	@IBOutlet var cellFaceID: UITableViewCell!
	@IBOutlet var cellSupport: UITableViewCell!
	@IBOutlet var cellTermsCondition: UITableViewCell!

	@IBOutlet var labelCountry: UILabel!
	@IBOutlet var labelLanguage: UILabel!
	@IBOutlet var labelCurrency: UILabel!
	@IBOutlet var labelSizes: UILabel!
	@IBOutlet var labelShop: UILabel!

	@IBOutlet var switchNotification: UISwitch!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Settings"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewAccount)

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelCountry.text = "United States"
		labelLanguage.text = "English"
		labelCurrency.text = "$ - USD"
		labelSizes.text = "US"
		labelShop.text = "Men"
		switchNotification.isOn = false
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAccount(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionNotificationSwitch(_ sender: UISwitch) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SettingsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 5 }
		if (section == 1) { return 4 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellCountry	}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellLanguage	}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellCurrency	}
		if (indexPath.section == 0) && (indexPath.row == 3) { return cellSizes		}
		if (indexPath.section == 0) && (indexPath.row == 4) { return cellShop		}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellNotification	}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellFaceID			}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellSupport		}
		if (indexPath.section == 1) && (indexPath.row == 3) { return cellTermsCondition	}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SettingsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

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

		return 60
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return "GENERAL"	}
		if (section == 1) { return "OTHER"		}

		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 1) && (indexPath.row == 0) { return 70 }

		return 45
	}
}
