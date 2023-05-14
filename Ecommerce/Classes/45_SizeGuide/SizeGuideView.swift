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
class SizeGuideView: UIViewController {

	@IBOutlet var labelSubTitle: UILabel!

	@IBOutlet var viewCentimeters: UIView!
	@IBOutlet var viewInches: UIView!

	@IBOutlet var buttonCentimeters: UIButton!
	@IBOutlet var buttonInches: UIButton!

	@IBOutlet var labelSize1: UILabel!
	@IBOutlet var labelSize2: UILabel!
	@IBOutlet var labelSize3: UILabel!

	@IBOutlet var labelFootLength1: UILabel!
	@IBOutlet var labelFootLength2: UILabel!
	@IBOutlet var labelFootLength3: UILabel!

	@IBOutlet var labelUK1: UILabel!
	@IBOutlet var labelUK2: UILabel!
	@IBOutlet var labelUK3: UILabel!

	@IBOutlet var labelUSA1: UILabel!
	@IBOutlet var labelUSA2: UILabel!
	@IBOutlet var labelUSA3: UILabel!

	@IBOutlet var labelEU1: UILabel!
	@IBOutlet var labelEU2: UILabel!
	@IBOutlet var labelEU3: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Size Guide"

		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		labelSubTitle.text = "Men's Size Conversion Chart"

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSize1.text			= buttonCentimeters.isSelected ? "3.5"	: "3.5"
		labelSize2.text			= buttonCentimeters.isSelected ? "4"	: "4"
		labelSize3.text			= buttonCentimeters.isSelected ? "4.5"	: "4.5"
		labelFootLength1.text	= buttonCentimeters.isSelected ? "22"	: "22"
		labelFootLength2.text	= buttonCentimeters.isSelected ? "22.5"	: "22.5"
		labelFootLength3.text	= buttonCentimeters.isSelected ? "23"	: "23"
		labelUK1.text			= buttonCentimeters.isSelected ? "3.5"	: "3.5"
		labelUK2.text			= buttonCentimeters.isSelected ? "4"	: "4"
		labelUK3.text			= buttonCentimeters.isSelected ? "4.5"	: "4.5"
		labelUSA1.text			= buttonCentimeters.isSelected ? "4"	: "4"
		labelUSA2.text			= buttonCentimeters.isSelected ? "4.5"	: "4.5"
		labelUSA3.text			= buttonCentimeters.isSelected ? "5"	: "5"
		labelEU1.text			= buttonCentimeters.isSelected ? "36"	: "36"
		labelEU2.text			= buttonCentimeters.isSelected ? "36.5"	: "36.5"
		labelEU3.text			= buttonCentimeters.isSelected ? "37.5"	: "37.5"
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		buttonCentimeters.titleLabel?.textColor	= buttonCentimeters.isSelected ? AppColor.Theme : UIColor.label
		buttonInches.titleLabel?.textColor		= buttonInches.isSelected ? AppColor.Theme : UIColor.label

		viewCentimeters.backgroundColor	= buttonCentimeters.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
		viewInches.backgroundColor		= buttonInches.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMeasure(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCentimeters(_ sender: UIButton) {

		print(#function)
		buttonCentimeters.isSelected = true
		buttonInches.isSelected = false
		updateUI()
		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionInches(_ sender: UIButton) {

		print(#function)
		buttonCentimeters.isSelected = false
		buttonInches.isSelected = true
		updateUI()
		loadData()
	}
}
