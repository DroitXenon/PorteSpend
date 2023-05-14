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
import FSCalendar

//-----------------------------------------------------------------------------------------------------------------------------------------------
class SelectDatesView: UIViewController {

	@IBOutlet var calendar: FSCalendar!
	@IBOutlet var labelCheckin: UILabel!
	@IBOutlet var labelCheckout: UILabel!
	@IBOutlet var labelTotalDayNight: UILabel!

	let gregorian = Calendar(identifier: .gregorian)
	var fromDate: Date?
	var toDate: Date?

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Select dates"

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .done, target: self, action: #selector(actionReset))

		setupCalendar()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionReset() {

		print(#function)

		fromDate = nil
		toDate = nil
		for date in calendar.selectedDates {
			calendar.deselect(date)
		}
		configureVisibleCells()

		labelCheckin.text = "-"
		labelCheckout.text = "-"
		labelTotalDayNight.text = "-"
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDone(_ sender: Any) {

		dismiss(animated: true, completion: nil)
	}

	// MARK: - Calendar methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setupCalendar() {

		calendar.dataSource = self
		calendar.delegate = self
		calendar.today = nil
		calendar.firstWeekday = 2
		calendar.appearance.borderRadius = 0.2
		calendar.placeholderType = .none
		calendar.isMultipleTouchEnabled = true
		calendar.swipeToChooseGesture.isEnabled = true
		calendar.pagingEnabled = false
		calendar.scrollDirection = .vertical
		calendar.collectionView.register(UINib(nibName: "SelectDatesCell", bundle: nil), forCellWithReuseIdentifier: "SelectDatesCell")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func configureVisibleCells() {

		calendar.visibleCells().forEach { cell in
			let date = calendar.date(for: cell)
			let position = calendar.monthPosition(for: cell)
			configure(cell: cell, for: date!, at: position)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func configure(cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {

		let currentCell = (cell as! SelectDatesCell)

		currentCell.viewInRange.isHidden = true
		currentCell.viewSelectedStart.isHidden = true
		currentCell.viewSelectedEnd.isHidden = true

		if position == .current {

			if calendar.selectedDates.contains(date) {

				let previousDate = gregorian.date(byAdding: .day, value: -1, to: date)!
				let nextDate = gregorian.date(byAdding: .day, value: 1, to: date)!
				if calendar.selectedDates.contains(previousDate) && calendar.selectedDates.contains(nextDate) {
					currentCell.viewInRange.isHidden = false
					cell.titleLabel.textColor = UIColor.label
				} else if calendar.selectedDates.contains(previousDate) {
					currentCell.viewSelectedEnd.isHidden = false
					cell.titleLabel.textColor = UIColor.white
				} else {
					currentCell.viewSelectedStart.isHidden = false
					cell.titleLabel.textColor = UIColor.white
				}
			}
		}
	}
}

// MARK:- FSCalendarDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SelectDatesView: FSCalendarDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {

		let cell = calendar.dequeueReusableCell(withIdentifier: "SelectDatesCell", for: date, at: position) as! SelectDatesCell
		return cell
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {

		configure(cell: cell, for: date, at: position)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {

		let dateformatter = DateFormatter()
		dateformatter.dateFormat = "d"
		return dateformatter.string(from: date)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func minimumDate(for calendar: FSCalendar) -> Date {

		return Date()
	}
}

// MARK:- FSCalendarDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SelectDatesView: FSCalendarDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {

		return monthPosition == .current
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {

		return monthPosition == .current
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "EEE, MMM dd"

		if fromDate == nil {

			fromDate = date
			labelCheckin.text = dateFormatter.string(from: fromDate!)
			labelTotalDayNight.text = "-"
		}
		else if toDate == nil {

			if date < fromDate! {
				fromDate = date
				toDate = nil

				for date in calendar.selectedDates {
					calendar.deselect(date)
				}
				calendar.select(date, scrollToDate: false)

				labelCheckin.text = dateFormatter.string(from: fromDate!)
				labelCheckout.text = "-"
				labelTotalDayNight.text = "-"
			}
			else {
				toDate = date
				var dates: [Date] = []
				dates = fromDate!.allDates(till: toDate!)
				dates.forEach { date in
					calendar.select(date, scrollToDate: false)
				}

				labelCheckin.text = dateFormatter.string(from: fromDate!)
				labelCheckout.text = dateFormatter.string(from: toDate!)
				if let totalDays = toDate?.days(from: fromDate!) {
					labelTotalDayNight.text = "\(totalDays) days (\(totalDays - 1) nights)"
				}
				else {
					labelTotalDayNight.text = "-"
				}
			}
		}
		else {
			fromDate = date
			toDate = nil
			for date in calendar.selectedDates {
				calendar.deselect(date)
			}
			calendar.select(date, scrollToDate: false)

			labelCheckin.text = dateFormatter.string(from: fromDate!)
			labelCheckout.text = "-"
			labelTotalDayNight.text = "-"
		}
		configureVisibleCells()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func calendar(_ calendar: FSCalendar, didDeselect date: Date) {

		configureVisibleCells()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {

		return [appearance.eventDefaultColor]
	}
}
