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
class RestaurantsList2View: UIViewController {

	@IBOutlet var segmentedControl: UISegmentedControl!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var viewSortBy: UIView!
	@IBOutlet var viewFilters: UIView!

	private var restaurants: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.titleView = segmentedControl
		navigationItem.titleView?.frame = CGRect(x: 0, y: 0, width: 200, height: 30)

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))

		tableView.register(UINib(nibName: "RestaurantsList2Cell", bundle: Bundle.main), forCellReuseIdentifier: "RestaurantsList2Cell")

		viewSortBy.layer.borderWidth = 1
		viewSortBy.layer.borderColor = AppColor.Border.cgColor

		viewFilters.layer.borderWidth = 1
		viewFilters.layer.borderColor = AppColor.Border.cgColor

		updateUI()
		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		restaurants.removeAll()

		var dict1: [String: String] = [:]
		dict1["rate"] = "4.0"
		dict1["name"] = "Algernon Gaudin"
		dict1["info"] = "77 Prairieview Drive"
		dict1["distance"] = "3.7"
		restaurants.append(dict1)

		var dict2: [String: String] = [:]
		dict2["rate"] = "2.4"
		dict2["name"] = "Jamie Stille"
		dict2["info"] = "23 Becker Junction"
		dict2["distance"] = "4.2"
		restaurants.append(dict2)

		var dict3: [String: String] = [:]
		dict3["rate"] = "3.1"
		dict3["name"] = "Kippy Waltering"
		dict3["info"] = "281 Ludington Alley"
		dict3["distance"] = "2.2"
		restaurants.append(dict3)

		var dict4: [String: String] = [:]
		dict4["rate"] = "4.9"
		dict4["name"] = "Karlee Aronin"
		dict4["info"] = "7171 Stang Junction"
		dict4["distance"] = "5.5"
		restaurants.append(dict4)

		var dict5: [String: String] = [:]
		dict5["rate"] = "3.4"
		dict5["name"] = "Dido Andryszczak"
		dict5["info"] = "1281 Ridgeway Hill"
		dict5["distance"] = "2.8"
		restaurants.append(dict5)

		var dict6: [String: String] = [:]
		dict6["rate"] = "1.6"
		dict6["name"] = "Mariette Woodhall"
		dict6["info"] = "09132 Claremont Parkway"
		dict6["distance"] = "6.4"
		restaurants.append(dict6)

		var dict7: [String: String] = [:]
		dict7["rate"] = "4.0"
		dict7["name"] = "Edlin Barendtsen"
		dict7["info"] = "514 Bellgrove Point"
		dict7["distance"] = "5.2"
		restaurants.append(dict7)

		var dict8: [String: String] = [:]
		dict8["rate"] = "3.0"
		dict8["name"] = "The supper club"
		dict8["info"] = "8 Harper Park"
		dict8["distance"] = "54.92"
		restaurants.append(dict8)

		var dict9: [String: String] = [:]
		dict9["rate"] = "2.7"
		dict9["name"] = "Rabbit food house"
		dict9["info"] = "641 Grim Center"
		dict9["distance"] = "3.4"
		restaurants.append(dict9)

		var dict10: [String: String] = [:]
		dict10["rate"] = "4.8"
		dict10["name"] = "Sandwich Society"
		dict10["info"] = "47 Sullivan Parkway"
		dict10["distance"] = "2.9"
		restaurants.append(dict10)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		let background = UIColor.systemBackground.image(segmentedControl.frame.size)
		let selected = AppColor.Theme.image(segmentedControl.frame.size)

		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
		segmentedControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
		segmentedControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
		segmentedControl.layer.borderWidth = 1
		segmentedControl.layer.borderColor = AppColor.Theme.cgColor
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSortBy(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFilter(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFavorite(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSegmentChange(_ sender: UISegmentedControl) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RestaurantsList2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return restaurants.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsList2Cell", for: indexPath) as! RestaurantsList2Cell
		cell.bindData(index: indexPath.item, data: restaurants[indexPath.row])
		cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RestaurantsList2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 110
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}
}

// MARK: - UIColor
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension UIColor {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

		return UIGraphicsImageRenderer(size: size).image { rendererContext in
			setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}
