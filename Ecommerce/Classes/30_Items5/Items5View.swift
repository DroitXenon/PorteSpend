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
class Items5View: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var collectionViewMenu: UICollectionView!
	@IBOutlet var collectionViewProducts: UICollectionView!

	private var selectedMenuIndex = 0
	private var menus: [String] = []
	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		labelTitle.text = "Clothing"
		labelSubTitle.text = "73.3K items"

		collectionViewMenu.register(UINib(nibName: "Items5Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Items5Cell1")
		collectionViewProducts.register(UINib(nibName: "Items5Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Items5Cell2")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setBackground(color: .clear)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setNavigationBar()
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		menus.removeAll()
		products.removeAll()

		menus.append("Coats")
		menus.append("Denim")
		menus.append("Jackets")
		menus.append("Shirts")
		menus.append("Shorts")
		menus.append("Sweaters")
		menus.append("Coats")
		menus.append("Denim")
		menus.append("Jackets")
		menus.append("Shirts")
		menus.append("Shorts")
		menus.append("Sweaters")

		var dict1: [String: String] = [:]
		dict1["title"] = "Printed Slim Fit Casual Shirt"
		dict1["brand"] = "Spykar"
		dict1["price"] = "$599"
		dict1["originalPrice"] = "$1099"
		dict1["items"] = "0"
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Blue Full Sleeves Formal Shirt"
		dict2["brand"] = "Peter England"
		dict2["price"] = "$760"
		dict2["originalPrice"] = ""
		dict2["items"] = "0"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Van Heusen Grey Shirt"
		dict3["brand"] = "Van Heusen"
		dict3["price"] = "$463"
		dict3["originalPrice"] = ""
		dict3["items"] = "0"
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Black Barocco Track Jacket"
		dict4["brand"] = "Versace"
		dict4["price"] = "$1500"
		dict4["originalPrice"] = "$2100"
		dict4["items"] = "0"
		products.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Permapress White Shirt"
		dict5["brand"] = "Louis Phillipe"
		dict5["price"] = "$999"
		dict5["originalPrice"] = ""
		dict5["items"] = "0"
		products.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Regular fit Casual Shirt"
		dict6["brand"] = "Red Tape"
		dict6["price"] = "$799"
		dict6["originalPrice"] = ""
		dict6["items"] = "0"
		products.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Slim fit Casual Shirt"
		dict7["brand"] = "KILLER"
		dict7["price"] = "$879"
		dict7["originalPrice"] = "$1250"
		dict7["items"] = "0"
		products.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "Full Sleeve Casual Shirt"
		dict8["brand"] = "Campus Sutra"
		dict8["price"] = "$780"
		dict8["originalPrice"] = ""
		dict8["items"] = "0"
		products.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = "Solid Regular Fit Casual Shirt"
		dict9["brand"] = "Jack & Jones"
		dict9["price"] = "$1299"
		dict9["originalPrice"] = "2500"
		dict9["items"] = "0"
		products.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Checkered Slim fit Shirt"
		dict10["brand"] = "Indian Terrain"
		dict10["price"] = "$1209"
		dict10["originalPrice"] = ""
		dict10["items"] = "0"
		products.append(dict10)

		refreshCollectionViewProducts()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewProducts() {

		collectionViewProducts.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items5View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionViewMenu == collectionView) { return menus.count }
		if (collectionViewProducts == collectionView) { return products.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionViewMenu == collectionView) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Items5Cell1", for: indexPath) as! Items5Cell1
			cell.bindData(title: menus[indexPath.row])
			cell.set(isSelected: (indexPath.row == selectedMenuIndex))
			return cell
		}
		if (collectionViewProducts == collectionView) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Items5Cell2", for: indexPath) as! Items5Cell2
			cell.bindData(index: indexPath, data: products[indexPath.row])
			cell.buttonMore.tag = indexPath.row
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items5View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		if (collectionViewMenu == collectionView) {
			selectedMenuIndex = indexPath.row
			collectionViewMenu.reloadItems(at: collectionViewMenu.indexPathsForVisibleItems)
			collectionViewMenu.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
		}
		if (collectionViewProducts == collectionView) {

		}
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items5View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-45)/2
		let height = collectionView.frame.size.height

		if (collectionViewMenu == collectionView) { return CGSize(width: 80, height: height-20) }
		if (collectionViewProducts == collectionView) { return CGSize(width: width, height: (width*1.6)) }

		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionViewMenu == collectionView) {}
		if (collectionViewProducts == collectionView) { return 15 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionViewMenu == collectionView) {}
		if (collectionViewProducts == collectionView) { return 15 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionViewMenu == collectionView) { return UIEdgeInsets(top: 20, left: 15, bottom: 0, right: 15) }
		if (collectionViewProducts == collectionView) { return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15) }

		return UIEdgeInsets.zero
	}
}
