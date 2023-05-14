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

	private var categories: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Categories"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		collectionView.register(UINib(nibName: "Categories2Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Categories2Cell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		categories.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "Shoes"
		dict1["items"] = "812"
		categories.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Sneakers"
		dict2["items"] = "1.4K"
		categories.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Jeans"
		dict3["items"] = "91.9K"
		categories.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "Accessories"
		dict4["items"] = "12.3K"
		categories.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Casual Trousers"
		dict5["items"] = "996"
		categories.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Shorts"
		dict6["items"] = "2.5K"
		categories.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Track Pants"
		dict7["items"] = "17K"
		categories.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Jackets"
		dict8["items"] = "20K"
		categories.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Blazers"
		dict9["items"] = "915"
		categories.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "Socks"
		dict10["items"] = "75.1K"
		categories.append(dict10)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
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

		return categories.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Categories2Cell1", for: indexPath) as! Categories2Cell1
		cell.bindData(index: indexPath.item, data: categories[indexPath.row])
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
		return CGSize(width: width, height: (width*1.25))
	}
}
