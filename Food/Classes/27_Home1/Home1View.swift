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
class Home1View: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var buttonProfile: UIButton!
	@IBOutlet var collectionView: UICollectionView!

	private var recipes: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		collectionView.register(UINib(nibName: "Home1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Home1Cell1")
		collectionView.register(UINib(nibName: "Home1Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Home1Cell2")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Recipes"
		labelSubTitle.text = "Choose from various recipes"
		imageViewProfile.sample("Food", "Sweets", 5)

		recipes.removeAll()

		var dict1: [String: String] = [:]
		dict1["foodType"] = "Halloumi"
		dict1["foodName"] = "Halloumi aubergine burgers with harissa relish"
		dict1["description"] = "A veggie stack with a difference - flavour your fried cheese with Moroccan harissa paste and creamy houmous"
		recipes.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Fredrika Ilson"
		dict2["foodName"] = "Pumpkin, halloumi & chilli omelette"
		dict2["rate"] = ""
		recipes.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "Harriette Pingston"
		dict3["foodName"] = "Grilled halloumi with spiced couscous"
		dict3["rate"] = "2.4"
		recipes.append(dict3)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShowAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDataSource {

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

		if (indexPath.row == 0) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell1", for: indexPath) as! Home1Cell1
			cell.bindData(index: indexPath.item, data: recipes[indexPath.row])
			cell.buttonShowAll.addTarget(self, action: #selector(actionShowAll(_:)), for: .touchUpInside)
			return cell
		}
		if (indexPath.row == 1) || (indexPath.row == 2) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell2", for: indexPath) as! Home1Cell2
			cell.bindData(index: indexPath.item, data: recipes[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width
		let height = (collectionView.frame.size.height-45)

		if (indexPath.row == 0) { return CGSize(width: width-30, height: (height/1.75)) }
		if (indexPath.row == 1) { return CGSize(width: (width-45)/2, height: (height - (height/1.75))) }
		if (indexPath.row == 2) { return CGSize(width: (width-45)/2, height: (height - (height/1.75))) }

		return CGSize.zero
	}
}
