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
class RecipesList2View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var viewSortBy: UIView!
	@IBOutlet var viewFilters: UIView!

	private var recipes: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Recipes"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(actionSearch(_:)))

		viewSortBy.layer.borderWidth = 1
		viewSortBy.layer.borderColor = AppColor.Border.cgColor

		viewFilters.layer.borderWidth = 1
		viewFilters.layer.borderColor = AppColor.Border.cgColor

		collectionView.register(UINib(nibName: "RecipesList2Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "RecipesList2Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		recipes.removeAll()

		var dict1: [String: String] = [:]
		dict1["rate"] = "4.0"
		dict1["name"] = "Algernon Gaudin"
		dict1["foodName"] = "Oven-Fried Ranch Chicken"
		dict1["duration"] = "30 min"
		dict1["people"] = "12"
		recipes.append(dict1)

		var dict2: [String: String] = [:]
		dict2["rate"] = "2.4"
		dict2["name"] = "Jamie Stille"
		dict2["foodName"] = "Garlic Cheese Bread Sticks"
		dict2["duration"] = "25 min"
		dict2["people"] = "65"
		recipes.append(dict2)

		var dict3: [String: String] = [:]
		dict3["rate"] = "3.1"
		dict3["name"] = "Kippy Waltering"
		dict3["foodName"] = "Asian prawn & quinoa salad"
		dict3["duration"] = "1h 15 min"
		dict3["people"] = "22"
		recipes.append(dict3)

		var dict4: [String: String] = [:]
		dict4["rate"] = "4.9"
		dict4["name"] = "Karlee Aronin"
		dict4["foodName"] = "Easy peasy lentil curry"
		dict4["duration"] = "50 min"
		dict4["people"] = "8"
		recipes.append(dict4)

		var dict5: [String: String] = [:]
		dict5["rate"] = "3.4"
		dict5["name"] = "Dido Andryszczak"
		dict5["foodName"] = "Chickpea & roasted parsnip curry"
		dict5["duration"] = "30 min"
		dict5["people"] = "51"
		recipes.append(dict5)

		var dict6: [String: String] = [:]
		dict6["rate"] = "1.6"
		dict6["name"] = "Mariette Woodhall"
		dict6["foodName"] = "Spicy root & lentil casserole"
		dict6["duration"] = "25 min"
		dict6["people"] = "65"
		recipes.append(dict6)

		var dict7: [String: String] = [:]
		dict7["rate"] = "4.0"
		dict7["name"] = "Edlin Barendtsen"
		dict7["foodName"] = "Easiest ever vegan gravy"
		dict7["duration"] = "1h 5 min"
		dict7["people"] = "24"
		recipes.append(dict7)

		var dict8: [String: String] = [:]
		dict8["rate"] = "1.9"
		dict8["name"] = "Ame Ketton"
		dict8["foodName"] = "Shakshuka flatbread bake"
		dict8["duration"] = "1h 40 min"
		dict8["people"] = "28"
		recipes.append(dict8)

		var dict9: [String: String] = [:]
		dict9["rate"] = "1.5"
		dict9["name"] = "Ricki Paddington"
		dict9["foodName"] = "Easy risotto with bacon & peas"
		dict9["duration"] = "45 min"
		dict9["people"] = "49"
		recipes.append(dict9)

		var dict10: [String: String] = [:]
		dict10["rate"] = "4.9"
		dict10["name"] = "Marianne Krysztowczyk"
		dict10["foodName"] = "Easy ratatouille with poached eggs"
		dict10["duration"] = "32 min"
		dict10["people"] = "16"
		recipes.append(dict10)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSearch(_ sender: UIButton) {

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
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RecipesList2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return recipes.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipesList2Cell", for: indexPath) as! RecipesList2Cell
		cell.bindData(index: indexPath.item, data: recipes[indexPath.row])
		cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RecipesList2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RecipesList2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-30)
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
