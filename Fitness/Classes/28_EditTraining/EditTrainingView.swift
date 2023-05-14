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
class EditTrainingView: UIViewController {

	@IBOutlet var labelDate: UILabel!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!
	@IBOutlet var viewFooter: UIView!

	private var exercises: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Workout"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		tableView.register(UINib(nibName: "EditTrainingCell", bundle: Bundle.main), forCellReuseIdentifier: "EditTrainingCell")
		loadData()
		layoutConstraintTableViewHeight.constant = CGFloat(70 * exercises.count) + 55 + 45

		self.tableView.isEditing = true
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelDate.text = "May 8 - 12, 2020"

		exercises.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Pushups"
		dict1["time"] = "11 min"
		exercises.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Lunges"
		dict2["time"] = "17 min"
		exercises.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Squats"
		dict3["time"] = "12 min"
		exercises.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Standing overhead dumbbell presses"
		dict4["time"] = "11 min"
		exercises.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Dumbbell rows"
		dict5["time"] = "15 min"
		exercises.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Single-leg deadlifts"
		dict6["time"] = "12 min"
		exercises.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Burpees"
		dict7["time"] = "13 min"
		exercises.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "Side planks"
		dict8["time"] = "10 min"
		exercises.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = "Situps"
		dict9["time"] = "20 min"
		exercises.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Glute bridge"
		dict10["time"] = "11 min"
		exercises.append(dict10)
		
		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDate(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionRemoveExercise(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionExerciseSwitch(_ sender: UISwitch) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddExercise(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDone(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension EditTrainingView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return exercises.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "EditTrainingCell", for: indexPath) as! EditTrainingCell
		cell.bindData(data: exercises[indexPath.row])
		cell.buttonRemove.addTarget(self, action: #selector(actionRemoveExercise(_:)), for: .touchUpInside)
		cell.switchExercise.addTarget(self, action: #selector(actionExerciseSwitch(_:)), for: .valueChanged)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension EditTrainingView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 70
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 55
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return "Exercises"
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

		return viewFooter
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {

		return .none
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {

		return false
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

		exercises.swapAt(sourceIndexPath.row, destinationIndexPath.row)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
