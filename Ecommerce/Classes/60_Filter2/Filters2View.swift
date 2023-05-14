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
class Filters2View: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var buttonViewItems: UIButton!

	@IBOutlet var cellSize: UITableViewCell!
	@IBOutlet var cellColor: UITableViewCell!
	@IBOutlet var cellPrice: UITableViewCell!

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

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(actionReset(_:)))

		collectionViewSize.register(UINib(nibName: "Filters2Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Filters2Cell1")
		collectionViewColor.register(UINib(nibName: "Filters2Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Filters2Cell2")

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
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters2View: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 4
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return style.count	}
		if (section == 1) { return 1			}
		if (section == 2) { return 1			}
		if (section == 3) { return 1			}

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) {
			var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
			if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

			cell.tintColor = AppColor.Theme
			cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
			cell.accessoryType = selectedStyle.contains(indexPath) ? .checkmark : .none
			cell.textLabel?.text = style[indexPath.row]
			cell.textLabel?.font = UIFont.systemFont(ofSize: 16)

			return cell
		}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellSize	}
		if (indexPath.section == 2) && (indexPath.row == 0) { return cellColor	}
		if (indexPath.section == 3) && (indexPath.row == 0) { return cellPrice	}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters2View: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 50
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return "STYLE"		}
		if (section == 1) { return "SIZE, UK"	}
		if (section == 2) { return "COLOR"		}
		if (section == 3) { return "PRICE"		}

		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 45 }
		if (indexPath.section == 1) { return 70 }
		if (indexPath.section == 2) { return 70 }
		if (indexPath.section == 3) { return 70 }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)

		if (indexPath.section == 0) {
			if selectedStyle.contains(indexPath) {
				selectedStyle.remove(indexPath)
			} else {
				selectedStyle.insert(indexPath)
			}
			tableView.reloadRows(at: [indexPath], with: .automatic)
		}
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters2View: UICollectionViewDataSource {

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
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Filters2Cell1", for: indexPath) as! Filters2Cell1
			cell.labelSize.text = size[indexPath.row]
			cell.setSize(isSelected: selectedSize.contains(indexPath))
			return cell
		}
		if (collectionView == collectionViewColor) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Filters2Cell2", for: indexPath) as! Filters2Cell2
			cell.bindData(color: color[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Filters2View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

		print(indexPath)
		if (collectionView == collectionViewColor) {
			if let cell = cell as? Filters2Cell2 {
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
extension Filters2View: UICollectionViewDelegateFlowLayout {

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
