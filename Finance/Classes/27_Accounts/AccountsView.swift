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
class AccountsView: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var buttonProfile: UIButton!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var cellOpenDeposit: UITableViewCell!

	var sections = ["Cards", "Deposit", "Credits"]
	var cards: [[String: String]] = []
	var deposit: [[String: String]] = []
	var credits: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		navigationController?.navigationItem.largeTitleDisplayMode = .never
		navigationController?.navigationBar.prefersLargeTitles = false

		tableView.register(UINib(nibName: "AccountsCell1", bundle: Bundle.main), forCellReuseIdentifier: "AccountsCell1")
		tableView.register(UINib(nibName: "AccountsCell2", bundle: Bundle.main), forCellReuseIdentifier: "AccountsCell2")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSubTitle.text = "Long Sample Text"

		cards.removeAll()
		deposit.removeAll()
		credits.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Visa Classic USD"
		dict1["card_number"] = "****7399"
		dict1["card_type"] = "American Express"
		dict1["amount"] = "$119"
		cards.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Master Card EUR"
		dict2["card_number"] = "****1843"
		dict2["card_type"] = "Visa"
		dict2["amount"] = "€226"
		cards.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "American Express Platinum USD"
		dict3["card_number"] = "****6092"
		dict3["card_type"] = "Mastercard"
		dict3["amount"] = "$494"
		cards.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Amy Roberts"
		dict4["description"] = "Rate: 1.8%"
		dict4["amount"] = "$300"
		deposit.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Betty Hansen"
		dict5["description"] = "Rate: 2.3%"
		dict5["amount"] = "$43"
		deposit.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Chloe Adams"
		dict6["description"] = "Rate: 0.9%"
		dict6["amount"] = "$241"
		deposit.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Alan Nickerson"
		dict7["description"] = "21 Dec 2019 - Pay: $1080"
		dict7["amount"] = "$13100"
		credits.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Brian Elwood"
		dict8["description"] = "18 Apr 2020 - Pay: $560"
		dict8["amount"] = "$3960"
		credits.append(dict8)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AccountsView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return sections.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return cards.count }
		if (section == 1) { return deposit.count+1 }
		if (section == 2) { return credits.count }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "AccountsCell1", for: indexPath) as! AccountsCell1
			cell.bindData(index: indexPath, data: cards[indexPath.row])
			return cell
		}

		if (indexPath.section == 1) && (indexPath.row == deposit.count) { return cellOpenDeposit }
		if (indexPath.section == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "AccountsCell2", for: indexPath) as! AccountsCell2
			cell.bindData(index: indexPath, data: deposit[indexPath.row])
			return cell
		}

		if (indexPath.section == 2) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "AccountsCell2", for: indexPath) as! AccountsCell2
			cell.bindData(index: indexPath, data: credits[indexPath.row])
			return cell
		}
		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AccountsView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 1) && (indexPath.row == deposit.count) { return 55 }
		return 80
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 40
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return sections[section]
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			let viewY = header.frame.size.height - 0.5
			let view = UIView(frame: CGRect(x: 15, y: viewY, width: header.frame.size.width-30, height: 1))
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
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 0.01
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
