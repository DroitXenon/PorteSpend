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
class Home3View: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var buttonProfile: UIButton!
	@IBOutlet var collectionViewSlider: UICollectionView!
	@IBOutlet var collectionViewNearYou: UICollectionView!
	@IBOutlet var collectionViewCategories: UICollectionView!

	private var slider: [[String: String]] = []
	private var restaurants: [[String: String]] = []
	private var categories: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		collectionViewSlider.register(UINib(nibName: "Home3Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Home3Cell1")
		collectionViewNearYou.register(UINib(nibName: "Home3Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Home3Cell2")
		collectionViewCategories.register(UINib(nibName: "Home3Cell3", bundle: Bundle.main), forCellWithReuseIdentifier: "Home3Cell3")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Restaurants"
		labelSubTitle.text = "New York, USA"
		imageViewProfile.sample("Food", "Vegan", 10)

		slider.removeAll()
		restaurants.removeAll()
		categories.removeAll()

		categories.append("Italian")
		categories.append("Arabic")
		categories.append("Japanese")
		categories.append("Turkish")

		var dict1: [String: String] = [:]
		dict1["name"] = "Heirloom Cafe"
		dict1["info"] = "77 Prairieview Drive"
		dict1["rate"] = "2.6"
		dict1["distance"] = "3.3"
		restaurants.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Planet of the Grapes"
		dict2["info"] = "4 Oak Valley Terrace"
		dict2["rate"] = "3.3"
		dict2["distance"] = "4.0"
		restaurants.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Montana Restaurant"
		dict3["info"] = "8 Summerview Pass"
		dict3["rate"] = "4.7"
		dict3["distance"] = "6.0"
		restaurants.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "California Pizza Kitchen"
		dict4["info"] = "5 Hazelcrest Plaza"
		dict4["rate"] = "3.8"
		dict4["distance"] = "3.6"
		restaurants.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Mama's Fish House"
		dict5["info"] = "52542 Moulton Junction"
		dict5["rate"] = "4.3"
		dict5["distance"] = "5.1"
		restaurants.append(dict5)

		var dict6: [String: String] = [:]
		dict6["foodType"] = "Trending"
		dict6["foodName"] = "Desserts"
		dict6["description"] = "Explore tried & tested kids' menus, and book dining"
		slider.append(dict6)

		var dict7: [String: String] = [:]
		dict7["foodType"] = "Top"
		dict7["foodName"] = "Vegan Menus"
		dict7["description"] = "Flavour your fried cheese with Moroccan harissa paste and creamy houmous"
		slider.append(dict7)

		var dict8: [String: String] = [:]
		dict8["foodType"] = "Recent"
		dict8["foodName"] = "Dinner Party"
		dict8["description"] = "We're looking good, we feel the excite, we are ready to party all night."
		slider.append(dict8)

		refreshCollectionView()
		refreshCollectionViewNearYou()
		refreshCollectionViewCategories()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionViewSlider.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewNearYou() {

		collectionViewNearYou.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewCategories() {

		collectionViewCategories.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllNearYou(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSeeAll(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFavorite(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home3View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionViewSlider)		{ return slider.count		}
		if (collectionView == collectionViewNearYou)	{ return restaurants.count	}
		if (collectionView == collectionViewCategories)	{ return categories.count	}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewSlider) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home3Cell1", for: indexPath) as! Home3Cell1
			cell.bindData(index: indexPath.item, data: slider[indexPath.row])
			cell.buttonShowAll.addTarget(self, action: #selector(actionSeeAll(_:)), for: .touchUpInside)
			return cell
		}

		if (collectionView == collectionViewNearYou) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home3Cell2", for: indexPath) as! Home3Cell2
			cell.bindData(index: indexPath.item, data: restaurants[indexPath.row])
			cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
			return cell
		}

		if (collectionView == collectionViewCategories) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home3Cell3", for: indexPath) as! Home3Cell3
			cell.bindData(category: categories[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home3View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		if (collectionView == collectionViewSlider) { }
		if (collectionView == collectionViewNearYou) { }
		if (collectionView == collectionViewCategories) { }
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home3View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width
		let height = collectionView.frame.size.height
		let categoriesCellWidth = (width-45)/2

		if (collectionView == collectionViewSlider) { return CGSize(width: width-70, height: height) }
		if (collectionView == collectionViewNearYou) { return CGSize(width: 180, height: height) }
		if (collectionView == collectionViewCategories) { return CGSize(width: categoriesCellWidth, height: 40) }

		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewSlider) { return 10 }
		if (collectionView == collectionViewNearYou) { return 10 }
		if (collectionView == collectionViewCategories) { return 15 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewSlider) { return 10 }
		if (collectionView == collectionViewNearYou) { return 10 }
		if (collectionView == collectionViewCategories) { return 15 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionViewSlider) { return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) }
		if (collectionView == collectionViewNearYou) { return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) }
		if (collectionView == collectionViewCategories) { return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) }

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}
