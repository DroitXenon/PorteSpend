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
class Menu2View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var menus: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Menu"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		tableView.register(UINib(nibName: "Menu2Cell", bundle: Bundle.main), forCellReuseIdentifier: "Menu2Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		menus.removeAll()

		var data1: [[String: String]] = []
		var data2: [[String: String]] = []
		var data3: [[String: String]] = []

		var dict1: [String: String] = [:]
		dict1["name"] = "Vegan chickpea curry jacket potatoes"
		dict1["info"] = "Get some protein into a vegan"
		dict1["price"] = "$39"
		data1.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Satay sweet potato curry"
		dict2["info"] = "Cook this tasty vegan curry for an exotic yet easy family dinner."
		dict2["price"] = "$64"
		data1.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Baked falafel & cauliflower tabbouleh"
		dict3["info"] = "Make a batch of our easy baked falafel for a tasty, low-calorie lunch option"
		dict3["price"] = "$82"
		data1.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Boom Bang-a-Bang chicken cups"
		dict4["info"] = "Classic British Coronation chicken gets a makeover"
		dict4["price"] = "$36"
		data1.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Chicken terrine with leeks & apricots"
		dict5["info"] = "Whet the appetite for the main event by serving guests this special chicken"
		dict5["price"] = "$44"
		data1.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Salmon & spinach with tartare cream"
		dict6["info"] = "Ever-versatile salmon is as popular on our shopping lists as chicken"
		dict6["price"] = "$50"
		data1.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Orange & blueberry Bircher"
		dict7["info"] = "Soaking oats and seeds overnight makes them easily digestible."
		dict7["price"] = "$60"
		data1.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Creamy barley & squash risotto"
		dict8["info"] = "Barley is cheaper and lighter than Italian risotto rice"
		dict8["price"] = "$73"
		data2.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Green cucumber & mint gazpacho"
		dict9["info"] = "This zingy, no-cook soup is packed with four of your five-a-day"
		dict9["price"] = "$55"
		data2.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "Cranberry chicken salad"
		dict10["info"] = "Use up leftover cranberry sauce in this healthy salad."
		dict10["price"] = "$71"
		data2.append(dict10)

		var dict11: [String: String] = [:]
		dict11["name"] = "Beetroot, goat's cheese & tarragon salad"
		dict11["info"] = "A fresh way to sereve beetroot that counts as one of your 5-a-day."
		dict11["price"] = "$65"
		data3.append(dict11)

		var dict12: [String: String] = [:]
		dict12["name"] = "Spicy salmon & lentils"
		dict12["info"] = "This dish is easy to cook but still packed full of flavour."
		dict12["price"] = "$50"
		data3.append(dict12)

		var dict13: [String: String] = [:]
		dict13["name"] = "Lentil ragu with courgetti"
		dict13["info"] = "A healthy tomato 'pasta' dish that makes full use of your spiralizer."
		dict13["price"] = "$49"
		data3.append(dict13)

		var dict14: [String: String] = [:]
		dict14["name"] = "Basque-style salmon stew"
		dict14["info"] = "These peppery paprika lamb skewers are barbecue friendly."
		dict14["price"] = "$47"
		data3.append(dict14)

		var dict15: [String: String] = [:]
		dict15["name"] = "Vegan pizza Margherita"
		dict15["info"] = "Vegans needn't miss out on pizza Margherita."
		dict15["price"] = "$39"
		data3.append(dict15)

		var dataDict1: [String: Any] = [:]
		dataDict1["name"] = "Appetizers"
		dataDict1["dishes"] = data1
		menus.append(dataDict1)

		var dataDict2: [String: Any] = [:]
		dataDict2["name"] = "Soup"
		dataDict2["dishes"] = data2
		menus.append(dataDict2)

		var dataDict3: [String: Any] = [:]
		dataDict3["name"] = "Vegetarian"
		dataDict3["dishes"] = data3
		menus.append(dataDict3)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Menu2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return menus.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if let dishes = menus[section]["dishes"] as? [[String: String]] {
			return dishes.count
		}
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Menu2Cell", for: indexPath) as! Menu2Cell
		if let dishes = menus[indexPath.section]["dishes"] as? [[String: String]] {
			cell.bindData(index: indexPath.item + (indexPath.section * 8), data: dishes[indexPath.row])
		}
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Menu2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 75
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 40
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if let name = menus[section]["name"] as? String {
			return name
		}
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			header.textLabel?.text = header.textLabel?.text?.capitalized
			header.textLabel?.textColor = UIColor.label
			header.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
	}
}
