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
class LiveVideo2Cell2: UITableViewCell {

	@IBOutlet var imageAdd: UIImageView!
	@IBOutlet var labelComment: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: Any]) {

		guard let name = data["name"] as? String else { return }
		guard let comment = data["comment"] as? String else { return }

		labelComment.text = name + " " + comment
	}
}
