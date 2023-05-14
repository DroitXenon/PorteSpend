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
class Shipping3View: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var viewOrderInfoHeader: UIView!

	@IBOutlet var cellSubTotal: UITableViewCell!
	@IBOutlet var cellShipping: UITableViewCell!
	@IBOutlet var cellTotal: UITableViewCell!

	@IBOutlet var labelSubTotal: UILabel!
	@IBOutlet var labelItemCount: UILabel!
	@IBOutlet var labelShipping: UILabel!
	@IBOutlet var labelShippingMonth: UILabel!
	@IBOutlet var labelTotal: UILabel!

	private var selectedMethod = 0
	private var shippingMethods: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Shipping Method"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		tableView.register(UINib(nibName: "Shipping3Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Shipping3Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		shippingMethods.removeAll()

		var dict1: [String: String] = [:]
		dict1["shipping"] = "Free Shipping"
		dict1["duration"] = "1 month - Friday, 27 July 2020"
		dict1["rate"] = "Free"
		shippingMethods.append(dict1)

		var dict2: [String: String] = [:]
		dict2["shipping"] = "Standard Shipping"
		dict2["duration"] = "2 weeks - Tuesday, 10 July 2020"
		dict2["rate"] = "$4.74"
		shippingMethods.append(dict2)

		var dict3: [String: String] = [:]
		dict3["shipping"] = "Express Shipping"
		dict3["duration"] = "3-4 days - Sunday, 1 July 2020"
		dict3["rate"] = "$31.58"
		shippingMethods.append(dict3)

		labelSubTotal.text = "$160"
		labelItemCount.text = "3 items"
		labelShipping.text = "$4.74"
		labelShippingMonth.text = "Month"
		labelTotal.text = "$164.74"

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillLayoutSubviews() {

		super.viewWillLayoutSubviews()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionOrderInfo(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Shipping3View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 1) { return 3 }

		return shippingMethods.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Shipping3Cell1", for: indexPath) as! Shipping3Cell1
			cell.bindData(data: shippingMethods[indexPath.row])
			cell.setCell(isSelected: (selectedMethod == indexPath.row))
			return cell
		}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellSubTotal	}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellShipping	}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellTotal		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Shipping3View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 80 }
		if (indexPath.section == 1) { return 45 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 1 }
		if (section == 1) { return 60 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		if (section == 1) { return viewOrderInfoHeader }

		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)

		selectedMethod = indexPath.row
		tableView.reloadData()
	}
}
