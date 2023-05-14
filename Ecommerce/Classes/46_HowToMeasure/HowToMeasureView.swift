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
class HowToMeasureView: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellImageDescription: UITableViewCell!
	@IBOutlet var cellStep1: UITableViewCell!
	@IBOutlet var cellStep2: UITableViewCell!

	@IBOutlet var imageMeasure: UIImageView!
	@IBOutlet var labelImageDescription: UILabel!
	@IBOutlet var labelStep1Description: UILabel!
	@IBOutlet var labelStep2Description: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "How to Measure"
		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageMeasure.sample("Ecommerce", "Shoes", 3)
		labelImageDescription.text = "You may find one foot is longer than the other, this is quite normal, please use the larger size when making your shoe size selection. If your foot measurement is halfway between sizes, select the larger size."
		labelStep1Description.text = "Measure your foot length by placing a ruler flat on the floor straight alongside the inside of your foot from your heel to your toes."
		labelStep2Description.text = "Place an object with a flat edge straight across your toes with the edge touching the tip of your longest toe. Take the measurement (in millimeters) from the ruler where the flat edge crosses (see image above). This is your foot length measurement."
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension HowToMeasureView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return 3
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.row == 0) { return cellImageDescription	}
		if (indexPath.row == 1) { return cellStep1				}
		if (indexPath.row == 2) { return cellStep2				}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension HowToMeasureView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}
}
