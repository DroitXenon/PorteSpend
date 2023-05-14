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
class FiltersCategoryView: UIViewController {

	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var buttonViewItems: UIButton!

	private var selectedBrands: Set<IndexPath> = []
	private var brands: [[String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Filters"

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select All", style: .plain, target: self, action: #selector(actionSelectAll(_:)))

		searchBar.layer.borderWidth = 1
		searchBar.layer.borderColor = UIColor.systemBackground.cgColor

		tableView.tableHeaderView = searchBar

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {
		
		buttonViewItems.setTitle("View 313 Items", for: .normal)

		brands.removeAll()

		var brandsA:[String] = []
		brandsA.append("Adidas")
		brandsA.append("Adidas Originals")
		brandsA.append("Aldo")
		brandsA.append("Asics")
		brands.append(brandsA)

		var brandsB:[String] = []
		brandsB.append("Bershka")
		brandsB.append("Birkenstock")
		brandsB.append("Brooklyn Suply Co.")
		brands.append(brandsB)

		var brandsC:[String] = []
		brandsC.append("Calvin Klein")
		brands.append(brandsC)

		var brandsD:[String] = []
		brandsD.append("Doughnut")
		brands.append(brandsD)

		var brandsE:[String] = []
		brandsE.append("Earth")
		brandsE.append("Easy Spirit")
		brandsE.append("Eagle Creek")
		brands.append(brandsE)

		var brandsF:[String] = []
		brandsF.append("FAIRPLAY")
		brandsF.append("Falke")
		brandsF.append("Fashion Forms")
		brands.append(brandsF)

		var brandsG:[String] = []
		brandsG.append("Geox")
		brandsG.append("G-Shock")
		brands.append(brandsG)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSelectAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionViewItems(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersCategoryView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return brands.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return brands[section].count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
		if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

		cell.tintColor = AppColor.Theme
		cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		cell.accessoryType = selectedBrands.contains(indexPath) ? .checkmark : .none
		cell.textLabel?.text = brands[indexPath.section][indexPath.row]
		cell.textLabel?.font = UIFont.systemFont(ofSize: 16)

		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersCategoryView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 30
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if let firstLetter = brands[section].first?.first {
			return String(firstLetter).capitalized
		}

		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
		if selectedBrands.contains(indexPath) {
			selectedBrands.remove(indexPath)
		} else {
			selectedBrands.insert(indexPath)
		}
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}
}

// MARK: - UISearchControllerDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersCategoryView: UISearchControllerDelegate {

}
