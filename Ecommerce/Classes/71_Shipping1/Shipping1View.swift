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
class Shipping1View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var selectedAddress = 0
	private var addresses: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Shipping Address"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(actionAdd(_:)))

		tableView.register(UINib(nibName: "Shipping1Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Shipping1Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		addresses.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Alan Nickerson"
		dict1["address1"] = "2552  Hope Street"
		dict1["address2"] = "West Virginia, United States"
		dict1["address3"] = "25778"
		dict1["contactNo"] = "+1(513)616-5999"
		addresses.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Brian Elwood"
		dict2["address1"] = "275  Fieldcrest Road"
		dict2["address2"] = "New York, United States"
		dict2["address3"] = "10013"
		dict2["contactNo"] = "+1(513)616-5999"
		addresses.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Chris Michael"
		dict3["address1"] = "2252  Fairfield Road"
		dict3["address2"] = "Iowa, United States"
		dict3["address3"] = "50318"
		dict3["contactNo"] = "+1(513)616-5999"
		addresses.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Dave Smith"
		dict4["address1"] = "1091  Charmaine Lane"
		dict4["address2"] = "Texas, United States"
		dict4["address3"] = "79401"
		dict4["contactNo"] = "+1(513)616-5999"
		addresses.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Egon Pratt"
		dict5["address1"] = "256  Lucky Duck Drive"
		dict5["address2"] = "Pennsylvania, United States"
		dict5["address3"] = "15212"
		dict5["contactNo"] = "+1(513)616-5999"
		addresses.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Fernando Harris"
		dict6["address1"] = "2645  Chestnut Street"
		dict6["address2"] = "Florida, United States"
		dict6["address3"] = "33619"
		dict6["contactNo"] = "+1(513)616-5999"
		addresses.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Betty Hansen"
		dict7["address1"] = "551  Losh Lane"
		dict7["address2"] = "Pennsylvania, United States"
		dict7["address3"] = "15212"
		dict7["contactNo"] = "+1(513)616-5999"
		addresses.append(dict7)

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
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionShippingMethod(_ sender: UIButton) {

		print(#function)
		view.endEditing(true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionEdit(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Shipping1View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return addresses.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Shipping1Cell1", for: indexPath) as! Shipping1Cell1
		cell.bindData(data: addresses[indexPath.row])
		cell.setCell(isSelected: (selectedAddress == indexPath.row))
		cell.buttonEdit.addTarget(self, action: #selector(actionEdit(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Shipping1View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)

		selectedAddress = indexPath.row
		tableView.reloadData()
	}
}
