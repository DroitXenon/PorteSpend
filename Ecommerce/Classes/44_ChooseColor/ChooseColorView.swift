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
class ChooseColorView: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!

	private var colors: [[String: Any]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		labelTitle.text = "Choose Color"
		labelSubTitle.text = "Chukka Boots"

		tableView.register(UINib(nibName: "ChooseColorCell1", bundle: Bundle.main), forCellReuseIdentifier: "ChooseColorCell1")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		colors.removeAll()

		var dict1: [String: Any] = [:]
		dict1["color"] = UIColor.black
		dict1["colorName"] = "Black"
		dict1["leftCount"] = ""
		colors.append(dict1)

		var dict2: [String: Any] = [:]
		dict2["color"] = UIColor.white
		dict2["colorName"] = "White"
		dict2["leftCount"] = ""
		colors.append(dict2)

		var dict3: [String: Any] = [:]
		dict3["color"] = UIColor.gray
		dict3["colorName"] = "Gray"
		dict3["leftCount"] = "Last 1 left - 9 UK size"
		colors.append(dict3)

		var dict4: [String: Any] = [:]
		dict4["color"] = UIColor.green
		dict4["colorName"] = "Green"
		dict4["leftCount"] = ""
		colors.append(dict4)

		var dict5: [String: Any] = [:]
		dict5["color"] = UIColor.purple
		dict5["colorName"] = "Purple"
		dict5["leftCount"] = ""
		colors.append(dict5)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
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

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ChooseColorView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return colors.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseColorCell1", for: indexPath) as! ChooseColorCell1
		cell.bindData(data: colors[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ChooseColorView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 50
	}
}
