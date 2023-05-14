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
class OrderInfo1View: UIViewController {

	@IBOutlet var labelCartItemCount: UILabel!
	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellShippingAddress: UITableViewCell!
	@IBOutlet var cellShippingMethod: UITableViewCell!
	@IBOutlet var cellPayment: UITableViewCell!
	@IBOutlet var cellPromocode: UITableViewCell!

	@IBOutlet var labelShippingAddress: UILabel!
	@IBOutlet var labelShippingMethod: UILabel!
	@IBOutlet var labelPayment: UILabel!
	@IBOutlet var viewCard: UIView!
	@IBOutlet var imageCard: UIImageView!
	@IBOutlet var textFieldPromocode: UITextField!

	@IBOutlet var labelSubTotal: UILabel!
	@IBOutlet var labelShipping: UILabel!
	@IBOutlet var labelPromocode: UILabel!
	@IBOutlet var labelTotal: UILabel!
	@IBOutlet var labelPromocodeTotal: UILabel!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Order Info"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel Order", style: .done, target: self, action: #selector(actionCancelOrder(_:)))

		tableView.register(UINib(nibName: "OrderInfo1Cell1", bundle: Bundle.main), forCellReuseIdentifier: "OrderInfo1Cell1")

		viewCard.layer.borderWidth = 1
		viewCard.layer.borderColor = AppColor.Border.cgColor

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldPromocode.attributedPlaceholder = NSAttributedString(string: "Promocode", attributes: attribute)

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Rezz Casual"
		dict1["price"] = "$54.99"
		dict1["color"] = "Black"
		dict1["size"] = "6.5 UK"
		dict1["quantity"] = "1"
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Air Max Motion"
		dict2["price"] = "$75.00"
		dict2["color"] = "Gray"
		dict2["size"] = "8.5 UK"
		dict2["quantity"] = "1"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Riding boots"
		dict3["price"] = "$59.00"
		dict3["color"] = "Black"
		dict3["size"] = "8 UK"
		dict3["quantity"] = "1"
		products.append(dict3)

		labelCartItemCount.text = "Cart \(products.count) items"

		labelShippingAddress.text = "4863  West Virginia Avenue\nNew York, United States"
		labelShippingMethod.text = "Standard Shipping - 2 weeks for $4.74"
		labelPayment.text = "MasterCard **** 8212"

		labelSubTotal.text = "Sub Total: $188.99"
		labelShipping.text = "Shipping: $4.74"
		labelPromocode.text = "Promocode: 50% off"
		labelTotal.text = "$96.87"
		labelPromocodeTotal.text = "$193.73"

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCancelOrder(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionEdit(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAdd(_ sender: UIButton) {

		print(#function)
		view.endEditing(true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionConfirmOrder(_ sender: UIButton) {

		print(#function)
		view.endEditing(true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension OrderInfo1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return products.count }
		if (section == 1) { return 4 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "OrderInfo1Cell1", for: indexPath) as! OrderInfo1Cell1
			cell.bindData(index: indexPath.row, data: products[indexPath.row])
			return cell
		}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellShippingAddress	}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellShippingMethod		}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellPayment			}
		if (indexPath.section == 1) && (indexPath.row == 3) { return cellPromocode			}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension OrderInfo1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 60 }

		if (indexPath.section == 1) && (indexPath.row == 0) { return 85 }
		if (indexPath.section == 1) && (indexPath.row == 1) { return 65 }
		if (indexPath.section == 1) && (indexPath.row == 2) { return 65 }
		if (indexPath.section == 1) && (indexPath.row == 3) { return 65 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
