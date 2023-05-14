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
class MarketView: UIViewController {

	@IBOutlet var viewFilters: UIView!

	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var tableView: UITableView!

	var coins: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Markets"
		navigationController?.navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewFilters)

		tableView.register(UINib(nibName: "MarketsCell", bundle: Bundle.main), forCellReuseIdentifier: "MarketsCell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		coins.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Bitcoin"
		dict1["coin_id"] = "BTC"
		dict1["amount"] = "$6,891.43"
		dict1["percentage"] = "0.14%"
		dict1["isPlus"] = "Minus"
		coins.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Ethereum"
		dict2["coin_id"] = "ETH"
		dict2["amount"] = "$172.63"
		dict2["percentage"] = "0.60%"
		dict2["isPlus"] = "Minus"
		coins.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "XRP"
		dict3["coin_id"] = "XRP"
		dict3["amount"] = "$0.184484"
		dict3["percentage"] = "0.04%"
		dict3["isPlus"] = "Plus"
		coins.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Tether"
		dict4["coin_id"] = "USDT"
		dict4["amount"] = "$1.01"
		dict4["percentage"] = "0.01%"
		dict4["isPlus"] = "Plus"
		coins.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Litecoin"
		dict5["coin_id"] = "LTC"
		dict5["amount"] = "$40.85"
		dict5["percentage"] = "0.47%"
		dict5["isPlus"] = "Plus"
		coins.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Bitcoin Cash"
		dict6["coin_id"] = "BCH"
		dict6["amount"] = "$221.47"
		dict6["percentage"] = "0.15%"
		dict6["isPlus"] = "Plus"
		coins.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Binance Coin"
		dict7["coin_id"] = "BNB"
		dict7["amount"] = "$15.22"
		dict7["percentage"] = "1.07%"
		dict7["isPlus"] = "Minus"
		coins.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "EOS"
		dict8["coin_id"] = "EOS"
		dict8["amount"] = "$2.54"
		dict8["percentage"] = "0.18%"
		dict8["isPlus"] = "Plus"
		coins.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Chainlink"
		dict9["coin_id"] = "LINK"
		dict9["amount"] = "$3.49"
		dict9["percentage"] = "1.34%"
		dict9["isPlus"] = "Minus"
		coins.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "Tezos"
		dict10["coin_id"] = "XTZ"
		dict10["amount"] = "$2.19"
		dict10["percentage"] = "1.26%"
		dict10["isPlus"] = "Plus"
		coins.append(dict10)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFilters(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension MarketView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return coins.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "MarketsCell", for: indexPath) as! MarketsCell
		cell.bindData(index: indexPath, data: coins[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension MarketView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 70
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
