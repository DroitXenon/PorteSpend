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
class Cart3View: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var ViewSubTotal: UIView!
	@IBOutlet var ViewDeliveryMethod: UIView!

	@IBOutlet var labelSubTotal: UILabel!
	@IBOutlet var labelItemCount: UILabel!

	private var selectedDeliveryMethod = 0
	private var products: [[String: String]] = []
	private var deliveryMethods: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Cart"

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(actionCancel(_:)))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear All", style: .plain, target: self, action: #selector(actionClearAll))

		tableView.register(UINib(nibName: "Cart3Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Cart3Cell1")
		tableView.register(UINib(nibName: "Cart3Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Cart3Cell2")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Rezz Casual Sneaker"
		dict1["brand"] = "Tommy Hilfiger"
		dict1["price"] = "$54.99"
		dict1["originalPrice"] = "$139.50"
		dict1["color"] = "Black"
		dict1["quantity"] = "1"
		dict1["size"] = "6.5 UK"
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Air Max Motion"
		dict2["brand"] = "Nike"
		dict2["price"] = "$75.00"
		dict2["originalPrice"] = ""
		dict2["color"] = "Gray"
		dict2["quantity"] = "1"
		dict2["size"] = "8.5 UK"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Riding boots"
		dict3["brand"] = "River Island"
		dict3["price"] = "$59.00"
		dict3["originalPrice"] = "$70.00"
		dict3["color"] = "Black"
		dict3["quantity"] = "1"
		dict3["size"] = "8 UK"
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["shipping"] = "Free Shipping"
		dict4["duration"] = "1 month - Friday, 27 July 2018"
		dict4["rate"] = "Free"
		deliveryMethods.append(dict4)

		var dict5: [String: String] = [:]
		dict5["shipping"] = "Standard Shipping"
		dict5["duration"] = "2 weeks - Tuesday, 10 July 2018"
		dict5["rate"] = "$4.74"
		deliveryMethods.append(dict5)

		var dict6: [String: String] = [:]
		dict6["shipping"] = "Express Shipping"
		dict6["duration"] = "3-4 days - Sunday, 1 July 2018"
		dict6["rate"] = "$31.58"
		deliveryMethods.append(dict6)

		labelItemCount.text = "\(products.count) items"
		labelSubTotal.text = "$188.99"

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCancel(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionClearAll(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProceedCheckout(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFavorite(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDelete(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cart3View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return products.count }
		if (section == 1) { return deliveryMethods.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cart3Cell1", for: indexPath) as! Cart3Cell1
			cell.bindData(index: indexPath, data: products[indexPath.row])
			cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
			cell.buttonDelete.addTarget(self, action: #selector(actionDelete(_:)), for: .touchUpInside)
			return cell
		}

		if (indexPath.section == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cart3Cell2", for: indexPath) as! Cart3Cell2
			cell.bindData(data: deliveryMethods[indexPath.row])
			cell.setCell(isSelected: (selectedDeliveryMethod == indexPath.row))
			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cart3View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 100 }
		if (indexPath.section == 1) { return 80 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 55 }
		if (section == 1) { return 50 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		if (section == 0) { return ViewSubTotal 		}
		if (section == 1) { return ViewDeliveryMethod	}

		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
		if (indexPath.section == 1) {
			selectedDeliveryMethod = indexPath.row
			tableView.reloadRows(at: tableView.indexPathsForVisibleRows!, with: .none)
		}
	}
}
