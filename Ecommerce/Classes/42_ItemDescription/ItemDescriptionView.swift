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
class ItemDescriptionView: UIViewController {

	@IBOutlet var viewTitle: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!

	@IBOutlet var viewDescriptionOuter: UIView!
	@IBOutlet var viewAboutBrandOuter: UIView!
	@IBOutlet var viewSizeAndFitOuter: UIView!
	@IBOutlet var viewProductDetailsOuter: UIView!

	@IBOutlet var viewDescriptionHeader: UIView!
	@IBOutlet var viewAboutBrandHeader: UIView!
	@IBOutlet var viewSizeAndFitHeader: UIView!
	@IBOutlet var viewProductDetailsHeader: UIView!

	@IBOutlet var viewDescriptionDeails: UIView!
	@IBOutlet var viewAboutBrandDeails: UIView!
	@IBOutlet var viewSizeAndFitDeails: UIView!
	@IBOutlet var viewProductDetailsDeails: UIView!

	@IBOutlet var imageDescription: UIImageView!
	@IBOutlet var imageAboutBrand: UIImageView!
	@IBOutlet var imageSizeAndFit: UIImageView!
	@IBOutlet var imageProductDetails: UIImageView!

	@IBOutlet var viewCentimeters: UIView!
	@IBOutlet var viewInches: UIView!

	@IBOutlet var buttonCentimeters: UIButton!
	@IBOutlet var buttonInches: UIButton!

	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelAboutBrand: UILabel!
	@IBOutlet var labelSizeAndFit: UILabel!
	@IBOutlet var labelHeel: UILabel!
	@IBOutlet var labelCircumference: UILabel!
	@IBOutlet var labelLining: UILabel!
	@IBOutlet var labelSole: UILabel!
	@IBOutlet var labelUpper: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.titleView = viewTitle
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare))

		loadData()
		imageDescription.isHighlighted = true
		imageAboutBrand.isHighlighted = false
		imageSizeAndFit.isHighlighted = true
		imageProductDetails.isHighlighted = true
		updateUI()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Chukka Boots"
		labelSubTitle.text = "$384"

		labelDescription.text = "Alessandro Michele who discovered it on posts on Instagram and in a tongue-in-cheek ode has introduced this new spelling."
		labelAboutBrand.text = "Describe About Info Alessandro Michele who discovered it on posts on Instagram and in a tongue-in-cheek ode has introduced this new spelling."

		labelSizeAndFit.text = "Below are the measurements for Brogues in size 9 UK"
		labelHeel.text = "3" + " cm"
		labelCircumference.text = "27" + " cm"

		labelLining.text = "100% Real Leather"
		labelSole.text = "100% Other Materials"
		labelUpper.text = "100% Textile"
	}

	// MARK: - Helper methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		viewDescriptionOuter.layer.cornerRadius = 10
		viewAboutBrandOuter.layer.cornerRadius = 10
		viewSizeAndFitOuter.layer.cornerRadius = 10
		viewProductDetailsOuter.layer.cornerRadius = 10

		viewDescriptionOuter.layer.borderWidth = imageDescription.isHighlighted ? 1 : 0
		viewAboutBrandOuter.layer.borderWidth = imageAboutBrand.isHighlighted ? 1 : 0
		viewSizeAndFitOuter.layer.borderWidth = imageSizeAndFit.isHighlighted ? 1 : 0
		viewProductDetailsOuter.layer.borderWidth = imageProductDetails	.isHighlighted ? 1 : 0

		viewDescriptionOuter.layer.borderColor = AppColor.Border.cgColor
		viewAboutBrandOuter.layer.borderColor = AppColor.Border.cgColor
		viewSizeAndFitOuter.layer.borderColor = AppColor.Border.cgColor
		viewProductDetailsOuter.layer.borderColor = AppColor.Border.cgColor

		viewDescriptionHeader.backgroundColor	= !imageDescription.isHighlighted ? UIColor.tertiarySystemFill : UIColor.systemBackground
		viewAboutBrandHeader.backgroundColor	= !imageAboutBrand.isHighlighted ? UIColor.tertiarySystemFill : UIColor.systemBackground
		viewSizeAndFitHeader.backgroundColor	= !imageSizeAndFit.isHighlighted ? UIColor.tertiarySystemFill : UIColor.systemBackground
		viewProductDetailsHeader.backgroundColor = !imageProductDetails.isHighlighted ? UIColor.tertiarySystemFill : UIColor.systemBackground

		viewDescriptionDeails.isHidden	= !imageDescription.isHighlighted
		viewAboutBrandDeails.isHidden	= !imageAboutBrand.isHighlighted
		viewSizeAndFitDeails.isHidden	= !imageSizeAndFit.isHighlighted
		viewProductDetailsDeails.isHidden = !imageProductDetails.isHighlighted

		buttonCentimeters.titleLabel?.textColor	= buttonCentimeters.isSelected ? AppColor.Theme : UIColor.label
		buttonInches.titleLabel?.textColor		= buttonInches.isSelected ? AppColor.Theme : UIColor.label

		viewCentimeters.backgroundColor	= buttonCentimeters.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
		viewInches.backgroundColor		= buttonInches.isSelected ? AppColor.Theme : UIColor.opaqueSeparator
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddCart(_ sender: UIButton) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDescription(_ sender: UIButton) {

		print(#function)
		imageDescription.isHighlighted = !imageDescription.isHighlighted
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAboutBrand(_ sender: UIButton) {

		print(#function)
		imageAboutBrand.isHighlighted = !imageAboutBrand.isHighlighted
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSizeAndFit(_ sender: UIButton) {

		print(#function)
		imageSizeAndFit.isHighlighted = !imageSizeAndFit.isHighlighted
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProductDetails(_ sender: UIButton) {

		print(#function)
		imageProductDetails.isHighlighted = !imageProductDetails.isHighlighted
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCentimeters(_ sender: UIButton) {

		print(#function)
		buttonCentimeters.isSelected = true
		buttonInches.isSelected = false
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionInches(_ sender: UIButton) {

		print(#function)
		buttonCentimeters.isSelected = false
		buttonInches.isSelected = true
		updateUI()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSizeGuide(_ sender: UIButton) {

		print(#function)
	}
}
