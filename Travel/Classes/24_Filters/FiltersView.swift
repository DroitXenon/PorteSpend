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
import MultiSlider

//-----------------------------------------------------------------------------------------------------------------------------------------------
class FiltersView: UIViewController {

	@IBOutlet var labelCountry: UILabel!
	@IBOutlet var labelCity: UILabel!
	@IBOutlet var viewSliderPrice: UIView!
	@IBOutlet var viewSliderDuration: UIView!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var constraintCollectionViewHeight: NSLayoutConstraint!

	let types = ["Rail", "Theme Tours", "Classic", "Family", "Yolo", "Active"]
	let countries = ["India", "China", "Japan", "Thailand"]
	let cities = ["New York", "Ahmedabad", "Bangkok", "Toyata"]
	var isCountries = true
	private var selectedType = -1

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Filters"

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(actionClose))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(actionDone))

		collectionView.register(UINib(nibName: "FiltersCell", bundle: nil), forCellWithReuseIdentifier: "FiltersCell")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidAppear(_ animated: Bool) {

		setupSliderFor(view: viewSliderPrice, minValue: 1, maxValue: 2000, prefix: "$", suffix: nil)
		setupSliderFor(view: viewSliderDuration, minValue: 1, maxValue: 31, prefix: nil, suffix: " days")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintCollectionViewHeight.constant = collectionView.contentSize.height
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionClose() {

		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDone() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCountries(_ sender: Any) {

		isCountries = true
		showPickerView(title: "Select country", label: labelCountry)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCities(_ sender: Any) {

		isCountries = false
		showPickerView(title: "Select city", label: labelCity)
	}

	// MARK: - Picker methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func showPickerView(title: String, label: UILabel) {

		let alertView = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)

		let height:NSLayoutConstraint = NSLayoutConstraint(item: alertView.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
		alertView.view.addConstraint(height)

		let pickerview = UIPickerView(frame: CGRect(x: 0, y: 35, width: alertView.view.frame.size.width - 16, height: 200))
		pickerview.delegate = self
		pickerview.dataSource = self

		alertView.view.addSubview(pickerview)

		alertView.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
			if self.isCountries {
				label.text = self.countries[pickerview.selectedRow(inComponent: 0)]
			}
			else {
				label.text = self.cities[pickerview.selectedRow(inComponent: 0)]
			}
		}))
		present(alertView, animated: true, completion: nil)
	}

	// MARK: - Slider methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setupSliderFor(view: UIView, minValue: CGFloat, maxValue: CGFloat, prefix: String?, suffix: String?) {

		let slider = MultiSlider(frame: CGRect(x: 0, y: 0, width: viewSliderPrice.frame.size.width, height: viewSliderPrice.frame.size.height))
		slider.minimumValue = minValue
		slider.maximumValue = maxValue
		slider.snapStepSize = 1
		slider.orientation = .horizontal
		slider.outerTrackColor = .lightGray
		slider.tintColor = AppColor.Theme
		slider.valueLabelPosition = .firstBaseline
		slider.value = [minValue,maxValue]

		if prefix != nil {
			slider.valueLabelFormatter.positivePrefix = prefix
		}
		else if suffix != nil {
			slider.valueLabelFormatter.positiveSuffix = suffix
		}

		slider.showsThumbImageShadow = false
		slider.keepsDistanceBetweenThumbs = true
		view.addSubview(slider)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}
}

// MARK:- UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return types.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FiltersCell", for: indexPath) as! FiltersCell
		cell.bindData(type: types[indexPath.row])
		if (selectedType == indexPath.row) {
			cell.buttonType.isSelected = true
			cell.buttonType.tintColor = AppColor.Theme
		}
		else {
			cell.buttonType.isSelected = false
			cell.buttonType.tintColor = UIColor.lightGray
		}
		return cell
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		selectedType = indexPath.row
		collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersView: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width

		return CGSize(width: (width - 10)/2, height: 30)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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

// MARK: - UIPickerViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersView: UIPickerViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

		if isCountries {
			return countries[row]
		}
		else {
			return cities[row]
		}
	}
}

// MARK: - UIPickerViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension FiltersView: UIPickerViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfComponents(in pickerView: UIPickerView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

		if isCountries {
			return countries.count
		}
		else {
			return cities.count
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {

		return 30.0
	}
}
