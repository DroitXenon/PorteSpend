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
class RecipesList3View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!

	private var recipes: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Recipes"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(actionSearch(_:)))

		collectionView.register(UINib(nibName: "RecipesList3Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "RecipesList3Cell")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setBackground(color: .clear)
			navigationController?.navigationBar.standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)

		if let navBar = navigationController as? NavigationController {
			navBar.setNavigationBar()
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		recipes.removeAll()

		var dict1: [String: String] = [:]
		dict1["foodType"] = "American"
		dict1["rate"] = "3.8"
		dict1["foodName"] = "Bourbon, black cherry & bacon brownies"
		dict1["name"] = "Farrand Kadwallider"
		dict1["servings"] = "10"
		dict1["duration"] = "1h 20 min"
		dict1["calories"] = "291"
		recipes.append(dict1)

		var dict2: [String: String] = [:]
		dict2["foodType"] = "French"
		dict2["rate"] = "3.5"
		dict2["foodName"] = "Honey-roast confit of duck"
		dict2["name"] = "Wylie Stollberg"
		dict2["servings"] = "8"
		dict2["duration"] = "2h 45 min"
		dict2["calories"] = "262"
		recipes.append(dict2)

		var dict3: [String: String] = [:]
		dict3["foodType"] = "Seafood"
		dict3["rate"] = "4.0"
		dict3["foodName"] = "Family meals: Easy fish pie recipe"
		dict3["name"] = "Jenn Sisse"
		dict3["servings"] = "5"
		dict3["duration"] = "1h 5 min"
		dict3["calories"] = "220"
		recipes.append(dict3)

		var dict4: [String: String] = [:]
		dict4["foodType"] = "Curry"
		dict4["rate"] = "1.6"
		dict4["foodName"] = "Slow cooker vegetable curry"
		dict4["name"] = "Anna-maria Izhaky"
		dict4["servings"] = "5"
		dict4["duration"] = "6h 10 min"
		dict4["calories"] = "304"
		recipes.append(dict4)

		var dict5: [String: String] = [:]
		dict5["foodType"] = "Italian"
		dict5["rate"] = "1.7"
		dict5["foodName"] = "Gnocchi with parsley, butter & samphire"
		dict5["name"] = "Lani Brownsell"
		dict5["servings"] = "2"
		dict5["duration"] = "1h 15 min"
		dict5["calories"] = "392"
		recipes.append(dict5)

		var dict6: [String: String] = [:]
		dict6["foodType"] = "Mexican"
		dict6["rate"] = "1.8"
		dict6["foodName"] = "Black-eyed bean mole with salsa"
		dict6["name"] = "Dunc Lingner"
		dict6["servings"] = "4"
		dict6["duration"] = "23 min"
		dict6["calories"] = "254"
		recipes.append(dict6)

		var dict7: [String: String] = [:]
		dict7["foodType"] = "Mediterranean"
		dict7["rate"] = "1.7"
		dict7["foodName"] = "Spiced baked figs with ginger mascarpone"
		dict7["name"] = "Benedikt Eslinger"
		dict7["servings"] = "8"
		dict7["duration"] = "25 min"
		dict7["calories"] = "68"
		recipes.append(dict7)

		var dict8: [String: String] = [:]
		dict8["foodType"] = "Quiche"
		dict8["rate"] = "1.2"
		dict8["foodName"] = "Taleggio, bacon & spring onion tart"
		dict8["name"] = "Katey Beau"
		dict8["servings"] = "10"
		dict8["duration"] = "1h 30 min"
		dict8["calories"] = "264"
		recipes.append(dict8)

		var dict9: [String: String] = [:]
		dict9["foodType"] = "Mediterranean"
		dict9["rate"] = "2.8"
		dict9["foodName"] = "Mediterranean chicken with roasted vegetables"
		dict9["name"] = "Anton Gonzales"
		dict9["servings"] = "7"
		dict9["duration"] = "55 min"
		dict9["calories"] = "367"
		recipes.append(dict9)

		var dict10: [String: String] = [:]
		dict10["foodType"] = "Mexican"
		dict10["rate"] = "3.5"
		dict10["foodName"] = "Mexican bean burgers with lime yogurt & salsa"
		dict10["name"] = "Cassandra Hatterslay"
		dict10["servings"] = "5"
		dict10["duration"] = "20 min"
		dict10["calories"] = "324"
		recipes.append(dict10)

		pageControl.numberOfPages = recipes.count

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
	@objc func actionFavorite(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSeeMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RecipesList3View: UICollectionViewDataSource {

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

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipesList3Cell", for: indexPath) as! RecipesList3Cell
		cell.bindData(index: indexPath.item, data: recipes[indexPath.row])
		cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
		cell.buttonSeeMore.addTarget(self, action: #selector(actionSeeMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RecipesList3View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RecipesList3View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return collectionView.frame.size
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets.zero
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RecipesList3View: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
		let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

		if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
			pageControl.currentPage = visibleIndexPath.row
		}
	}
}
