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
class FindFriends1View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!

	private var headers: [String] = []
	private var peopleLike: [[String: String]] = []
	private var peopleKnow: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Find Friends"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))

		collectionView.register(UINib(nibName: "FindFriends1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "FindFriends1Cell1")
		collectionView.register(UINib(nibName: "FindFriends1Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "FindFriends1Cell2")
		collectionView.register(UINib(nibName: "FindFriends1Cell3", bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FindFriends1Cell3")
		collectionView.collectionViewLayout = createLayout()

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		headers = ["People Who Like", "People You May Know"]

		peopleLike.removeAll()
		peopleKnow.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "FIFA 19 Sports"
		dict1["likes"] = "23M like this"
		dict1["category"] = "Game"
		peopleLike.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Fabia Smith"
		dict2["likes"] = "90M like this"
		dict2["category"] = "Athlete"
		peopleLike.append(dict2)

		peopleLike.append(dict1)
		peopleLike.append(dict2)
		peopleLike.append(dict1)
		peopleLike.append(dict2)

		var dict5: [String: String] = [:]
		dict5["name"] = "Brian Elwood"
		dict5["work"] = "Designer at App Design Kit"
		dict5["location"] = "New York, USA"
		peopleKnow.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Doris Royston"
		dict6["work"] = "5 mutual friends"
		dict6["location"] = "New York, USA"
		peopleKnow.append(dict6)

		peopleKnow.append(dict5)
		peopleKnow.append(dict6)
		peopleKnow.append(dict5)
		peopleKnow.append(dict6)

		refreshCollectionView()
	}

	// MARK: - Helper Methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func createLayout() -> UICollectionViewLayout {

		let config = UICollectionViewCompositionalLayoutConfiguration()

		let layout = UICollectionViewCompositionalLayout(sectionProvider: {
			(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

			let isFirstSection = (sectionIndex == 0)

			let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
			item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

			let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(isFirstSection ? 0.7 : 1.0), heightDimension: .absolute(isFirstSection ? 200 : 75)), subitems: [item])

			let section = NSCollectionLayoutSection(group: containerGroup)
			section.orthogonalScrollingBehavior = isFirstSection ? .continuous : .none

			let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
			section.boundarySupplementaryItems = [sectionHeader]
			section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

			return section

		}, configuration: config)

		return layout
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSeeAll(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FindFriends1View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

		if (kind == UICollectionView.elementKindSectionHeader) {
			let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FindFriends1Cell3", for: indexPath) as! FindFriends1Cell3
			reusableView.bindData(title: headers[indexPath.section])
			reusableView.buttonSeeAll.addTarget(self, action: #selector(actionSeeAll(_:)), for: .touchUpInside)
			return reusableView
		}
		return UICollectionReusableView()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (section == 0) { return peopleLike.count }
		if (section == 1) { return peopleKnow.count }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (indexPath.section == 0) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FindFriends1Cell1", for: indexPath) as! FindFriends1Cell1
			cell.bindData(index: indexPath.item, data: peopleLike[indexPath.row])
			return cell
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FindFriends1Cell2", for: indexPath) as! FindFriends1Cell2
			cell.buttonAdd.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
			cell.bindData(index: indexPath.item, data: peopleKnow[indexPath.row])
			return cell
		}
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FindFriends1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
