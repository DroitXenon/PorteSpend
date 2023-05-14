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
class PlacesView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var places: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Places"

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: setupFilterButton())

		tableView.register(UINib(nibName: "PlacesCell1", bundle: nil), forCellReuseIdentifier: "PlacesCell1")

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

		places.removeAll()

		var dict1: [String: String] = [:]
		dict1["images"] = "8"
		dict1["name"] = "Playa del Carmen"
		dict1["description"] = "Before you took that first cruise, your thoughts about cruise ships and cruise vacations"
		dict1["location"] = "Peru"
		dict1["photos"] = "49 photos"
		places.append(dict1)

		var dict2: [String: String] = [:]
		dict2["images"] = "12"
		dict2["name"] = "Yangshuo"
		dict2["description"] = "When you type the website name on your address bar, a simple yet classy homepage."
		dict2["location"] = "China"
		dict2["photos"] = "81 photos"
		places.append(dict2)

		var dict3: [String: String] = [:]
		dict3["images"] = "16"
		dict3["name"] = "Playa del Carmen"
		dict3["description"] = "Before you took that first cruise, your thoughts about cruise ships and cruise vacations"
		dict3["location"] = "Peru"
		dict3["photos"] = "49 photos"
		places.append(dict3)

		var dict4: [String: String] = [:]
		dict4["images"] = "20"
		dict4["name"] = "Yangshuo"
		dict4["description"] = "When you type the website name on your address bar, a simple yet classy homepage."
		dict4["location"] = "China"
		dict4["photos"] = "81 photos"
		places.append(dict4)

		var dict5: [String: String] = [:]
		dict5["images"] = "8"
		dict5["name"] = "Playa del Carmen"
		dict5["description"] = "Before you took that first cruise, your thoughts about cruise ships and cruise vacations"
		dict5["location"] = "Peru"
		dict5["photos"] = "49 photos"
		places.append(dict5)

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
extension PlacesView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return places.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell1", for: indexPath) as! PlacesCell1
		cell.bindData(index: indexPath.item, place: places[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension PlacesView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
