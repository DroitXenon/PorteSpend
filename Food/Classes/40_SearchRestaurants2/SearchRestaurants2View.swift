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
class SearchRestaurants2View: UIViewController {

	@IBOutlet var labelSubTitle: UILabel!

	@IBOutlet var textFieldPersons: UITextField!
	@IBOutlet var textFieldDate: UITextField!
	@IBOutlet var textFieldTime: UITextField!

	@IBOutlet var collectionView: UICollectionView!

	private var restaurants: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Search"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		collectionView.register(UINib(nibName: "SearchRestaurants2Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "SearchRestaurants2Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSubTitle.text = "Long Sample Text"
		textFieldPersons.text = "2 Persons"

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldPersons.attributedPlaceholder = NSAttributedString(string: "Persons", attributes: attribute)
		textFieldDate.attributedPlaceholder = NSAttributedString(string: "Date", attributes: attribute)
		textFieldTime.attributedPlaceholder = NSAttributedString(string: "Time", attributes: attribute)

		restaurants.removeAll()

		var dict1: [String: String] = [:]
		dict1["rate"] = "4.0"
		dict1["name"] = "Algernon Gaudin"
		dict1["info"] = "77 Prairieview Drive"
		dict1["distance"] = "3.7"
		restaurants.append(dict1)

		var dict2: [String: String] = [:]
		dict2["rate"] = "2.4"
		dict2["name"] = "Jamie Stille"
		dict2["info"] = "23 Becker Junction"
		dict2["distance"] = "4.2"
		restaurants.append(dict2)

		var dict3: [String: String] = [:]
		dict3["rate"] = "3.1"
		dict3["name"] = "Kippy Waltering"
		dict3["info"] = "281 Ludington Alley"
		dict3["distance"] = "2.2"
		restaurants.append(dict3)

		var dict4: [String: String] = [:]
		dict4["rate"] = "4.9"
		dict4["name"] = "Karlee Aronin"
		dict4["info"] = "7171 Stang Junction"
		dict4["distance"] = "5.5"
		restaurants.append(dict4)

		var dict5: [String: String] = [:]
		dict5["rate"] = "3.4"
		dict5["name"] = "Dido Andryszczak"
		dict5["info"] = "1281 Ridgeway Hill"
		dict5["distance"] = "2.8"
		restaurants.append(dict5)

		var dict6: [String: String] = [:]
		dict6["rate"] = "1.6"
		dict6["name"] = "Mariette Woodhall"
		dict6["info"] = "09132 Claremont Parkway"
		dict6["distance"] = "6.4"
		restaurants.append(dict6)

		var dict7: [String: String] = [:]
		dict7["rate"] = "4.0"
		dict7["name"] = "Edlin Barendtsen"
		dict7["info"] = "514 Bellgrove Point"
		dict7["distance"] = "5.2"
		restaurants.append(dict7)

		var dict8: [String: String] = [:]
		dict8["rate"] = "3.0"
		dict8["name"] = "The supper club"
		dict8["info"] = "8 Harper Park"
		dict8["distance"] = "54.92"
		restaurants.append(dict8)

		var dict9: [String: String] = [:]
		dict9["rate"] = "2.7"
		dict9["name"] = "Rabbit food house"
		dict9["info"] = "641 Grim Center"
		dict9["distance"] = "3.4"
		restaurants.append(dict9)

		var dict10: [String: String] = [:]
		dict10["rate"] = "4.8"
		dict10["name"] = "Sandwich Society"
		dict10["info"] = "47 Sullivan Parkway"
		dict10["distance"] = "2.9"
		restaurants.append(dict10)

		refreshCollectionView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPersons(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDate(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTime(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFindTable(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFavorite(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SearchRestaurants2View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return restaurants.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchRestaurants2Cell", for: indexPath) as! SearchRestaurants2Cell
		cell.bindData(index: indexPath.item, data: restaurants[indexPath.row])
		cell.buttonFavorite.addTarget(self, action: #selector(actionFavorite(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SearchRestaurants2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SearchRestaurants2View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return CGSize(width: 180, height: collectionView.frame.size.height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
	}
}
