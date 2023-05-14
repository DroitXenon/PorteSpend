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
class Search2View: UIViewController {

	@IBOutlet var collectionViewMenu: UICollectionView!
	@IBOutlet var tableView: UITableView!

	@IBOutlet var viewHeaderTrending: UIView!
	@IBOutlet var viewHeaderRecent: UIView!

	@IBOutlet var cellTrending: UITableViewCell!
	@IBOutlet var collectionViewTrending: UICollectionView!

	private var selectedMenuIndex = 0
	private var menus: [String] = []
	private var trendings: [[String: String]] = []
	private var recents: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationController?.navigationBar.isHidden = true

		collectionViewMenu.register(UINib(nibName: "Search2Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Search2Cell1")
		collectionViewTrending.register(UINib(nibName: "Search2Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Search2Cell2")

		tableView.register(UINib(nibName: "Search2Cell3", bundle: Bundle.main), forCellReuseIdentifier: "Search2Cell3")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		menus.removeAll()
		trendings.removeAll()
		recents.removeAll()

		menus.append("Tab")
		menus.append("Tab")
		menus.append("Tab")

		recents.append("Shoes")
		recents.append("Coats")
		recents.append("Beachwear")
		recents.append("Shoes")
		recents.append("Coats")
		recents.append("Beachwear")
		recents.append("Shoes")
		recents.append("Coats")
		recents.append("Beachwear")

		var dict1: [String: String] = [:]
		dict1["title"] = "Jewellery"
		dict1["info"] = "This versatile T-shirt can be styled any way you like for the ultimate gym-to-street look"
		trendings.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Shoes"
		dict2["info"] = "Trainers with a padded top edge and lacing at the front. Mesh linings and insoles and rubber soles"
		trendings.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Jeans"
		dict3["info"] = "Black dark wash 5-pocket mid-rise jeans, clean look, no fade, has a button and zip closure, and waistband with belt loops"
		trendings.append(dict3)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewMenu() {

		collectionViewMenu.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewTrending() {

		collectionViewTrending.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Search2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		if (collectionView == collectionViewMenu)		{ return 1	}
		if (collectionView == collectionViewTrending)	{ return 1	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionViewMenu)		{ return menus.count		}
		if (collectionView == collectionViewTrending)	{ return trendings.count	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewMenu) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Search2Cell1", for: indexPath) as! Search2Cell1
			cell.bindData(title: menus[indexPath.row])
			cell.set(isSelected: (indexPath.row == selectedMenuIndex))
			return cell
		}

		if (collectionView == collectionViewTrending) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Search2Cell2", for: indexPath) as! Search2Cell2
			cell.bindData(index: indexPath.item, data: trendings[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Search2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		if (collectionView == collectionViewMenu) {
			selectedMenuIndex = indexPath.row
			collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
		}

		if (collectionView == collectionViewTrending) {

		}
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Search2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width
		let height = collectionView.frame.size.height

		if (collectionView == collectionViewMenu) { return CGSize(width: (width-30)/3, height: height) }
		if (collectionView == collectionViewTrending) { return CGSize(width: width-80, height: height-30) }

		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewMenu)		{ return 0	}
		if (collectionView == collectionViewTrending)	{ return 2	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewMenu)		{ return 0	}
		if (collectionView == collectionViewTrending)	{ return 2	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionViewMenu)		{ return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)	}
		if (collectionView == collectionViewTrending)	{ return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)	}

		return UIEdgeInsets.zero
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Search2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 1				}
		if (section == 1) { return recents.count	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) { return cellTrending }

		if (indexPath.section == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Search2Cell3", for: indexPath) as! Search2Cell3
			cell.bindData(title: recents[indexPath.row])
			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Search2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		dismiss(animated: true, completion: nil)
		if (indexPath.section == 1) {

		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 60 }
		if (section == 1) { return 60 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		if (section == 0) { return viewHeaderTrending	}
		if (section == 1) { return viewHeaderRecent		}

		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 130	}
		if (indexPath.section == 1) { return 60		}

		return 0
	}
}
