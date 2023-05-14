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

	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var segmentControl: UISegmentedControl!
	@IBOutlet var labelFrom: UILabel!
	@IBOutlet var labelTo: UILabel!
	@IBOutlet var labelWeek: UILabel!
	@IBOutlet var labelFromDate: UILabel!
	@IBOutlet var labelToDate: UILabel!
	@IBOutlet var labelAdults: UILabel!
	@IBOutlet var labelChildrens: UILabel!

	let locations = ["New York, USA", "Moscow, Russia", "Palo-Alto, CA", "Moscow, Russia", "Palo-Alto, CA", "Moscow, Russia"]
	let counts = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
	var isLocations = true

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Search"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: AppColor.Theme], for: .normal)

		updateUI()
		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .automatic
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelDescription.text = "Refine your search by places, duration or persons"
		labelFrom.text = "New York, USA"
		labelTo.text = "Moscow, Russia"
		labelWeek.text = "2 weeks"
		labelFromDate.text = "Apr 28"
		labelToDate.text = "May 11"
		labelAdults.text = "2 adults"
		labelChildrens.text = "3 childrens"
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		let background = UIColor.systemBackground.image(segmentControl.frame.size)
		let selected = AppColor.Theme.image(segmentControl.frame.size)

		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
		segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
		segmentControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
		segmentControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
		segmentControl.setDividerImage(AppColor.Theme.image(), forLeftSegmentState: .normal, rightSegmentState: [.normal, .highlighted, .selected], barMetrics: .default)
		segmentControl.layer.borderWidth = 1
		segmentControl.layer.borderColor = AppColor.Theme.cgColor
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSegment(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFrom(_ sender: Any) {

		isLocations = true
		showPickerView(title: "Select from", label: labelFrom, valueIndicator: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTo(_ sender: Any) {

		isLocations = true
		showPickerView(title: "Select to", label: labelTo, valueIndicator: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFromDate(_ sender: Any) {

		showDatePickerView(title: "Select from date", label: labelFromDate)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionToDate(_ sender: Any) {

		showDatePickerView(title: "Select to date", label: labelToDate)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAdults(_ sender: Any) {

		isLocations = false
		showPickerView(title: "Select adults", label: labelAdults, valueIndicator: "adults")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionChildrens(_ sender: Any) {

		isLocations = false
		showPickerView(title: "Select childrens", label: labelChildrens, valueIndicator: "childrens")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSearch(_ sender: Any) {

	}

	// MARK: - Picker methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func showPickerView(title: String, label: UILabel, valueIndicator: String?) {

		let alertView = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)

		let height:NSLayoutConstraint = NSLayoutConstraint(item: alertView.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
		alertView.view.addConstraint(height)

		let pickerview = UIPickerView(frame: CGRect(x: 0, y: 35, width: alertView.view.frame.size.width - 16, height: 200))
		pickerview.delegate = self
		pickerview.dataSource = self

		alertView.view.addSubview(pickerview)

		alertView.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
			if self.isLocations {
				label.text = self.locations[pickerview.selectedRow(inComponent: 0)]
			}
			else {
				label.text = self.counts[pickerview.selectedRow(inComponent: 0)] + " " + (valueIndicator ?? "")
			}
		}))
		present(alertView, animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func showDatePickerView(title: String, label: UILabel) {

		let alertView = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)

		let height:NSLayoutConstraint = NSLayoutConstraint(item: alertView.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
		alertView.view.addConstraint(height)

		let datepickerview = UIDatePicker(frame: CGRect(x: 0, y: 35, width: alertView.view.frame.size.width - 16, height: 200))
		datepickerview.datePickerMode = .date

		alertView.view.addSubview(datepickerview)

		let dateformattor = DateFormatter()
		dateformattor.dateFormat = "MMM dd"

		alertView.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
			label.text = dateformattor.string(from: datepickerview.date)
			let date1 = dateformattor.date(from: self.labelFromDate.text ?? "Apr 28")
			let date2 = dateformattor.date(from: self.labelToDate.text ?? "May 11")
			self.labelWeek.text = "\(date2?.weeks(from: date1 ?? Date()) ?? 2) weeks"
		}))
		present(alertView, animated: true, completion: nil)
	}
}

// MARK: - UIPickerViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SearchView: UIPickerViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

		if isLocations {
			return locations[row]
		}
		else {
			return counts[row]
		}
	}
}

// MARK: - UIPickerViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SearchView: UIPickerViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfComponents(in pickerView: UIPickerView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

		if isLocations {
			return locations.count
		}
		else {
			return counts.count
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {

		return 30.0
	}
}

// MARK: - UIColor
//-----------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension UIColor {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

		return UIGraphicsImageRenderer(size: size).image { rendererContext in
			setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}
