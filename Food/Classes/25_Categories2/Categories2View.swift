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
class Categories2View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!

	private var menus: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Menu"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		collectionView.register(UINib(nibName: "Categories2Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Categories2Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		menus.removeAll()

		var dict1: [String: String] = [:]
		dict1["menu"] = "Dinner"
		dict1["recipeCount"] = "65"
		menus.append(dict1)

		var dict2: [String: String] = [:]
		dict2["menu"] = "Lunch"
		dict2["recipeCount"] = "83"
		menus.append(dict2)

		var dict3: [String: String] = [:]
		dict3["menu"] = "Desserts"
		dict3["recipeCount"] = "76"
		menus.append(dict3)

		var dict4: [String: String] = [:]
		dict4["menu"] = "Beverages"
		dict4["recipeCount"] = "87"
		menus.append(dict4)

		var dict5: [String: String] = [:]
		dict5["menu"] = "Summer"
		dict5["recipeCount"] = "38"
		menus.append(dict5)

		var dict6: [String: String] = [:]
		dict6["menu"] = "Camping"
		dict6["recipeCount"] = "46"
		menus.append(dict6)

		var dict7: [String: String] = [:]
		dict7["menu"] = "Dinner Party"
		dict7["recipeCount"] = "62"
		menus.append(dict7)

		var dict8: [String: String] = [:]
		dict8["menu"] = "Party food"
		dict8["recipeCount"] = "94"
		menus.append(dict8)

		var dict9: [String: String] = [:]
		dict9["menu"] = "Picnic"
		dict9["recipeCount"] = "98"
		menus.append(dict9)

		var dict10: [String: String] = [:]
		dict10["menu"] = "Winter"
		dict10["recipeCount"] = "93"
		menus.append(dict10)

		var dict11: [String: String] = [:]
		dict11["menu"] = "Sunday lunch"
		dict11["recipeCount"] = "34"
		menus.append(dict11)

		var dict12: [String: String] = [:]
		dict12["menu"] = "School holiday"
		dict12["recipeCount"] = "54"
		menus.append(dict12)

		var dict13: [String: String] = [:]
		dict13["menu"] = "Roasts"
		dict13["recipeCount"] = "81"
		menus.append(dict13)

		var dict14: [String: String] = [:]
		dict14["menu"] = "Vegan"
		dict14["recipeCount"] = "67"
		menus.append(dict14)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return menus.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Categories2Cell", for: indexPath) as! Categories2Cell
		cell.bindData(index: indexPath.item, data: menus[indexPath.row])
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-45)/2
		return CGSize(width: width, height: (width*0.8))
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 15
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 15
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
	}
}
