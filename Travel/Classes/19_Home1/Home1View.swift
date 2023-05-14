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

	private var searchController: UISearchController!

	@IBOutlet var collectionView1: UICollectionView!
	@IBOutlet var collectionView2: UICollectionView!

	private var tours: [[String: String]] = []
	private var countries: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Travel"

		searchController = UISearchController()
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always
		navigationItem.searchController = searchController

		collectionView1.register(UINib(nibName: "Home1Cell1", bundle: nil), forCellWithReuseIdentifier: "Home1Cell1")
		collectionView2.register(UINib(nibName: "Home1Cell2", bundle: nil), forCellWithReuseIdentifier: "Home1Cell2")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .automatic
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		tours.removeAll()
		countries.removeAll()

		var dict1: [String: String] = [:]
		dict1["ratings"] = "7.5"
		dict1["name"] = "Ibis Deira City Centre"
		dict1["placecount"] = "2 places"
		dict1["days"] = "4 days"
		dict1["amount"] = "$3499.00"
		tours.append(dict1)

		var dict2: [String: String] = [:]
		dict2["ratings"] = "8.5"
		dict2["name"] = "Millennium Dubai"
		dict2["placecount"] = "3 places"
		dict2["days"] = "5 days"
		dict2["amount"] = "$4099.00"
		tours.append(dict2)

		var dict3: [String: String] = [:]
		dict3["ratings"] = "6.5"
		dict3["name"] = "Ibis Deira City Centre"
		dict3["placecount"] = "1 place"
		dict3["days"] = "2 days"
		dict3["amount"] = "$1499.00"
		tours.append(dict3)

		var dict4: [String: String] = [:]
		dict4["ratings"] = "9.0"
		dict4["name"] = "Millennium Dubai"
		dict4["placecount"] = "5 places"
		dict4["days"] = "9 days"
		dict4["amount"] = "$6099.00"
		tours.append(dict4)

		var dict5: [String: String] = [:]
		dict5["ratings"] = "7.0"
		dict5["name"] = "Ibis Deira City Centre"
		dict5["placecount"] = "2 places"
		dict5["days"] = "4 days"
		dict5["amount"] = "$3499.00"
		tours.append(dict5)

		var dict6: [String: String] = [:]
		dict6["country"] = "India"
		dict6["tours"] = "238 Tours"
		countries.append(dict6)

		var dict7: [String: String] = [:]
		dict7["country"] = "China"
		dict7["tours"] = "300 Tours"
		countries.append(dict7)

		var dict8: [String: String] = [:]
		dict8["country"] = "Japan"
		dict8["tours"] = "200 Tours"
		countries.append(dict8)

		var dict9: [String: String] = [:]
		dict9["country"] = "Thailand"
		dict9["tours"] = "147 Tours"
		countries.append(dict9)

		refreshCollectionView1()
		refreshCollectionView2()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllTours(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllCountries(_ sender: Any) {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView1() {

		collectionView1.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView2() {

		collectionView2.reloadData()
	}
}

// MARK:- UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if collectionView == collectionView1 { return tours.count }
		if collectionView == collectionView2 { return countries.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if collectionView == collectionView1 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell1", for: indexPath) as! Home1Cell1
			cell.bindData(index: indexPath.item, data: tours[indexPath.row])
			return cell
		}
		if collectionView == collectionView2 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell2", for: indexPath) as! Home1Cell2
			cell.bindData(index: indexPath.item, country: countries[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if collectionView == collectionView1 {
		}
		if collectionView == collectionView2 {
		}
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let height = collectionView.frame.size.height
		let width = collectionView.frame.size.width

		if collectionView == collectionView1 {
			return CGSize(width: width/2, height: height)
		}
		if collectionView == collectionView2 {
			return CGSize(width: width/2, height: height)
		}
		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if collectionView == collectionView1 {
			return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		}
		if collectionView == collectionView2 {
			return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		}
		return UIEdgeInsets.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}
}
