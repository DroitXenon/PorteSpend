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
class PlacesCell1: UITableViewCell {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var buttonLikeDislike: UIButton!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelLocation: UILabel!
	@IBOutlet var labelPhotos: UILabel!
	@IBOutlet var buttonMore: UIButton!

	private var imageCount = 0
	private var currentIndex = 1

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UINib(nibName: "PlacesCell2", bundle: nil), forCellWithReuseIdentifier: "PlacesCell2")
		collectionView.collectionViewLayout = createLayout()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, place: [String: String]) {

		guard let images = place["images"] else { return }
		guard let name = place["name"] else { return }
		guard let description = place["description"] else { return }
		guard let location = place["location"] else { return }
		guard let photos = place["photos"] else { return }

		currentIndex = index
		imageCount = Int(images) ?? 6
		labelTitle.text = name
		labelDescription.text = description
		labelLocation.text = location
		labelPhotos.text = photos

		refreshCollectionView()
	}

	// MARK: - Helper Methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func createLayout() -> UICollectionViewLayout {

		let layout = UICollectionViewCompositionalLayout {(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

			let leadingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalHeight(1.0), heightDimension: .fractionalHeight(1.0)))
			leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

			let trailingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalHeight(0.5), heightDimension: .fractionalHeight(0.5)))
			trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

			let trailingItemGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalHeight(0.5), heightDimension: .fractionalHeight(1.0)), subitem: trailingItem, count: 2)

			let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalHeight(1.5), heightDimension: .fractionalHeight(1.0)), subitems: [leadingItem, trailingItemGroup])

			let section = NSCollectionLayoutSection(group: mainGroup)
			section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
			section.orthogonalScrollingBehavior = .continuous

			return section
		}
		return layout
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLikeDislike(_ sender: Any) {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}
}

// MARK:- UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension PlacesCell1: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return imageCount
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlacesCell2", for: indexPath) as! PlacesCell2
		cell.bindData(index: indexPath.item + (currentIndex * 2))
		return cell
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension PlacesCell1: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
