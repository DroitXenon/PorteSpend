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
class Categories5View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!

	private var categories: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		collectionView.register(UINib(nibName: "Categories5Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Categories5Cell")
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		categories.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Sport"
		dict1["article"] = "184"
		categories.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Politics"
		dict2["article"] = "295"
		categories.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Travel"
		dict3["article"] = "62"
		categories.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Business"
		dict4["article"] = "372"
		categories.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Lifestyle"
		dict5["article"] = "482"
		categories.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Real Estate"
		dict6["article"] = "245"
		categories.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Health"
		dict7["article"] = "480"
		categories.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "Opinion"
		dict8["article"] = "354"
		categories.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = "Food"
		dict9["article"] = "161"
		categories.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Science"
		dict10["article"] = "167"
		categories.append(dict10)

		var dict11: [String: String] = [:]
		dict11["title"] = "Books"
		dict11["article"] = "483"
		categories.append(dict11)

		var dict12: [String: String] = [:]
		dict12["title"] = "Arts"
		dict12["article"] = "542"
		categories.append(dict12)

		refreshCategories()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCategories() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories5View: UICollectionViewDataSource {

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

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Categories5Cell", for: indexPath) as! Categories5Cell
		cell.bindData(index: indexPath, data: categories[indexPath.row])
		cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories5View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		dismiss(animated: true, completion: nil)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Categories5View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-45)/2
		return CGSize(width: width, height: (width*1.2))
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
