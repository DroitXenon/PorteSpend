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
extension Date {

	var millisecondsSince1970:Int {
		return Int((self.timeIntervalSince1970 * 1000.0).rounded())
	}

	var currentYear: Int {
		let calendar = Calendar.current
		return calendar.component(.year, from: self)
	}

	var currentMonth: Int {
		let calendar = Calendar.current
		return calendar.component(.month, from: self)
	}

	var currentDay: Int {
		let calendar = Calendar.current
		return calendar.component(.day, from: self)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	static func getCurrentMonthFirstDate() -> Date {

		return Date().getCurrentMonthFirstDate()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	static func getCurrentYearFirstDate() -> Date {

		return Date().getCurrentYearFirstDate()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func getCurrentMonthFirstDate() -> Date {

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"

		let components = Calendar.current.dateComponents([.year, .month], from: self)
		let startOfMonth = "\(components.year!)-\(components.month!)-01"

		return dateFormatter.date(from: startOfMonth)!
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func getCurrentYearFirstDate() -> Date {

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"

		let components = Calendar.current.dateComponents([.year, .month], from: self)
		let startOfYear = "\(components.year!)-01-01"

		return dateFormatter.date(from: startOfYear)!
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func toString(withFormate formate: String) -> String {

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = formate
		return dateFormatter.string(from: self)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func getNumberOfWeekForMonth() -> Int {

		var calendar = Calendar.current
		calendar.firstWeekday = 1 // 2 == Monday
		let monthLastDate = self.add(month: 1, day: -1)

		let firstDC = calendar.dateComponents([.weekday], from: self)
		let lastDC = calendar.dateComponents([.weekday], from: monthLastDate)

		if ((firstDC.weekday! >= 6) || (firstDC.weekday! >= 7)) && ((lastDC.weekday == 1) || (lastDC.weekday == 2)) {
			return 6
		} else {
			let first = calendar.date(bySetting: .weekdayOrdinal, value: 1, of: self)!
			let last = calendar.date(bySetting: .weekdayOrdinal, value: 1, of: monthLastDate)!

			let weeks = calendar.dateComponents([.weekOfMonth,.yearForWeekOfYear], from: first, to: last)
			return weeks.weekOfMonth! + 1
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func getDayOfWeek(firstWeekDay: Int = 1) -> Int {

		var calendar = Calendar.current
		calendar.firstWeekday = firstWeekDay // 1 is Sunday
		let components = calendar.component(.weekday, from: self)
		return components
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func isToday() -> Bool {

		return Calendar.current.isDateInToday(self)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func add(year: Int = 0, month: Int = 0, day: Int = 0) -> Date {

		var dateComponents = DateComponents()
		dateComponents.year = year
		dateComponents.month = month
		dateComponents.day = day

		return Calendar.current.date(byAdding: dateComponents, to: self)!
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func isMonth(in date: Date) -> Bool {

		let todayDateCompo = Calendar.current.dateComponents([.year, .month], from: date)
		let selfDateCompo = Calendar.current.dateComponents([.year, .month], from: self)
		return (todayDateCompo == selfDateCompo)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func isCurrentMonth() -> Bool {

		let todayDateCompo = Calendar.current.dateComponents([.year, .month], from: Date())
		let selfDateCompo = Calendar.current.dateComponents([.year, .month], from: self)
		return (todayDateCompo == selfDateCompo)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func isStartingDate(of arrDates:[Date]) -> Bool {

		if let date = arrDates.first {
			let todayDateCompo = Calendar.current.dateComponents([.year, .month, .day], from: date)
			let selfDateCompo = Calendar.current.dateComponents([.year, .month, .day], from: self)
			return (todayDateCompo == selfDateCompo)
		}
		return false
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func isEndingDate(of arrDates:[Date]) -> Bool {

		if let date = arrDates.last {
			let todayDateCompo = Calendar.current.dateComponents([.year, .month, .day], from: date)
			let selfDateCompo = Calendar.current.dateComponents([.year, .month, .day], from: self)
			return (todayDateCompo == selfDateCompo)
		}
		return false
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func isDateInBetween(of arrDates:[Date]) -> Bool {

		if let firstDate = arrDates.first,
			let lastDate = arrDates.last{
			return (firstDate<self && self<lastDate)
		}
		return false
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func isDateEqualOrInBetween(of arrDates:[Date]) -> Bool {

		if let firstDate = arrDates.first,
			let lastDate = arrDates.last{
			return (firstDate<=self && self<=lastDate)
		}
		return false
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func isFromThis(month: Date) -> Bool {

		let todayDateCompo = Calendar.current.dateComponents([.year, .month], from: self)
		let selfDateCompo = Calendar.current.dateComponents([.year, .month], from: month)
		return (todayDateCompo == selfDateCompo)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func isDateGreter(than date:Date) -> Bool {

		return self>date
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func toMillis() -> Int64! {

		return Int64(self.timeIntervalSince1970)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func getElapsedInterval() -> String {

		let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self, to: Date())

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
		let myString = dateFormatter.string(from: self)
		let yourDate = dateFormatter.date(from: myString)

		if let days = interval.day, days > 1 {
			dateFormatter.dateFormat = "d MMM yyyy"
			let myStringafd = dateFormatter.string(from: yourDate!)
			return myStringafd
		} else if let day = interval.day, day > 0 {
			return day == 1 ? "Yesterday" :
				"\(day)" + " " + "days"
		} else {
			dateFormatter.dateFormat = "h:mm a"
			let todayTime = dateFormatter.string(from: yourDate!)
			return todayTime
		}
	}
}

//-----------------------------------------------------------------------------------------------------------------------------------------------
extension String {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func toDate(withFormate formate: String) -> Date {

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = formate
		return dateFormatter.date(from: self)!
	}
}
