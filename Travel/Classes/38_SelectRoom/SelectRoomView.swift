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
class SelectRoomView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var rooms: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationItem.setTitle("Select a room", subtitle: "Four Seasons Resort", color: nil)

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(actionMore))

		tableView.register(UINib(nibName: "SelectRoomCell1", bundle: nil), forCellReuseIdentifier: "SelectRoomCell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		rooms.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Playa del Carmen"
		dict1["description"] = "Occupying floors 51-59, this spacious suite enjoys beautiful views of Bangkok City."
		dict1["facility1"] = "70m'2"
		dict1["facility2"] = "Flat-screen TV "
		dict1["facility3"] = "Air Conditioning"
		dict1["facility4"] = "Free WiFi"
		dict1["images"] = "8"
		dict1["amount"] = "$75p/night"
		rooms.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Rice Terrace Pavillion"
		dict2["description"] = "When you type the website name on your address bar, a simple yet classy homepage."
		dict2["facility1"] = "70m'2"
		dict2["facility2"] = "Flat-screen TV "
		dict2["facility3"] = "Air Conditioning"
		dict2["facility4"] = "Free WiFi"
		dict2["images"] = "12"
		dict2["amount"] = "$100p/night"
		rooms.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Playa del Carmen"
		dict3["description"] = "Occupying floors 51-59, this spacious suite enjoys beautiful views of Bangkok City."
		dict3["facility1"] = "70m'2"
		dict3["facility2"] = "Flat-screen TV "
		dict3["facility3"] = "Air Conditioning"
		dict3["facility4"] = "Free WiFi"
		dict3["images"] = "16"
		dict3["amount"] = "$70p/night"
		rooms.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Rice Terrace Pavillion"
		dict4["description"] = "When you type the website name on your address bar, a simple yet classy homepage."
		dict4["facility1"] = "70m'2"
		dict4["facility2"] = "Flat-screen TV "
		dict4["facility3"] = "Air Conditioning"
		dict4["facility4"] = "Free WiFi"
		dict4["images"] = "20"
		dict4["amount"] = "$90p/night"
		rooms.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Playa del Carmen"
		dict5["description"] = "Occupying floors 51-59, this spacious suite enjoys beautiful views of Bangkok City."
		dict5["facility1"] = "70m'2"
		dict5["facility2"] = "Flat-screen TV "
		dict5["facility3"] = "Air Conditioning"
		dict5["facility4"] = "Free WiFi"
		dict5["images"] = "8"
		dict5["amount"] = "$120p/night"
		rooms.append(dict5)

		refreshTableView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore() {

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
extension SelectRoomView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return rooms.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "SelectRoomCell1", for: indexPath) as! SelectRoomCell1
		cell.bindData(index: indexPath.item, room: rooms[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SelectRoomView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		tableView.deselectRow(at: indexPath, animated: true)
	}
}
