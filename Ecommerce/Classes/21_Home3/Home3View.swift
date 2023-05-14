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

	@IBOutlet var viewTitle: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var collectionView: UICollectionView!

	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewTitle)
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(actionProfile))
		collectionView.register(UINib(nibName: "Home3Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Home3Cell1")
		collectionView.register(UINib(nibName: "Home3Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Home3Cell2")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		products.removeAll()

		var dict1: [String: String] = [:]
		dict1["companyName"] = "Adidas"
		dict1["title"] = "Gazelle Suede"
		dict1["description"] = "The Adidas Originals draw inspiration from street culture and retro styles."
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["companyName"] = "Puma"
		dict2["title"] = "Soccer Boots"
		dict2["description"] = "A focus on functionality as well as style is paramount in PUMA's designs"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["companyName"] = "Reebok"
		dict3["title"] = "Combat Boxing "
		dict3["description"] = "Reebok have aligned themselves with some of the world's top athletes"
		products.append(dict3)

		refreshCollectionViewProducts()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewProducts() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
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

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (indexPath.row == 0) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home3Cell1", for: indexPath) as! Home3Cell1
			cell.bindData(index: indexPath, data: products[indexPath.row])
			return cell
		}
		if (indexPath.row == 1) || (indexPath.row == 2) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home3Cell2", for: indexPath) as! Home3Cell2
			cell.bindData(index: indexPath, data: products[indexPath.row])
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
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home3View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width
		let height = (collectionView.frame.size.height-45)/2

		if (indexPath.row == 0) { return CGSize(width: width-30, height: height) }
		if (indexPath.row == 1) { return CGSize(width: (width-45)/2, height: height) }
		if (indexPath.row == 2) { return CGSize(width: (width-45)/2, height: height) }

		return CGSize.zero
	}
}
