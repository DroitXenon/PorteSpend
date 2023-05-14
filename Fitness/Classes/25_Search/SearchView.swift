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
class SearchView: UIViewController {

	@IBOutlet var collectionView: UICollectionView!

	private var headers = ["Tranings", "Teachers"]
	private var tranings: [[String: String]] = []
	private var teachers: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Butterfly"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))

		collectionView.register(UINib(nibName: "SearchCell1", bundle: Bundle.main), forCellWithReuseIdentifier: "SearchCell1")
		collectionView.register(UINib(nibName: "SearchCell2", bundle: Bundle.main), forCellWithReuseIdentifier: "SearchCell2")
		collectionView.register(UINib(nibName: "SearchCell3", bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchCell3")
		collectionView.collectionViewLayout = createLayout()
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		tranings.removeAll()
		teachers.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Shoulder press"
		dict1["rate"] = "2.8"
		dict1["reviews"] = "22k"
		tranings.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Shoulder fly"
		dict2["rate"] = "3.8"
		dict2["reviews"] = "23k"
		tranings.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Triceps extension"
		dict3["rate"] = "1.3"
		dict3["reviews"] = "12k"
		tranings.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Biceps curl"
		dict4["rate"] = "1.5"
		dict4["reviews"] = "26k"
		tranings.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Pushdown"
		dict5["rate"] = "5.0"
		dict5["reviews"] = "29k"
		tranings.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Margit Dominico"
		dict6["category"] = "Yoga"
		dict6["followers"] = "27K"
		dict6["rate"] = "2.6"
		teachers.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "Filippa Bordessa"
		dict7["category"] = "GYM"
		dict7["followers"] = "16M"
		dict7["rate"] = "4.5"
		teachers.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Pascal Clerk"
		dict8["category"] = "Dance"
		dict8["followers"] = "24K"
		dict8["rate"] = "4.9"
		teachers.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "Brier Lean"
		dict9["category"] = "Yoga"
		dict9["followers"] = "786"
		dict9["rate"] = "2.7"
		teachers.append(dict9)

		var dict10: [String: String] = [:]
		dict10["name"] = "Hercule Gerhts"
		dict10["category"] = "Aerobic"
		dict10["followers"] = "12K"
		dict10["rate"] = "3.9"
		teachers.append(dict10)

		var dict11: [String: String] = [:]
		dict11["name"] = "Timothee Tunuy"
		dict11["category"] = "GYM"
		dict11["followers"] = "18K"
		dict11["rate"] = "2.9"
		teachers.append(dict11)

		var dict12: [String: String] = [:]
		dict12["name"] = "Dalis Bainton"
		dict12["category"] = "Dance"
		dict12["followers"] = "5M"
		dict12["rate"] = "3.3"
		teachers.append(dict12)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - Helper Methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func createLayout() -> UICollectionViewLayout {

		let config = UICollectionViewCompositionalLayoutConfiguration()

		let layout = UICollectionViewCompositionalLayout(sectionProvider: {
			(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

			let isFirstSection = (sectionIndex == 0)

			let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
			if isFirstSection {
				item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 0)
			}

			let width = isFirstSection ? NSCollectionLayoutDimension.absolute(150) : NSCollectionLayoutDimension.fractionalWidth(1.0)
			let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: .absolute(isFirstSection ? 160 : 70)), subitems: [item])

			let section = NSCollectionLayoutSection(group: containerGroup)
			section.orthogonalScrollingBehavior = isFirstSection ? .continuous : .none

			let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
			section.boundarySupplementaryItems = [sectionHeader]
			if isFirstSection {
				section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
			}

			return section
		}, configuration: config)

		return layout
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SearchView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 2
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

		if (kind == UICollectionView.elementKindSectionHeader) {
			let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchCell3", for: indexPath) as! SearchCell3
			reusableView.bindData(title: headers[indexPath.section])
			return reusableView
		}
		return UICollectionReusableView()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (section == 0) { return tranings.count }
		if (section == 1) { return teachers.count }
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (indexPath.section == 0) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell1", for: indexPath) as! SearchCell1
			cell.bindData(index: indexPath, data: tranings[indexPath.item])
			return cell
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell2", for: indexPath) as! SearchCell2
			cell.bindData(index: indexPath, data: teachers[indexPath.item])
			return cell
		}
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SearchView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}
