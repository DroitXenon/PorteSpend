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
class Filters3View: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var buttonViewItems: UIButton!

	@IBOutlet var cellBrand: UITableViewCell!
	@IBOutlet var cellRange: UITableViewCell!
	@IBOutlet var cellFreeShipping: UITableViewCell!
	@IBOutlet var cellShippingTo: UITableViewCell!

	@IBOutlet var cellSize: UITableViewCell!
	@IBOutlet var cellPrice: UITableViewCell!
	@IBOutlet var cellColor: UITableViewCell!

	@IBOutlet var labelBrand: UILabel!
	@IBOutlet var labelRange: UILabel!
	@IBOutlet var switchFreeShipping: UISwitch!
	@IBOutlet var labelShippingTo: UILabel!

	@IBOutlet var viewSize: UIView!
	@IBOutlet var viewPrice: UIView!
	@IBOutlet var viewColor: UIView!

	@IBOutlet var imageSize: UIImageView!
	@IBOutlet var imagePrice: UIImageView!
	@IBOutlet var imageColor: UIImageView!

	@IBOutlet var collectionViewSize: UICollectionView!
	@IBOutlet var collectionViewColor: UICollectionView!

	private var selectedStyle: Set<IndexPath> = []
	private var selectedSize: Set<IndexPath> = []
	private var selectedColor: Set<IndexPath> = []
	private var style: [String] = []
	private var size: [String] = []
	private var color: [UIColor] = []
	private let rangeSlider = RangeSlider()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Filters"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(actionReset(_:)))

		imageSize.isHighlighted = true
		imageColor.isHighlighted = true

		collectionViewSize.register(UINib(nibName: "Filters3Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Filters3Cell1")
		collectionViewColor.register(UINib(nibName: "Filters3Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Filters3Cell2")

		DispatchQueue.main.async {
			self.tableView.reloadData()
			self.collectionViewSize.reloadData()
			self.collectionViewColor.reloadData()
		}
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
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelBrand.text = "Adidas Originals, Puma, HRX"
		labelRange.text = "All"
		switchFreeShipping.isOn = false
		labelShippingTo.text = "London, UK"

		style.removeAll()
		size.removeAll()
		color.removeAll()

		style.append("Boots")
		style.append("Chelsea Boots")
		style.append("Casual Sneakers")
		style.append("Casual Shoes")

		size.append("6")
		size.append("6.5")
		size.append("7")
		size.append("7.5")
		size.append("8")
		size.append("8.5")
		size.append("9")
		size.append("9.5")

		color.append(UIColor.black)
		color.append(UIColor.white)
		color.append(UIColor.gray)
		color.append(UIColor.lightGray)
		color.append(UIColor.green)
		color.append(AppColor.Theme)
		color.append(UIColor.purple)
		color.append(UIColor.brown)
		color.append(UIColor.blue)
		color.append(UIColor.magenta)
		color.append(UIColor.orange)
		color.append(UIColor.red)
		color.append(UIColor.yellow)

		refreshTableView()
		refreshCollectionViewSize()
		refreshCollectionViewColor()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewSize() {

		collectionViewSize.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewColor() {

		collectionViewColor.reloadData()
	}

	// MARK: - Helper Methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setSlider() {

		rangeSlider.frame = CGRect(x: 15, y: 15, width: cellPrice.frame.size.width - 30, height: cellPrice.frame.size.height)
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
		cellPrice.contentView.addSubview(rangeSlider)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setSliderFrame() {

		rangeSlider.frame = CGRect(x: 15, y: 15, width: cellPrice.frame.size.width - 30, height: cellPrice.frame.size.height)
		rangeSlider.updateUI()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionReset(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionViewItems(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSize(_ sender: UIButton) {

		print(#function)
		imageSize.isHighlighted = !imageSize.isHighlighted
		tableView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPrice(_ sender: UIButton) {

		print(#function)
		imagePrice.isHighlighted = !imagePrice.isHighlighted
		tableView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionColor(_ sender: UIButton) {

		print(#function)
		imageColor.isHighlighted = !imageColor.isHighlighted
		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters3View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 4
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 4 }
		if (section == 1) { return imageSize.isHighlighted ? 1 : 0 }
		if (section == 2) { return imagePrice.isHighlighted ? 1 : 0 }
		if (section == 3) { return imageColor.isHighlighted ? 1 : 0 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellBrand			}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellRange			}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellFreeShipping	}
		if (indexPath.section == 0) && (indexPath.row == 3) { return cellShippingTo		}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellSize	}
		if (indexPath.section == 2) && (indexPath.row == 0) { return cellPrice	}
		if (indexPath.section == 3) && (indexPath.row == 0) { return cellColor	}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters3View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 1 }

		return 40
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		if (section == 1) { return viewSize		}
		if (section == 2) { return viewPrice	}
		if (section == 3) { return viewColor	}

		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 50 }
		if (indexPath.section == 1) { return 70 }
		if (indexPath.section == 2) { return 70 }
		if (indexPath.section == 3) { return 70 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters3View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionViewSize) { return size.count }
		if (collectionView == collectionViewColor) { return color.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewSize) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Filters3Cell1", for: indexPath) as! Filters3Cell1
			cell.labelSize.text = size[indexPath.row]
			cell.setSize(isSelected: selectedSize.contains(indexPath))
			return cell
		}
		if (collectionView == collectionViewColor) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Filters3Cell2", for: indexPath) as! Filters3Cell2
			cell.bindData(color: color[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters3View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

		print(indexPath)
		if (collectionView == collectionViewColor) {
			if let cell = cell as? Filters3Cell2 {
				cell.viewColor.backgroundColor = color[indexPath.row]
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		if (collectionView == collectionViewSize) {
			if selectedSize.contains(indexPath) {
				selectedSize.remove(indexPath)
			} else {
				selectedSize.insert(indexPath)
			}
			collectionView.reloadItems(at: [indexPath])
		}
		if (collectionView == collectionViewColor) {
			if selectedColor.contains(indexPath) {
				selectedColor.remove(indexPath)
			} else {
				selectedColor.insert(indexPath)
			}
			collectionView.reloadItems(at: [indexPath])
		}
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters3View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let height = collectionView.frame.size.height-30
		return CGSize(width: height, height: height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
	}
}
