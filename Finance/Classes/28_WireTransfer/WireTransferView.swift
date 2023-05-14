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
class WireTransferView: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellTransferType: UITableViewCell!
	@IBOutlet var cellCardNumber: UITableViewCell!
	@IBOutlet var cellBankName: UITableViewCell!
	@IBOutlet var cellBeneficiaryNumber: UITableViewCell!
	@IBOutlet var cellBICCode: UITableViewCell!
	@IBOutlet var cellAccountNumber: UITableViewCell!
	@IBOutlet var cellAddress: UITableViewCell!
	@IBOutlet var cellAmount: UITableViewCell!

	@IBOutlet var labelTransferType: UILabel!
	@IBOutlet var labelCardNumber: UILabel!
	@IBOutlet var textFieldBankName: UITextField!
	@IBOutlet var textFieldBeneficiaryNumber: UITextField!
	@IBOutlet var textFieldBICCode: UITextField!
	@IBOutlet var textFieldAccountNumber: UITextField!
	@IBOutlet var textFieldAddress: UITextField!
	@IBOutlet var textFieldAmount: UITextField!

	var sections = ["Info", "Info", "Amount"]
	var transactions = ["", "", "", "", ""]

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Wire Transfer"
		navigationController?.navigationItem.largeTitleDisplayMode = .never
		navigationController?.navigationBar.prefersLargeTitles = false

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTransferType.text = "Regular"
		labelCardNumber.text = "Visa **** 8900"
		textFieldBankName.text = "Bank of America"
		textFieldBeneficiaryNumber.text = "482917"
		textFieldBICCode.text = "USBKUS44IMT"
		textFieldAccountNumber.text = "565777"
		textFieldAddress.text = "1549 Rt 9, Halfmoon NY 12065"
		textFieldAmount.text = "120.0"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSend(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension WireTransferView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 2 }
		if (section == 1) { return 5 }
		if (section == 2) { return 1 }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellTransferType		}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellCardNumber			}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellBankName			}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellBeneficiaryNumber	}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellBICCode			}
		if (indexPath.section == 1) && (indexPath.row == 3) { return cellAccountNumber		}
		if (indexPath.section == 1) && (indexPath.row == 4) { return cellAddress			}

		if (indexPath.section == 2) && (indexPath.row == 0) { return cellAmount				}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension WireTransferView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 2) && (indexPath.row == 0) { return 80 }
		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 30 }
		return 55
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return sections[section]
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 0.01
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
