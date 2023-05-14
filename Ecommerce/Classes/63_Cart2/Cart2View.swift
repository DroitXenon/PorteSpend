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
class Cart2View: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellSubTotal: UITableViewCell!
	@IBOutlet var cellShipping: UITableViewCell!
	@IBOutlet var cellPromocode: UITableViewCell!
	@IBOutlet var cellTotal: UITableViewCell!

	@IBOutlet var labelSubTotal: UILabel!
	@IBOutlet var labelItemCount: UILabel!
	@IBOutlet var labelShipping: UILabel!
	@IBOutlet var labelShippingDays: UILabel!
	@IBOutlet var labelPromocode: UILabel!
	@IBOutlet var labelPromocodePercentage: UILabel!
	@IBOutlet var labelTotal1: UILabel!
	@IBOutlet var labelTotal2: UILabel!

	@IBOutlet var viewItemsHeader: UIView!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Cart"

		let closeImage = UIImage(systemName: "xmark")?.withTintColor(UIColor.darkGray).withRenderingMode(.alwaysOriginal)
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(actionCancel(_:)))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Checkout", style: .plain, target: self, action: #selector(actionCheckout(_:)))

		tableView.register(UINib(nibName: "Cart2Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Cart2Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Rezz Casual Furniture"
		dict1["brand"] = "Tommy Hilfiger"
		dict1["price"] = "$54.99"
		dict1["originalPrice"] = "$139.50"
		dict1["items"] = "0"
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Air Max Motion"
		dict2["brand"] = "Nike"
		dict2["price"] = "$75.00"
		dict2["originalPrice"] = ""
		dict2["items"] = "0"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Hiking Furniture"
		dict3["brand"] = "House of Versace"
		dict3["price"] = "$48.00"
		dict3["originalPrice"] = ""
		dict3["items"] = "0"
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Riding Furniture"
		dict4["brand"] = "River Island"
		dict4["price"] = "$59.00"
		dict4["originalPrice"] = "$70.00"
		dict4["items"] = "0"
		products.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Platform Derby Furniture"
		dict5["brand"] = "Dolce & Gabbana"
		dict5["price"] = "$64.00"
		dict5["originalPrice"] = ""
		dict5["items"] = "0"
		products.append(dict5)

		labelSubTotal.text = "$300.99"
		labelItemCount.text = "\(products.count) items"
		labelShipping.text = "$30 (Express)"
		labelShippingDays.text = "8-7 days"
		labelPromocode.text = "appdesignkit"
		labelPromocodePercentage.text = "50% off"
		labelTotal1.text = "$165.49"
		labelTotal2.text = "$330.99"

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCheckout(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCancel(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionClearCart(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMoveWishlist(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAddItem(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionRemoveItem(_ sender: UIButton) {

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
extension Cart2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 4 }

		return products.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellSubTotal	}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellShipping	}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellPromocode	}
		if (indexPath.section == 0) && (indexPath.row == 3) { return cellTotal		}

		if (indexPath.section == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cart2Cell1", for: indexPath) as! Cart2Cell1
			cell.bindData(index: indexPath.row, data: products[indexPath.row])
			cell.buttonAddItem.addTarget(self, action: #selector(actionAddItem(_:)), for: .touchUpInside)
			cell.buttonRemoveItem.addTarget(self, action: #selector(actionRemoveItem(_:)), for: .touchUpInside)
			cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
			cell.buttonDelete.addTarget(self, action: #selector(actionDelete(_:)), for: .touchUpInside)
			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cart2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 45 }

		return 125
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

		if (section == 1) { return viewItemsHeader }
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
