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
class OrderInfo2View: UIViewController {

	@IBOutlet var labelCart1: UILabel!
	@IBOutlet var labelCart2: UILabel!

	@IBOutlet var labelAddress1: UILabel!
	@IBOutlet var labelAddress2: UILabel!

	@IBOutlet var labelShippingMethod1: UILabel!
	@IBOutlet var labelShippingMethod2: UILabel!

	@IBOutlet var labelPayment1: UILabel!
	@IBOutlet var labelPayment2: UILabel!

	@IBOutlet var textFieldPromocode: UITextField!

	@IBOutlet var labelSubTotal: UILabel!
	@IBOutlet var labelShipping: UILabel!
	@IBOutlet var labelTotal: UILabel!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Order Info"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel Order", style: .done, target: self, action: #selector(actionCancelOrder(_:)))

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Rezz Casual Sneaker"
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

		labelCart1.text = "\(products.count) items"
		labelCart2.text = "$188.99"

		labelAddress1.text = "4863  West Virginia Avenue"
		labelAddress2.text = "New York, US"

		labelShippingMethod1.text = "Standard Shipping"
		labelShippingMethod2.text = "2 weeks for $0"
		labelPayment1.text = "MasterCard"
		labelPayment2.text = "**** 8212"

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldPromocode.attributedPlaceholder = NSAttributedString(string: "Promocode", attributes: attribute)

		labelSubTotal.text = "Sub Total: " + "$188.99"
		labelShipping.text = "Shipping: " + "Free"
		labelTotal.text = "$188.99"
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCancelOrder(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCart(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddress(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionShippingMethod(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPayment(_ sender: UIButton) {

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
