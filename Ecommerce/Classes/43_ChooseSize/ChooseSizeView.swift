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
class ChooseSizeView: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!

	private var sizes: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		labelTitle.text = "Choose Size"
		labelSubTitle.text = "Chukka Boots"

		tableView.register(UINib(nibName: "ChooseSizeCell", bundle: Bundle.main), forCellReuseIdentifier: "ChooseSizeCell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		sizes.removeAll()

		var dict1: [String: String] = [:]
		dict1["size"] = "39"
		dict1["leftCount"] = ""
		sizes.append(dict1)

		var dict2: [String: String] = [:]
		dict2["size"] = "40"
		dict2["leftCount"] = ""
		sizes.append(dict2)

		var dict3: [String: String] = [:]
		dict3["size"] = "41"
		dict3["leftCount"] = "Last 1 left"
		sizes.append(dict3)

		var dict4: [String: String] = [:]
		dict4["size"] = "42"
		dict4["leftCount"] = ""
		sizes.append(dict4)

		var dict5: [String: String] = [:]
		dict5["size"] = "43"
		dict5["leftCount"] = ""
		sizes.append(dict5)

		var dict6: [String: String] = [:]
		dict6["size"] = "44"
		dict6["leftCount"] = ""
		sizes.append(dict6)

		var dict7: [String: String] = [:]
		dict7["size"] = "45"
		dict7["leftCount"] = ""
		sizes.append(dict7)

		var dict8: [String: String] = [:]
		dict8["size"] = "46"
		dict8["leftCount"] = ""
		sizes.append(dict8)

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
	@IBAction func actionSizeGuide(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddCart(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ChooseSizeView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return sizes.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseSizeCell", for: indexPath) as! ChooseSizeCell
		cell.bindData(data: sizes[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension ChooseSizeView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 40
	}
}
