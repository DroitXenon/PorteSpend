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
class Book2View: UIViewController {

	@IBOutlet var imageBooks: UIImageView!
	@IBOutlet var labelAuthor: UILabel!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var viewRating: UIView!
	@IBOutlet var labelRating: UILabel!
	@IBOutlet var labelReview: UILabel!
	@IBOutlet var buttonFavorite: UIButton!

	@IBOutlet var buttonTab1: UIButton!
	@IBOutlet var buttonTab2: UIButton!
	@IBOutlet var buttonTab3: UIButton!

	@IBOutlet var viewTab1: UIView!
	@IBOutlet var viewTab2: UIView!
	@IBOutlet var viewTab3: UIView!

	@IBOutlet var labelDescription: UILabel!

	@IBOutlet var labelCategory: UILabel!
	@IBOutlet var labelPublished: UILabel!
	@IBOutlet var labelPrintLength: UILabel!
	@IBOutlet var labelLanguage: UILabel!
	@IBOutlet var labelPrintLength1: UILabel!
	@IBOutlet var labelLanguage1: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let buttonShare = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))
		navigationItem.rightBarButtonItem = buttonShare

		buttonFavorite.layer.borderWidth = 1
		buttonFavorite.layer.borderColor = AppColor.Border.cgColor

		viewRating.layer.borderWidth = 1
		viewRating.layer.borderColor = AppColor.Border.cgColor

		updateUI()
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageBooks.sample("Reader", "Art", 24)
		labelAuthor.text = "David J. Schwartz"
		labelName.text = "The Magic of Thinking Big"
		labelDate.text = "Mar 19, 1959 - 228 Pages"
		labelRating.text = "4.9"
		labelReview.text = "19.5k reviews"
		buttonTab1.isSelected = true
		labelDescription.text = """
		DR DAVID J SCHWARTZ was a world-renowned motivational speaker and personal development expert. Born in the United States in 1927, he went on to be a professor at Georgia State University, and later founded his own consultancy firm, Creative Educational Services Inc.

		CES Inc. specialised in leadership development and life strategy, subjects which Swchartz went on to write several highly-acclaimed books about. He passed away in 1987.
		"""
		labelCategory.text = "Personal Development"
		labelPublished.text = "Mar 19, 1959"
		labelPrintLength.text = "228 Pages"
		labelLanguage.text = "English"
		labelPrintLength1.text = "228 Pages"
		labelLanguage1.text = "English"
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		buttonTab1.titleLabel?.textColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.label
		buttonTab2.titleLabel?.textColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.label
		buttonTab3.titleLabel?.textColor = buttonTab3.isSelected ? AppColor.Theme : UIColor.label

		viewTab1.backgroundColor = buttonTab1.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
		viewTab2.backgroundColor = buttonTab2.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
		viewTab3.backgroundColor = buttonTab3.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddLibrary(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFavorite(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab1(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = true
		buttonTab2.isSelected = false
		buttonTab3.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab2(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = true
		buttonTab3.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTab3(_ sender: UIButton) {

		print(#function)
		buttonTab1.isSelected = false
		buttonTab2.isSelected = false
		buttonTab3.isSelected = true
		updateUI()
	}
}
