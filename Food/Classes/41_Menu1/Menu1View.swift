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
class Menu1View: UIViewController {

	@IBOutlet var collectionViewMenu: UICollectionView!
	@IBOutlet var collectionViewProducts: UICollectionView!

	private var menus: [String] = []
	private var dishes: [[String: String]] = []
	private var selectedMenu = 0

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Menu"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		collectionViewMenu.register(UINib(nibName: "Menu1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Menu1Cell1")
		collectionViewProducts.register(UINib(nibName: "Menu1Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Menu1Cell2")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		menus.removeAll()
		dishes.removeAll()

		menus.append("APPETIZERS")
		menus.append("SOUP")
		menus.append("CAVIAR")
		menus.append("FISH")
		menus.append("VEGETARIAN")

		var dict1: [String: String] = [:]
		dict1["rate"] = "4.0"
		dict1["name"] = "Vegan chickpea curry jacket potatoes"
		dict1["info"] = "Get some protein into a vegan"
		dict1["price"] = "$39"
		dishes.append(dict1)

		var dict2: [String: String] = [:]
		dict2["rate"] = "2.4"
		dict2["name"] = "Satay sweet potato curry"
		dict2["info"] = "Cook this tasty vegan curry for an exotic yet easy family dinner."
		dict2["price"] = "$64"
		dishes.append(dict2)

		var dict3: [String: String] = [:]
		dict3["rate"] = "3.1"
		dict3["name"] = "Baked falafel & cauliflower tabbouleh"
		dict3["info"] = "Make a batch of our easy baked falafel for a tasty, low-calorie lunch option"
		dict3["price"] = "$82"
		dishes.append(dict3)

		var dict4: [String: String] = [:]
		dict4["rate"] = "4.9"
		dict4["name"] = "Boom Bang-a-Bang chicken cups"
		dict4["info"] = "Classic British Coronation chicken gets a makeover"
		dict4["price"] = "$36"
		dishes.append(dict4)

		var dict5: [String: String] = [:]
		dict5["rate"] = "3.4"
		dict5["name"] = "Chicken terrine with leeks & apricots"
		dict5["info"] = "Whet the appetite for the main event by serving guests this special chicken"
		dict5["price"] = "$44"
		dishes.append(dict5)

		var dict6: [String: String] = [:]
		dict6["rate"] = "1.6"
		dict6["name"] = "Salmon & spinach with tartare cream"
		dict6["info"] = "Ever-versatile salmon is as popular on our shopping lists as chicken"
		dict6["price"] = "$50"
		dishes.append(dict6)

		var dict7: [String: String] = [:]
		dict7["rate"] = "4.0"
		dict7["name"] = "Orange & blueberry Bircher"
		dict7["info"] = "Soaking oats and seeds overnight makes them easily digestible."
		dict7["price"] = "$60"
		dishes.append(dict7)

		var dict8: [String: String] = [:]
		dict8["rate"] = "3.0"
		dict8["name"] = "Creamy barley & squash risotto"
		dict8["info"] = "Barley is cheaper and lighter than Italian risotto rice"
		dict8["price"] = "$73"
		dishes.append(dict8)

		var dict9: [String: String] = [:]
		dict9["rate"] = "2.7"
		dict9["name"] = "Green cucumber & mint gazpacho"
		dict9["info"] = "This zingy, no-cook soup is packed with four of your five-a-day"
		dict9["price"] = "$55"
		dishes.append(dict9)

		var dict10: [String: String] = [:]
		dict10["rate"] = "4.8"
		dict10["name"] = "Cranberry chicken salad"
		dict10["info"] = "Use up leftover cranberry sauce in this healthy salad."
		dict10["price"] = "$71"
		dishes.append(dict10)

		refreshCollectionViewMenu()
		refreshCollectionViewProducts()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewMenu() {

		collectionViewMenu.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewProducts() {

		collectionViewProducts.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFavorite(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCart(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Menu1View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionViewMenu)		{ return menus.count	}
		if (collectionView == collectionViewProducts)	{ return dishes.count	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewMenu) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Menu1Cell1", for: indexPath) as! Menu1Cell1
			cell.bindData(menu: menus[indexPath.row])
			cell.set(isSelected: (selectedMenu == indexPath.row))
			return cell
		}

		if (collectionView == collectionViewProducts) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Menu1Cell2", for: indexPath) as! Menu1Cell2
			cell.bindData(index: indexPath.item, data: dishes[indexPath.row])
			cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
			cell.buttonCart.addTarget(self, action: #selector(actionCart(_:)), for: .touchUpInside)
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Menu1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		if (collectionView == collectionViewMenu) {
			selectedMenu = indexPath.row
			collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
		}
		if (collectionView == collectionViewProducts) { }
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Menu1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		if (collectionView == collectionViewMenu) {
			let textWidth = menus[indexPath.row].uppercased().width(withConstrainedHeight: 20, font: UIFont.boldSystemFont(ofSize: 12))
			return CGSize(width: textWidth + 25, height: collectionView.frame.size.height-20)
		}

		if (collectionView == collectionViewProducts) {
			return CGSize(width: (collectionView.frame.size.width-45)/2, height: 250)
		}

		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewMenu) { return 10 }
		if (collectionView == collectionViewProducts) { return 10 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewMenu) { return 10 }
		if (collectionView == collectionViewProducts) { return 10 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionViewMenu) { return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15) }
		if (collectionView == collectionViewProducts) { return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15) }

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}

// MARK: - String
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension String {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.width)
	}
}
