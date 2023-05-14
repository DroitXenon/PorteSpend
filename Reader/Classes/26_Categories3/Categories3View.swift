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
class Categories3View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!

	private var categories: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Categories"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		collectionView.register(UINib(nibName: "Categories3Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Categories3Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		categories.removeAll()

		var dict1: [String: String] = [:]
		dict1["category"] = "Sport"
		dict1["subCategory1"] = "Football"
		dict1["subCategory2"] = "Basketball"
		dict1["subCategory3"] = "Hockey"
		categories.append(dict1)

		var dict2: [String: String] = [:]
		dict2["category"] = "News"
		dict2["subCategory1"] = "Nation"
		dict2["subCategory2"] = "World"
		dict2["subCategory3"] = "Washington"
		categories.append(dict2)

		var dict3: [String: String] = [:]
		dict3["category"] = "Politics"
		dict3["subCategory1"] = "News"
		dict3["subCategory2"] = "Bloomberg"
		dict3["subCategory3"] = "Goverment"
		categories.append(dict3)

		var dict4: [String: String] = [:]
		dict4["category"] = "Travel"
		dict4["subCategory1"] = "Destinations"
		dict4["subCategory2"] = "Flights"
		dict4["subCategory3"] = "Cruises"
		categories.append(dict4)

		var dict5: [String: String] = [:]
		dict5["category"] = "Business"
		dict5["subCategory1"] = "Cars"
		dict5["subCategory2"] = "Personal Finance"
		dict5["subCategory3"] = "Goverment"
		categories.append(dict5)

		var dict6: [String: String] = [:]
		dict6["category"] = "Lifestyle"
		dict6["subCategory1"] = "Entertainment"
		dict6["subCategory2"] = "Celebrities"
		dict6["subCategory3"] = "People"
		categories.append(dict6)

		var dict7: [String: String] = [:]
		dict7["category"] = "Real Estate"
		dict7["subCategory1"] = "The High End"
		dict7["subCategory2"] = "Commercial"
		dict7["subCategory3"] = "Find A Home"
		categories.append(dict7)

		var dict8: [String: String] = [:]
		dict8["category"] = "Health"
		dict8["subCategory1"] = "Health Policy"
		dict8["subCategory2"] = "Global Health"
		dict8["subCategory3"] = "The New Old Age"
		categories.append(dict8)

		var dict9: [String: String] = [:]
		dict9["category"] = "Opinion"
		dict9["subCategory1"] = "Columnists"
		dict9["subCategory2"] = "Series"
		dict9["subCategory3"] = "Editorials"
		categories.append(dict9)

		var dict10: [String: String] = [:]
		dict10["category"] = "Food"
		dict10["subCategory1"] = "Wine, Beer"
		dict10["subCategory2"] = "Restaurant Reviews"
		dict10["subCategory3"] = "Cocktails"
		categories.append(dict10)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionViewAll(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories3View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return categories.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Categories3Cell", for: indexPath) as! Categories3Cell
		cell.bindData(data: categories[indexPath.row])
		cell.buttonViewAll.addTarget(self, action: #selector(actionViewAll(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories3View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories3View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-45)/2
		return CGSize(width: width, height: 150)
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
