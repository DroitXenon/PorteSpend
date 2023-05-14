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
class Items10View: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var tableView: UITableView!

	private var selectedMenuIndex = 0
	private var menus: [String] = []
	private var products: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		labelTitle.text = "Clothing"
		labelSubTitle.text = "73.3K items"

		let compactAppearance = UINavigationBarAppearance()
		compactAppearance.titleTextAttributes = [.foregroundColor: UIColor.label]
		compactAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
		compactAppearance.backgroundColor = AppColor.Navigation
		compactAppearance.shadowColor = AppColor.Navigation

		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.standardAppearance = compactAppearance
		navigationController?.navigationBar.compactAppearance = compactAppearance
		navigationController?.navigationBar.scrollEdgeAppearance = compactAppearance
		navigationController?.navigationBar.tintColor = AppColor.Theme
		navigationController?.navigationBar.layoutIfNeeded()

		let buttonSortBy = UIBarButtonItem(image: UIImage(systemName: "text.alignleft"), style: .plain, target: self, action: #selector(actionSortBy))
		let buttonFilter = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(actionFilter))
		navigationItem.rightBarButtonItems = [buttonFilter, buttonSortBy]

		collectionView.register(UINib(nibName: "Items10Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Items10Cell1")
		tableView.register(UINib(nibName: "Items10Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Items10Cell2")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)

		if let navBar = navigationController as? NavigationController {
			navBar.setNavigationBar()
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		menus.removeAll()
		products.removeAll()

		menus.append("")
		menus.append("")
		menus.append("")

		var dict1: [String: String] = [:]
		dict1["title"] = "Printed Slim Fit Casual Shirt"
		dict1["brand"] = "Spykar"
		dict1["price"] = "$599"
		dict1["originalPrice"] = "$1099"
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Blue Full Sleeves Formal Shirt"
		dict2["brand"] = "Peter England"
		dict2["price"] = "$760"
		dict2["originalPrice"] = ""
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Van Heusen Grey Shirt"
		dict3["brand"] = "Van Heusen"
		dict3["price"] = "$463"
		dict3["originalPrice"] = ""
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Black Barocco Track Jacket"
		dict4["brand"] = "Versace"
		dict4["price"] = "$1500"
		dict4["originalPrice"] = "$2100"
		products.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Permapress White Shirt"
		dict5["brand"] = "Louis Phillipe"
		dict5["price"] = "$999"
		dict5["originalPrice"] = ""
		products.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Regular fit Casual Shirt"
		dict6["brand"] = "Red Tape"
		dict6["price"] = "$799"
		dict6["originalPrice"] = ""
		products.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Slim fit Casual Shirt"
		dict7["brand"] = "KILLER"
		dict7["price"] = "$879"
		dict7["originalPrice"] = "$1250"
		products.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "Full Sleeve Casual Shirt"
		dict8["brand"] = "Campus Sutra"
		dict8["price"] = "$780"
		dict8["originalPrice"] = ""
		products.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = "Solid Regular Fit Casual Shirt"
		dict9["brand"] = "Jack & Jones"
		dict9["price"] = "$1299"
		dict9["originalPrice"] = "2500"
		products.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Checkered Slim fit Shirt"
		dict10["brand"] = "Indian Terrain"
		dict10["price"] = "$1209"
		dict10["originalPrice"] = ""
		products.append(dict10)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSortBy(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFilter(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items10View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return products.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Items10Cell2", for: indexPath) as! Items10Cell2
		cell.bindData(index: indexPath, data: products[indexPath.row])
		cell.buttonMore.tag = indexPath.row
		cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items10View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 85
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items10View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return menus.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Items10Cell1", for: indexPath) as! Items10Cell1
		cell.set(isSelected: (indexPath.row == selectedMenuIndex))
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items10View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		selectedMenuIndex = indexPath.row
		collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Items10View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = (collectionView.frame.size.width-30)/3
		let height = collectionView.frame.size.height

		return CGSize(width: width, height: height-10)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
	}
}
