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

import Foundation
import Charts

//-----------------------------------------------------------------------------------------------------------------------------------------------
public class StepsDateValueFormatter: NSObject, IAxisValueFormatter {

	private let dateFormatter = DateFormatter()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	public func stringForValue(_ value: Double, axis: AxisBase?) -> String {

		dateFormatter.dateFormat = "HH"
		if let date = dateFormatter.date(from: "\(Int(value))") {
			dateFormatter.dateFormat = "HH:mm"
			return dateFormatter.string(from: date)
		}
		dateFormatter.dateFormat = "HH:mm"
		return dateFormatter.string(from: Date(timeIntervalSince1970: value))
	}
}
