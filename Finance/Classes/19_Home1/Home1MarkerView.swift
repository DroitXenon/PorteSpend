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
import Charts

//-----------------------------------------------------------------------------------------------------------------------------------------------
class Home1MarkerView: MarkerImage {

	var color: UIColor = .systemBackground
	var arrowSize = CGSize(width: 15, height: 8)
	var insets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 15, right: 8)
	var minimumSize = CGSize()

	fileprivate var label: String?
	fileprivate var _labelSize: CGSize = CGSize()
	fileprivate var _paragraphStyle: NSMutableParagraphStyle?
	fileprivate var _drawAttributes = [NSAttributedString.Key : Any]()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	public override init() {

		_paragraphStyle = NSParagraphStyle.default.mutableCopy() as? NSMutableParagraphStyle
		_paragraphStyle?.alignment = .center
		super.init()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	open override func offsetForDrawing(atPoint point: CGPoint) -> CGPoint {

		var offset = self.offset
		var size = self.size

		if size.width == 0.0 && image != nil {
			size.width = image!.size.width
		}
		if size.height == 0.0 && image != nil {
			size.height = image!.size.height
		}

		let width = size.width
		let height = size.height
		let padding: CGFloat = 8.0

		var origin = point
		origin.x -= width / 2
		origin.y -= height

		if origin.x + offset.x < 0.0 {
			offset.x = -origin.x + padding
		} else if let chart = chartView, (origin.x + width + offset.x) > (chart.bounds.size.width) {
			offset.x = chart.bounds.size.width - origin.x - width - padding
		}

		if origin.y + offset.y < 0 {
			offset.y = height + padding;
		} else if let chart = chartView, (origin.y + height + offset.y) > (chart.bounds.size.height) {
			offset.y = chart.bounds.size.height - origin.y - height - padding
		}

		return offset
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	open override func draw(context: CGContext, point: CGPoint) {

		guard let label = label else { return }

		let offset = self.offsetForDrawing(atPoint: point)
		let size = self.size

		var rect = CGRect(origin: CGPoint(x: point.x + offset.x, y: point.y + offset.y), size: size)
		rect.origin.x -= size.width / 2.0
		rect.origin.y -= size.height

		context.saveGState()
		context.setFillColor(color.cgColor)

		let path = UIBezierPath()

		if offset.y > 0 {
			path.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y + arrowSize.height))
			path.addLine(to: CGPoint(x: rect.origin.x + (rect.size.width - arrowSize.width) / 2.0,
									 y: rect.origin.y + arrowSize.height))

			path.addLine(to: point)
			path.addLine(to: CGPoint(x: rect.origin.x + (rect.size.width + arrowSize.width) / 2.0,
									 y: rect.origin.y + arrowSize.height))
			path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + arrowSize.height))
			path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height))
			path.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y + rect.size.height))
			path.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y + arrowSize.height))
		} else {
			path.move(to: rect.origin)
			path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y))
			path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width,
									 y: rect.origin.y + rect.size.height - arrowSize.height))
			path.addLine(to: CGPoint(x: rect.origin.x + (rect.size.width + arrowSize.width) / 2.0,
									 y: rect.origin.y + rect.size.height - arrowSize.height))

			path.addLine(to: point)
			path.addLine(to: CGPoint(x: rect.origin.x + (rect.size.width - arrowSize.width) / 2.0,
									 y: rect.origin.y + rect.size.height - arrowSize.height))
			path.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y + rect.size.height - arrowSize.height))
			path.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y))

		}
		path.fill()
		AppColor.Border.setStroke()
		path.lineWidth = 1
		path.stroke()

		if offset.y > 0 {
			rect.origin.y += self.insets.top + arrowSize.height
		} else {
			rect.origin.y += self.insets.top
		}

		rect.size.height -= self.insets.top + self.insets.bottom

		UIGraphicsPushContext(context)
		label.draw(in: rect, withAttributes: _drawAttributes)
		UIGraphicsPopContext()

		context.restoreGState()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	open override func refreshContent(entry: ChartDataEntry, highlight: Highlight) {

		setLabel(String(entry.y))
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	open func setLabel(_ newLabel: String) {

		label = "$ " + newLabel

		_drawAttributes.removeAll()
		_drawAttributes[.font] = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
		_drawAttributes[.paragraphStyle] = _paragraphStyle
		_drawAttributes[.foregroundColor] = UIColor.label

		_labelSize = label?.size(withAttributes: _drawAttributes) ?? CGSize.zero

		var size = CGSize()
		size.width = _labelSize.width + self.insets.left + self.insets.right
		size.height = _labelSize.height + self.insets.top + self.insets.bottom
		size.width = max(minimumSize.width, size.width)
		size.height = max(minimumSize.height, size.height)
		self.size = size
	}
}
