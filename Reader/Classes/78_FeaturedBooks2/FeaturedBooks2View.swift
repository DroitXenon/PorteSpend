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
class FeaturedBooks2View: UIViewController {

	@IBOutlet var collectionViewFeatured: UICollectionView!
	@IBOutlet var collectionViewAudiobooks: UICollectionView!
	@IBOutlet var collectionViewAuthors: UICollectionView!

	private var category: [[String: String]] = []
	private var audioBooks: [[String: String]] = []
	private var authors: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Featured"

		let userImage = UIImage(systemName: "person.circle.fill")?.withTintColor(UIColor.systemGray, renderingMode: .alwaysOriginal)
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(actionProfile(_:)))

		collectionViewFeatured.register(UINib(nibName: "FeaturedBooks2Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "FeaturedBooks2Cell1")
		collectionViewAudiobooks.register(UINib(nibName: "FeaturedBooks2Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "FeaturedBooks2Cell2")
		collectionViewAuthors.register(UINib(nibName: "FeaturedBooks2Cell3", bundle: Bundle.main), forCellWithReuseIdentifier: "FeaturedBooks2Cell3")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		category.removeAll()
		audioBooks.removeAll()
		authors.removeAll()

		var dict1: [String: String] = [:]
		dict1["category"] = "Fantasy"
		dict1["books"] = "421"
		category.append(dict1)

		var dict2: [String: String] = [:]
		dict2["category"] = "Adventure"
		dict2["books"] = "1138"
		category.append(dict2)

		var dict3: [String: String] = [:]
		dict3["category"] = "Romance"
		dict3["books"] = "872"
		category.append(dict3)

		var dict4: [String: String] = [:]
		dict4["category"] = "Mystery"
		dict4["books"] = "124"
		category.append(dict4)

		var dict5: [String: String] = [:]
		dict5["category"] = "Horror"
		dict5["books"] = "259"
		category.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Who Moved My Cheese?"
		dict6["author"] = "Spencer Johnson"
		audioBooks.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "The Magic of Thinking Big"
		dict7["author"] = "David J. Schwartz"
		audioBooks.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Think & Grow Rich"
		dict8["author"] = "Napolean Hill"
		audioBooks.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "The Power of Positive Thinking"
		dict9["author"] = "Norman Vincent Peale"
		audioBooks.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "How to Win Friends and Influence People"
		dict10["author"] = "Dale Carnegie"
		audioBooks.append(dict10)

		var dict11: [String: String] = [:]
		dict11["name"] = "William Shakespeare"
		dict11["books"] = "42"
		authors.append(dict11)

		var dict12: [String: String] = [:]
		dict12["name"] = "Agatha Christie"
		dict12["books"] = "85"
		authors.append(dict12)

		var dict13: [String: String] = [:]
		dict13["name"] = "Barbara Cartland"
		dict13["books"] = "723"
		authors.append(dict13)

		var dict14: [String: String] = [:]
		dict14["name"] = "Danielle Steel"
		dict14["books"] = "179"
		authors.append(dict14)

		var dict15: [String: String] = [:]
		dict15["name"] = "Harold Robbins"
		dict15["books"] = "23"
		authors.append(dict15)

		refreshCollectionViewFeatured()
		refreshCollectionViewAudiobooks()
		refreshCollectionViewAuthors()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewFeatured() {

		collectionViewFeatured.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewAudiobooks() {

		collectionViewAudiobooks.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewAuthors() {

		collectionViewAuthors.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionProfile(_ sender: UIBarButtonItem) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllAudiobooks(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllAuthors(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FeaturedBooks2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionViewFeatured) { return category.count }
		if (collectionView == collectionViewAudiobooks) { return audioBooks.count }
		if (collectionView == collectionViewAuthors) { return authors.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewFeatured) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedBooks2Cell1", for: indexPath) as! FeaturedBooks2Cell1
			cell.bindData(index: indexPath.item, data: category[indexPath.row])
			return cell
		}

		if (collectionView == collectionViewAudiobooks) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedBooks2Cell2", for: indexPath) as! FeaturedBooks2Cell2
			cell.bindData(index: indexPath.item, data: audioBooks[indexPath.row])
			cell.buttonAdd.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
			return cell
		}

		if (collectionView == collectionViewAuthors) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedBooks2Cell3", for: indexPath) as! FeaturedBooks2Cell3
			cell.bindData(index: indexPath.item, data: authors[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FeaturedBooks2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if (collectionView == collectionViewFeatured) { }
		if (collectionView == collectionViewAudiobooks) { }
		if (collectionView == collectionViewAuthors) { }
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FeaturedBooks2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let height = collectionView.frame.size.height

		if (collectionView == collectionViewFeatured) { return CGSize(width: 140, height: height) }
		if (collectionView == collectionViewAudiobooks) { return CGSize(width: 125, height: height) }
		if (collectionView == collectionViewAuthors) { return CGSize(width: 100, height: height) }

		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewFeatured) { return 10 }
		if (collectionView == collectionViewAudiobooks) { return 10 }
		if (collectionView == collectionViewAuthors) { return 15 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewFeatured) { return 10 }
		if (collectionView == collectionViewAudiobooks) { return 10 }
		if (collectionView == collectionViewAuthors) { return 15 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionViewFeatured) { return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) }
		if (collectionView == collectionViewAudiobooks) { return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) }
		if (collectionView == collectionViewAuthors) { return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) }

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}
