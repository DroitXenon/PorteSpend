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
class Cart1View: UIViewController {

	@IBOutlet var labelItemCount: UILabel!
	@IBOutlet var tableView: UITableView!

	@IBOutlet var labelSubTotal: UILabel!
	@IBOutlet var labelShippingFee: UILabel!
	@IBOutlet var labelTotal: UILabel!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Cart"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		tableView.register(UINib(nibName: "Cart1Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Cart1Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Rapid Runner IDP Watch"
		dict1["brand"] = "Tommy Hilfiger"
		dict1["price"] = "$54.99"
		dict1["originalPrice"] = "$139.50"
		dict1["color"] = "Black"
		dict1["quantity"] = ""
		dict1["size"] = ""
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Men Grey Manitoba Watch"
		dict2["brand"] = "Nike"
		dict2["price"] = "$75.00"
		dict2["originalPrice"] = ""
		dict2["color"] = "Gray"
		dict2["quantity"] = ""
		dict2["size"] = "8.5"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Flex Free XT Jewellery"
		dict3["brand"] = "House of Versace"
		dict3["price"] = "$48.00"
		dict3["originalPrice"] = ""
		dict3["color"] = "White"
		dict3["quantity"] = ""
		dict3["size"] = "0"
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "LEGEND REACT 2 Running Shoes"
		dict4["brand"] = "River Island"
		dict4["price"] = "$59.00"
		dict4["originalPrice"] = "$70.00"
		dict4["color"] = ""
		dict4["quantity"] = ""
		dict4["size"] = ""
		products.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "ZOOM WINFLO 6 Running Shoes"
		dict5["brand"] = "Dolce & Gabbana"
		dict5["price"] = "$64.00"
		dict5["originalPrice"] = ""
		dict5["color"] = "Blue"
		dict5["quantity"] = ""
		dict5["size"] = "6.5"
		products.append(dict5)

		labelItemCount.text = "\(products.count)" + " items"
		labelSubTotal.text = "Subtotal: $300.99"
		labelShippingFee.text = "Shipping: Free"
		labelTotal.text = "$300.99"

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMoveWishlist(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionClearCart(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProceedCheckout(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionColor(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionQuantity(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSize(_ sender: UIButton) {

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
extension Cart1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return products.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Cart1Cell1", for: indexPath) as! Cart1Cell1
		cell.bindData(index: indexPath.row, data: products[indexPath.row])
		cell.buttonColor.addTarget(self, action: #selector(actionColor(_:)), for: .touchUpInside)
		cell.buttonQuantity.addTarget(self, action: #selector(actionQuantity(_:)), for: .touchUpInside)
		cell.buttonSize.addTarget(self, action: #selector(actionSize(_:)), for: .touchUpInside)
		cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
		cell.buttonDelete.addTarget(self, action: #selector(actionDelete(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Cart1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 150
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
