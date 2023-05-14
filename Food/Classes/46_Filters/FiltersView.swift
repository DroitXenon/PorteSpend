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
class FiltersView: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var layoutConstraintCollectionViewHeight: NSLayoutConstraint!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!
	@IBOutlet var viewPrice: UIView!
	@IBOutlet var buttonViewRetaurant: UIButton!

	private var cuisines: [String] = []
	private var filters: [String] = []
	private var selectedCuisines: Set<IndexPath> = []
	private var selectedFilters: Set<IndexPath> = []
	let rangeSlider = RangeSlider()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Filters"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(actionReset(_:)))

		collectionView.register(UINib(nibName: "FiltersCell1", bundle: Bundle.main), forCellWithReuseIdentifier: "FiltersCell1")
		tableView.register(UINib(nibName: "FiltersCell2", bundle: Bundle.main), forCellReuseIdentifier: "FiltersCell2")

		setSlider()
		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		setSliderFrame()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillLayoutSubviews() {

		super.viewWillLayoutSubviews()
		setSliderFrame()
		self.layoutConstraintCollectionViewHeight.constant = self.collectionView.contentSize.height
		self.layoutConstraintTableViewHeight.constant = self.tableView.contentSize.height
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		buttonViewRetaurant.setTitle("View 313 restaurants", for: .normal)
		
		cuisines.removeAll()
		filters.removeAll()

		cuisines.append("Mexican")
		cuisines.append("Italian")
		cuisines.append("Greek")
		cuisines.append("Thai")
		cuisines.append("Spanish")
		cuisines.append("Indian")
		cuisines.append("Mediterranean")

		filters.append("Open Now")
		filters.append("Credit Cards")
		filters.append("Bar")

		refreshCollectionView()
		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
		layoutConstraintCollectionViewHeight.constant = self.collectionView.contentSize.height
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		self.tableView.reloadData()
		self.layoutConstraintTableViewHeight.constant = self.tableView.contentSize.height
	}

	// MARK: - Helper Methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setSlider() {

		setSliderFrame()
		rangeSlider.textColor = UIColor.label
		rangeSlider.handleColor = UIColor.white
		rangeSlider.normalBackgroundColor = UIColor.systemGray5
		rangeSlider.highlightedBackgroundColor = AppColor.Theme
		rangeSlider.setRange(minRange: 0, maxRange: 1000, accuracy: 10)
		rangeSlider.stringPrefix = "$ "
		rangeSlider.textAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
									  NSAttributedString.Key.foregroundColor: UIColor.label]
		rangeSlider.updateUI()
		rangeSlider.valueChangeClosure = { (left, right) -> () in
			print("left = \(left)  right = \(right) \n")
		}
		viewPrice.addSubview(rangeSlider)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setSliderFrame() {

		rangeSlider.frame = CGRect(x: 15, y: 15, width: viewPrice.frame.size.width - 30, height: viewPrice.frame.size.height)
		rangeSlider.updateUI()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionReset(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionViewRestaurants(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return cuisines.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FiltersCell1", for: indexPath) as! FiltersCell1
		cell.bindData(menu: cuisines[indexPath.row])
		cell.set(isSelected: selectedCuisines.contains(indexPath))
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		if selectedCuisines.contains(indexPath) {
			selectedCuisines.remove(indexPath)
		} else {
			selectedCuisines.insert(indexPath)
		}
		collectionView.reloadData()
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersView: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let textWidth = cuisines[indexPath.row].uppercased().width(withConstrainedHeight: 20, font: UIFont.boldSystemFont(ofSize: 12))
		return CGSize(width: textWidth + 25, height: 20)
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

		return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return filters.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "FiltersCell2", for: indexPath) as! FiltersCell2
		cell.bindData(title: filters[indexPath.row])
		cell.set(isSelected: selectedFilters.contains(indexPath))
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 55
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		if selectedFilters.contains(indexPath) {
			selectedFilters.remove(indexPath)
		} else {
			selectedFilters.insert(indexPath)
		}
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}
}

// MARK: - String
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension String {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.width)
	}
}
