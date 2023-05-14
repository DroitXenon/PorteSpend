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
class SortByView: UIViewController {

	@IBOutlet var pickerView: UIPickerView!

	private var sortBy: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		sortBy.removeAll()

		sortBy.append("Featured")
		sortBy.append("New Items")
		sortBy.append("Price (Hight First)")
		sortBy.append("Price (Low First)")

		refreshPickerView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshPickerView() {

		pickerView.reloadAllComponents()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionClose(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDone(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}
}

// MARK: - UIPickerViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SortByView: UIPickerViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfComponents(in pickerView: UIPickerView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

		sortBy.count
	}
}

// MARK: - UIPickerViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SortByView: UIPickerViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {

		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

		let label = UILabel()
		label.text = sortBy[row]
		label.font = UIFont.systemFont(ofSize: 16)
		label.textAlignment = .center
		return label
	}
}
