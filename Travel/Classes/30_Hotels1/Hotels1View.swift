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
class Hotels1View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var hotels: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Hotels"

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: setupFilterButton())

		tableView.register(UINib(nibName: "Hotels1Cell", bundle: nil), forCellReuseIdentifier: "Hotels1Cell")

		tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 15))

		loadData()
	}

	// MARK: - Navigation methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setupFilterButton() -> UIButton {

		let imageAttachment = NSTextAttachment()
		imageAttachment.image = UIImage(systemName: "slider.horizontal.3")?.withTintColor(AppColor.Theme)
		imageAttachment.bounds = CGRect(x: 0, y: -3, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)

		let attachmentString = NSAttributedString(attachment: imageAttachment)
		let completeText = NSMutableAttributedString(string: "Filters")
		let spaceText = NSMutableAttributedString(string: " ")
		completeText.append(spaceText)

		completeText.append(attachmentString)
		completeText.addAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], range: NSRange(location: 0, length: 7))

		let button = UIButton()
		button.setAttributedTitle(completeText, for: .normal)
		button.addTarget(self, action: #selector(actionFilter), for: .touchUpInside)
		return button
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		hotels.removeAll()

		var dict1: [String: String] = [:]
		dict1["ratings"] = "7.5"
		dict1["name"] = "Ibis Deira City Centre"
		dict1["address"] = "454 Vaughn Falls Apt. 087"
		dict1["amount"] = "$75p/n"
		hotels.append(dict1)

		var dict2: [String: String] = [:]
		dict2["ratings"] = "8.5"
		dict2["name"] = "Millennium Dubai Airport Hotel"
		dict2["address"] = "991 Vaughn Falls Apt. 111"
		dict2["amount"] = "$100p/n"
		hotels.append(dict2)

		var dict3: [String: String] = [:]
		dict3["ratings"] = "6.5"
		dict3["name"] = "Ibis Deira City Centre"
		dict3["address"] = "112 Vaughn Falls Apt. 009"
		dict3["amount"] = "$66p/n"
		hotels.append(dict3)

		var dict4: [String: String] = [:]
		dict4["ratings"] = "9.0"
		dict4["name"] = "Millennium Dubai Airport Hotel"
		dict4["address"] = "220 Vaughn Falls Apt. 098"
		dict4["amount"] = "$95p/n"
		hotels.append(dict4)

		var dict5: [String: String] = [:]
		dict5["ratings"] = "7.0"
		dict5["name"] = "Ibis Deira City Centre"
		dict5["address"] = "120 Vaughn Falls Apt. 076"
		dict5["amount"] = "$120p/n"
		hotels.append(dict5)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFilter() {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Hotels1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return hotels.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return view.frame.size.height / 2.5
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Hotels1Cell", for: indexPath) as! Hotels1Cell
		cell.bindData(index: indexPath.item, hotel: hotels[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Hotels1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}

