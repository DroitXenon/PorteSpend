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
class AddRecipeView: UIViewController {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var viewHeader: UIView!

	@IBOutlet var imageViewCover: UIImageView!
	@IBOutlet var buttonCamera: UIButton!

	@IBOutlet var cellCategory: UITableViewCell!
	@IBOutlet var cellTitle: UITableViewCell!
	@IBOutlet var cellDescription: UITableViewCell!
	@IBOutlet var cellPreparationTime: UITableViewCell!
	@IBOutlet var cellServingsCalories: UITableViewCell!

	@IBOutlet var textFieldCategory: UITextField!
	@IBOutlet var textFieldTitle: UITextField!
	@IBOutlet var textFieldDescription: UITextField!
	@IBOutlet var textFieldPreparationTime: UITextField!
	@IBOutlet var textFieldServings: UITextField!
	@IBOutlet var textFieldCalories: UITextField!

	@IBOutlet var cellAddIngredients: UITableViewCell!
	@IBOutlet var cellAddDirections: UITableViewCell!

	private var ingredients: [String] = []
	private var directions: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Add Recipe"

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(actionCancel(_:)))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(actionDone(_:)))

		tableView.register(UINib(nibName: "AddRecipeCell", bundle: Bundle.main), forCellReuseIdentifier: "AddRecipeCell")
		tableView.tableFooterView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 10, height: 10)))

		buttonCamera.layer.borderWidth = 1
		buttonCamera.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setBackground(color: .clear)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)

		if let navBar = navigationController as? NavigationController {
			navBar.setNavigationBar()
		}
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageViewCover.sample("Food", "Breakfast", 25)

		let attribute = [NSAttributedString.Key.foregroundColor: UIColor.label]
		textFieldCategory.attributedPlaceholder = NSAttributedString(string: "Category", attributes: attribute)
		textFieldTitle.attributedPlaceholder = NSAttributedString(string: "Title", attributes: attribute)
		textFieldDescription.attributedPlaceholder = NSAttributedString(string: "Description", attributes: attribute)
		textFieldPreparationTime.attributedPlaceholder = NSAttributedString(string: "Preparation Time", attributes: attribute)
		textFieldServings.attributedPlaceholder = NSAttributedString(string: "Servings", attributes: attribute)
		textFieldCalories.attributedPlaceholder = NSAttributedString(string: "Calories", attributes: attribute)

		ingredients.removeAll()
		directions.removeAll()

		ingredients.append("")
		directions.append("")

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCancel(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDone(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCategory(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPreparationTime(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionServings(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionRemove(_ sender: UIButton) {

		print(#function)
		let point = sender.convert(CGPoint.zero, to: tableView)
		if let indexPath = tableView.indexPathForRow(at: point) {
			if (indexPath.section == 1) { ingredients.remove(at: indexPath.row) }
			if (indexPath.section == 2) { directions.remove(at: indexPath.row) }
			tableView.reloadData()
		}
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AddRecipeView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 5						}
		if (section == 1) { return ingredients.count + 1	}
		if (section == 2) { return directions.count + 1		}
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


		if (indexPath.section == 0) && (indexPath.row == 0) { return cellCategory			}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellTitle				}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellDescription		}
		if (indexPath.section == 0) && (indexPath.row == 3) { return cellPreparationTime	}
		if (indexPath.section == 0) && (indexPath.row == 4) { return cellServingsCalories	}

		if (indexPath.section == 1) && (indexPath.row == ingredients.count) { return cellAddIngredients	}
		if (indexPath.section == 2) && (indexPath.row == directions.count) { return cellAddDirections	}

		if (indexPath.section == 1) && (indexPath.row < ingredients.count) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "AddRecipeCell", for: indexPath) as! AddRecipeCell
			cell.textField.text = ingredients[indexPath.row]
			cell.buttonRemove.addTarget(self, action: #selector(actionRemove(_:)), for: .touchUpInside)
			return cell
		}

		if (indexPath.section == 2) && (indexPath.row < directions.count) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "AddRecipeCell", for: indexPath) as! AddRecipeCell
			cell.textField.text = directions[indexPath.row]
			cell.buttonRemove.addTarget(self, action: #selector(actionRemove(_:)), for: .touchUpInside)
			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AddRecipeView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 55
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 180	}
		if (section == 1) { return 55	}
		if (section == 2) { return 55	}
		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 1) { return "Ingredients"	}
		if (section == 2) { return "Directions"		}
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		if (section == 0) { return viewHeader }
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if (section == 0) {
			return
		}

		if (section != 0) {
			if let header = view as? UITableViewHeaderFooterView {
				let viewY = header.frame.size.height - 0.5
				let view = UIView(frame: CGRect(x: 15, y: viewY, width: header.frame.size.width, height: 0.5))
				view.backgroundColor = .tertiarySystemFill
				view.tag = 1001
				header.contentView.subviews.forEach { (view) in
					if (view.tag == 1001) {
						view.removeFromSuperview()
					}
				}
				header.contentView.addSubview(view)
				header.textLabel?.font = UIFont.systemFont(ofSize: 12)
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)

		if (indexPath.section == 1) && (indexPath.row == ingredients.count) {
			ingredients.append("")
		}
		if (indexPath.section == 2) && (indexPath.row == directions.count) {
			directions.append("")
		}
		tableView.reloadData()
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AddRecipeView: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.tag == 11 {
			if let navController = navigationController as? NavigationController {
				if (scrollView.contentOffset.y > 90) {
					navController.setBackground(color: .systemBackground)
				} else {
					navController.setBackground(color: .clear)
				}
			}
		}
	}
}
