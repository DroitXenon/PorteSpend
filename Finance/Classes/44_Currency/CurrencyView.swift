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
class CurrencyView: UIViewController {

	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var currency: [[String: String]] = []
	private var indexPaths: Set<IndexPath> = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		tableView.register(UINib(nibName: "CurrencyCell", bundle: Bundle.main), forCellReuseIdentifier: "CurrencyCell")
		loadData()
		layoutConstraintTableViewHeight.constant = CGFloat(45 * currency.count)
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		currency.removeAll()

		var dict1: [String: String] = [:]
		dict1["currency_name"] = "Afghan afghani"
		dict1["currency"] = "AFN"
		currency.append(dict1)

		var dict2: [String: String] = [:]
		dict2["currency_name"] = "European euro"
		dict2["currency"] = "EUR"
		currency.append(dict2)

		var dict3: [String: String] = [:]
		dict3["currency_name"] = "European euro"
		dict3["currency"] = "EUR"
		currency.append(dict3)

		var dict4: [String: String] = [:]
		dict4["currency_name"] = "Albanian lek"
		dict4["currency"] = "ALL"
		currency.append(dict4)

		var dict5: [String: String] = [:]
		dict5["currency_name"] = "Algerian dinar"
		dict5["currency"] = "DZD"
		currency.append(dict5)

		var dict6: [String: String] = [:]
		dict6["currency_name"] = "United States dollar"
		dict6["currency"] = "USD"
		currency.append(dict6)

		var dict7: [String: String] = [:]
		dict7["currency_name"] = "European euro"
		dict7["currency"] = "EUR"
		currency.append(dict7)

		var dict8: [String: String] = [:]
		dict8["currency_name"] = "Angolan kwanza"
		dict8["currency"] = "AOA"
		currency.append(dict8)

		var dict9: [String: String] = [:]
		dict9["currency_name"] = "East Caribbean dollar"
		dict9["currency"] = "XCD"
		currency.append(dict9)

		var dict10: [String: String] = [:]
		dict10["currency_name"] = "East Caribbean dollar"
		dict10["currency"] = "XCD"
		currency.append(dict10)

		var dict11: [String: String] = [:]
		dict11["currency_name"] = "Argentine peso"
		dict11["currency"] = "ARS"
		currency.append(dict11)

		var dict12: [String: String] = [:]
		dict12["currency_name"] = "Armenian dram"
		dict12["currency"] = "AMD"
		currency.append(dict12)

		var dict13: [String: String] = [:]
		dict13["currency_name"] = "Aruban florin"
		dict13["currency"] = "AWG"
		currency.append(dict13)

		var dict14: [String: String] = [:]
		dict14["currency_name"] = "Saint Helena pound"
		dict14["currency"] = "SHP"
		currency.append(dict14)

		var dict15: [String: String] = [:]
		dict15["currency_name"] = "Australian dollar"
		dict15["currency"] = "AUD"
		currency.append(dict15)

		var dict16: [String: String] = [:]
		dict16["currency_name"] = "European euro"
		dict16["currency"] = "EUR"
		currency.append(dict16)

		var dict17: [String: String] = [:]
		dict17["currency_name"] = "Azerbaijan manat"
		dict17["currency"] = "AZN"
		currency.append(dict17)

		var dict18: [String: String] = [:]
		dict18["currency_name"] = "Bahamian dollar"
		dict18["currency"] = "BSD"
		currency.append(dict18)

		var dict19: [String: String] = [:]
		dict19["currency_name"] = "Bahraini dinar"
		dict19["currency"] = "BHD"
		currency.append(dict19)

		var dict20: [String: String] = [:]
		dict20["currency_name"] = "Bangladeshi taka"
		dict20["currency"] = "BDT"
		currency.append(dict20)

		var dict21: [String: String] = [:]
		dict21["currency_name"] = "Barbadian dollar"
		dict21["currency"] = "BBD"
		currency.append(dict21)

		var dict22: [String: String] = [:]
		dict22["currency_name"] = "Belarusian ruble"
		dict22["currency"] = "BYN"
		currency.append(dict22)

		var dict23: [String: String] = [:]
		dict23["currency_name"] = "European euro"
		dict23["currency"] = "EUR"
		currency.append(dict23)

		var dict24: [String: String] = [:]
		dict24["currency_name"] = "Belize dollar"
		dict24["currency"] = "BZD"
		currency.append(dict24)

		var dict25: [String: String] = [:]
		dict25["currency_name"] = "West African CFA franc"
		dict25["currency"] = "XOF"
		currency.append(dict25)

		var dict26: [String: String] = [:]
		dict26["currency_name"] = "Bermudian dollar"
		dict26["currency"] = "BMD"
		currency.append(dict26)

		var dict27: [String: String] = [:]
		dict27["currency_name"] = "Bhutanese ngultrum"
		dict27["currency"] = "BTN"
		currency.append(dict27)

		var dict28: [String: String] = [:]
		dict28["currency_name"] = "Bolivian boliviano"
		dict28["currency"] = "BOB"
		currency.append(dict28)

		var dict29: [String: String] = [:]
		dict29["currency_name"] = "United States dollar"
		dict29["currency"] = "USD"
		currency.append(dict29)

		var dict30: [String: String] = [:]
		dict30["currency_name"] = "Bosnia and Herzegovina convertible mark"
		dict30["currency"] = "BAM"
		currency.append(dict30)

		var dict31: [String: String] = [:]
		dict31["currency_name"] = "Botswana pula"
		dict31["currency"] = "BWP"
		currency.append(dict31)

		var dict32: [String: String] = [:]
		dict32["currency_name"] = "Brazilian real"
		dict32["currency"] = "BRL"
		currency.append(dict32)

		var dict33: [String: String] = [:]
		dict33["currency_name"] = "United States dollar"
		dict33["currency"] = "USD"
		currency.append(dict33)

		var dict34: [String: String] = [:]
		dict34["currency_name"] = "United States dollar"
		dict34["currency"] = "USD"
		currency.append(dict34)

		var dict35: [String: String] = [:]
		dict35["currency_name"] = "Brunei dollar"
		dict35["currency"] = "BND"
		currency.append(dict35)

		var dict36: [String: String] = [:]
		dict36["currency_name"] = "Bulgarian lev"
		dict36["currency"] = "BGN"
		currency.append(dict36)

		var dict37: [String: String] = [:]
		dict37["currency_name"] = "West African CFA franc"
		dict37["currency"] = "XOF"
		currency.append(dict37)

		var dict38: [String: String] = [:]
		dict38["currency_name"] = "Burundi franc"
		dict38["currency"] = "BIF"
		currency.append(dict38)

		var dict39: [String: String] = [:]
		dict39["currency_name"] = "Cape Verdean escudo"
		dict39["currency"] = "CVE"
		currency.append(dict39)

		var dict40: [String: String] = [:]
		dict40["currency_name"] = "Cambodian riel"
		dict40["currency"] = "KHR"
		currency.append(dict40)

		var dict41: [String: String] = [:]
		dict41["currency_name"] = "Central African CFA franc"
		dict41["currency"] = "XAF"
		currency.append(dict41)

		var dict42: [String: String] = [:]
		dict42["currency_name"] = "Canadian dollar"
		dict42["currency"] = "CAD"
		currency.append(dict42)

		var dict43: [String: String] = [:]
		dict43["currency_name"] = "United States dollar"
		dict43["currency"] = "USD"
		currency.append(dict43)

		var dict44: [String: String] = [:]
		dict44["currency_name"] = "Cayman Islands dollar"
		dict44["currency"] = "KYD"
		currency.append(dict44)

		var dict45: [String: String] = [:]
		dict45["currency_name"] = "Central African CFA franc"
		dict45["currency"] = "XAF"
		currency.append(dict45)

		var dict46: [String: String] = [:]
		dict46["currency_name"] = "Central African CFA franc"
		dict46["currency"] = "XAF"
		currency.append(dict46)

		var dict47: [String: String] = [:]
		dict47["currency_name"] = "New Zealand dollar"
		dict47["currency"] = "NZD"
		currency.append(dict47)

		var dict48: [String: String] = [:]
		dict48["currency_name"] = "Chilean peso"
		dict48["currency"] = "CLP"
		currency.append(dict48)

		var dict49: [String: String] = [:]
		dict49["currency_name"] = "Chinese Yuan Renminbi"
		dict49["currency"] = "CNY"
		currency.append(dict49)

		var dict50: [String: String] = [:]
		dict50["currency_name"] = "Australian dollar"
		dict50["currency"] = "AUD"
		currency.append(dict50)

		var dict51: [String: String] = [:]
		dict51["currency_name"] = "Australian dollar"
		dict51["currency"] = "AUD"
		currency.append(dict51)

		var dict52: [String: String] = [:]
		dict52["currency_name"] = "Colombian peso"
		dict52["currency"] = "COP"
		currency.append(dict52)

		var dict53: [String: String] = [:]
		dict53["currency_name"] = "Comorian franc"
		dict53["currency"] = "KMF"
		currency.append(dict53)

		var dict54: [String: String] = [:]
		dict54["currency_name"] = "Congolese franc"
		dict54["currency"] = "CDF"
		currency.append(dict54)

		var dict55: [String: String] = [:]
		dict55["currency_name"] = "Central African CFA franc"
		dict55["currency"] = "XAF"
		currency.append(dict55)

		var dict56: [String: String] = [:]
		dict56["currency_name"] = "Cook Islands dollar"
		dict56["currency"] = "none"
		currency.append(dict56)

		var dict57: [String: String] = [:]
		dict57["currency_name"] = "Costa Rican colon"
		dict57["currency"] = "CRC"
		currency.append(dict57)

		var dict58: [String: String] = [:]
		dict58["currency_name"] = "West African CFA franc"
		dict58["currency"] = "XOF"
		currency.append(dict58)

		var dict59: [String: String] = [:]
		dict59["currency_name"] = "Croatian kuna"
		dict59["currency"] = "HRK"
		currency.append(dict59)

		var dict60: [String: String] = [:]
		dict60["currency_name"] = "Cuban peso"
		dict60["currency"] = "CUP"
		currency.append(dict60)

		var dict61: [String: String] = [:]
		dict61["currency_name"] = "Netherlands Antillean guilder"
		dict61["currency"] = "ANG"
		currency.append(dict61)

		var dict62: [String: String] = [:]
		dict62["currency_name"] = "European euro"
		dict62["currency"] = "EUR"
		currency.append(dict62)

		var dict63: [String: String] = [:]
		dict63["currency_name"] = "Czech koruna"
		dict63["currency"] = "CZK"
		currency.append(dict63)

		var dict64: [String: String] = [:]
		dict64["currency_name"] = "Danish krone"
		dict64["currency"] = "DKK"
		currency.append(dict64)

		var dict65: [String: String] = [:]
		dict65["currency_name"] = "Djiboutian franc"
		dict65["currency"] = "DJF"
		currency.append(dict65)

		var dict66: [String: String] = [:]
		dict66["currency_name"] = "East Caribbean dollar"
		dict66["currency"] = "XCD"
		currency.append(dict66)

		var dict67: [String: String] = [:]
		dict67["currency_name"] = "Dominican peso"
		dict67["currency"] = "DOP"
		currency.append(dict67)

		var dict68: [String: String] = [:]
		dict68["currency_name"] = "United States dollar"
		dict68["currency"] = "USD"
		currency.append(dict68)

		var dict69: [String: String] = [:]
		dict69["currency_name"] = "Egyptian pound"
		dict69["currency"] = "EGP"
		currency.append(dict69)

		var dict70: [String: String] = [:]
		dict70["currency_name"] = "United States dollar"
		dict70["currency"] = "USD"
		currency.append(dict70)

		var dict71: [String: String] = [:]
		dict71["currency_name"] = "Central African CFA franc"
		dict71["currency"] = "XAF"
		currency.append(dict71)

		var dict72: [String: String] = [:]
		dict72["currency_name"] = "Eritrean nakfa"
		dict72["currency"] = "ERN"
		currency.append(dict72)

		var dict73: [String: String] = [:]
		dict73["currency_name"] = "European euro"
		dict73["currency"] = "EUR"
		currency.append(dict73)

		var dict74: [String: String] = [:]
		dict74["currency_name"] = "Swazi lilangeni"
		dict74["currency"] = "SZL"
		currency.append(dict74)

		var dict75: [String: String] = [:]
		dict75["currency_name"] = "Ethiopian birr"
		dict75["currency"] = "ETB"
		currency.append(dict75)

		var dict76: [String: String] = [:]
		dict76["currency_name"] = "Falkland Islands pound"
		dict76["currency"] = "FKP"
		currency.append(dict76)

		var dict77: [String: String] = [:]
		dict77["currency_name"] = "Faroese krona"
		dict77["currency"] = "none"
		currency.append(dict77)

		var dict78: [String: String] = [:]
		dict78["currency_name"] = "Fijian dollar"
		dict78["currency"] = "FJD"
		currency.append(dict78)

		var dict79: [String: String] = [:]
		dict79["currency_name"] = "European euro"
		dict79["currency"] = "EUR"
		currency.append(dict79)

		var dict80: [String: String] = [:]
		dict80["currency_name"] = "European euro"
		dict80["currency"] = "EUR"
		currency.append(dict80)

		var dict81: [String: String] = [:]
		dict81["currency_name"] = "European euro"
		dict81["currency"] = "EUR"
		currency.append(dict81)

		var dict82: [String: String] = [:]
		dict82["currency_name"] = "CFP franc"
		dict82["currency"] = "XPF"
		currency.append(dict82)

		var dict83: [String: String] = [:]
		dict83["currency_name"] = "Central African CFA franc"
		dict83["currency"] = "XAF"
		currency.append(dict83)

		var dict84: [String: String] = [:]
		dict84["currency_name"] = "Gambian dalasi"
		dict84["currency"] = "GMD"
		currency.append(dict84)

		var dict85: [String: String] = [:]
		dict85["currency_name"] = "Georgian lari"
		dict85["currency"] = "GEL"
		currency.append(dict85)

		var dict86: [String: String] = [:]
		dict86["currency_name"] = "European euro"
		dict86["currency"] = "EUR"
		currency.append(dict86)

		var dict87: [String: String] = [:]
		dict87["currency_name"] = "Ghanaian cedi"
		dict87["currency"] = "GHS"
		currency.append(dict87)

		var dict88: [String: String] = [:]
		dict88["currency_name"] = "Gibraltar pound"
		dict88["currency"] = "GIP"
		currency.append(dict88)

		var dict89: [String: String] = [:]
		dict89["currency_name"] = "European euro"
		dict89["currency"] = "EUR"
		currency.append(dict89)

		var dict90: [String: String] = [:]
		dict90["currency_name"] = "Danish krone"
		dict90["currency"] = "DKK"
		currency.append(dict90)

		var dict91: [String: String] = [:]
		dict91["currency_name"] = "East Caribbean dollar"
		dict91["currency"] = "XCD"
		currency.append(dict91)

		var dict92: [String: String] = [:]
		dict92["currency_name"] = "European euro"
		dict92["currency"] = "EUR"
		currency.append(dict92)

		var dict93: [String: String] = [:]
		dict93["currency_name"] = "United States dollar"
		dict93["currency"] = "USD"
		currency.append(dict93)

		var dict94: [String: String] = [:]
		dict94["currency_name"] = "Guatemalan quetzal"
		dict94["currency"] = "GTQ"
		currency.append(dict94)

		var dict95: [String: String] = [:]
		dict95["currency_name"] = "Guernsey Pound"
		dict95["currency"] = "GGP"
		currency.append(dict95)

		var dict96: [String: String] = [:]
		dict96["currency_name"] = "Guinean franc"
		dict96["currency"] = "GNF"
		currency.append(dict96)

		var dict97: [String: String] = [:]
		dict97["currency_name"] = "West African CFA franc"
		dict97["currency"] = "XOF"
		currency.append(dict97)

		var dict98: [String: String] = [:]
		dict98["currency_name"] = "Guyanese dollar"
		dict98["currency"] = "GYD"
		currency.append(dict98)

		var dict99: [String: String] = [:]
		dict99["currency_name"] = "Haitian gourde"
		dict99["currency"] = "HTG"
		currency.append(dict99)

		var dict100: [String: String] = [:]
		dict100["currency_name"] = "Honduran lempira"
		dict100["currency"] = "HNL"
		currency.append(dict100)

		var dict101: [String: String] = [:]
		dict101["currency_name"] = "Hong Kong dollar"
		dict101["currency"] = "HKD"
		currency.append(dict101)

		var dict102: [String: String] = [:]
		dict102["currency_name"] = "Hungarian forint"
		dict102["currency"] = "HUF"
		currency.append(dict102)

		var dict103: [String: String] = [:]
		dict103["currency_name"] = "Icelandic krona"
		dict103["currency"] = "ISK"
		currency.append(dict103)

		var dict104: [String: String] = [:]
		dict104["currency_name"] = "Indian rupee"
		dict104["currency"] = "INR"
		currency.append(dict104)

		var dict105: [String: String] = [:]
		dict105["currency_name"] = "Indonesian rupiah"
		dict105["currency"] = "IDR"
		currency.append(dict105)

		var dict106: [String: String] = [:]
		dict106["currency_name"] = "SDR (Special Drawing Right)"
		dict106["currency"] = "XDR"
		currency.append(dict106)

		var dict107: [String: String] = [:]
		dict107["currency_name"] = "Iranian rial"
		dict107["currency"] = "IRR"
		currency.append(dict107)

		var dict108: [String: String] = [:]
		dict108["currency_name"] = "Iraqi dinar"
		dict108["currency"] = "IQD"
		currency.append(dict108)

		var dict109: [String: String] = [:]
		dict109["currency_name"] = "European euro"
		dict109["currency"] = "EUR"
		currency.append(dict109)

		var dict110: [String: String] = [:]
		dict110["currency_name"] = "Manx pound"
		dict110["currency"] = "IMP"
		currency.append(dict110)

		var dict111: [String: String] = [:]
		dict111["currency_name"] = "Israeli new shekel"
		dict111["currency"] = "ILS"
		currency.append(dict111)

		var dict112: [String: String] = [:]
		dict112["currency_name"] = "European euro"
		dict112["currency"] = "EUR"
		currency.append(dict112)

		var dict113: [String: String] = [:]
		dict113["currency_name"] = "Jamaican dollar"
		dict113["currency"] = "JMD"
		currency.append(dict113)

		var dict114: [String: String] = [:]
		dict114["currency_name"] = "Japanese yen"
		dict114["currency"] = "JPY"
		currency.append(dict114)

		var dict115: [String: String] = [:]
		dict115["currency_name"] = "Jersey pound"
		dict115["currency"] = "JEP"
		currency.append(dict115)

		var dict116: [String: String] = [:]
		dict116["currency_name"] = "Jordanian dinar"
		dict116["currency"] = "JOD"
		currency.append(dict116)

		var dict117: [String: String] = [:]
		dict117["currency_name"] = "Kazakhstani tenge"
		dict117["currency"] = "KZT"
		currency.append(dict117)

		var dict118: [String: String] = [:]
		dict118["currency_name"] = "Kenyan shilling"
		dict118["currency"] = "KES"
		currency.append(dict118)

		var dict119: [String: String] = [:]
		dict119["currency_name"] = "Australian dollar"
		dict119["currency"] = "AUD"
		currency.append(dict119)

		var dict120: [String: String] = [:]
		dict120["currency_name"] = "European euro"
		dict120["currency"] = "EUR"
		currency.append(dict120)

		var dict121: [String: String] = [:]
		dict121["currency_name"] = "Kuwaiti dinar"
		dict121["currency"] = "KWD"
		currency.append(dict121)

		var dict122: [String: String] = [:]
		dict122["currency_name"] = "Kyrgyzstani som"
		dict122["currency"] = "KGS"
		currency.append(dict122)

		var dict123: [String: String] = [:]
		dict123["currency_name"] = "Lao kip"
		dict123["currency"] = "LAK"
		currency.append(dict123)

		var dict124: [String: String] = [:]
		dict124["currency_name"] = "European euro"
		dict124["currency"] = "EUR"
		currency.append(dict124)

		var dict125: [String: String] = [:]
		dict125["currency_name"] = "Lebanese pound"
		dict125["currency"] = "LBP"
		currency.append(dict125)

		var dict126: [String: String] = [:]
		dict126["currency_name"] = "Lesotho loti"
		dict126["currency"] = "LSL"
		currency.append(dict126)

		var dict127: [String: String] = [:]
		dict127["currency_name"] = "Liberian dollar"
		dict127["currency"] = "LRD"
		currency.append(dict127)

		var dict128: [String: String] = [:]
		dict128["currency_name"] = "Libyan dinar"
		dict128["currency"] = "LYD"
		currency.append(dict128)

		var dict129: [String: String] = [:]
		dict129["currency_name"] = "Swiss franc"
		dict129["currency"] = "CHF"
		currency.append(dict129)

		var dict130: [String: String] = [:]
		dict130["currency_name"] = "European euro"
		dict130["currency"] = "EUR"
		currency.append(dict130)

		var dict131: [String: String] = [:]
		dict131["currency_name"] = "European euro"
		dict131["currency"] = "EUR"
		currency.append(dict131)

		var dict132: [String: String] = [:]
		dict132["currency_name"] = "Macanese pataca"
		dict132["currency"] = "MOP"
		currency.append(dict132)

		var dict133: [String: String] = [:]
		dict133["currency_name"] = "Malagasy ariary"
		dict133["currency"] = "MGA"
		currency.append(dict133)

		var dict134: [String: String] = [:]
		dict134["currency_name"] = "Malawian kwacha"
		dict134["currency"] = "MWK"
		currency.append(dict134)

		var dict135: [String: String] = [:]
		dict135["currency_name"] = "Malaysian ringgit"
		dict135["currency"] = "MYR"
		currency.append(dict135)

		var dict136: [String: String] = [:]
		dict136["currency_name"] = "Maldivian rufiyaa"
		dict136["currency"] = "MVR"
		currency.append(dict136)

		var dict137: [String: String] = [:]
		dict137["currency_name"] = "West African CFA franc"
		dict137["currency"] = "XOF"
		currency.append(dict137)

		var dict138: [String: String] = [:]
		dict138["currency_name"] = "European euro"
		dict138["currency"] = "EUR"
		currency.append(dict138)

		var dict139: [String: String] = [:]
		dict139["currency_name"] = "United States dollar"
		dict139["currency"] = "USD"
		currency.append(dict139)

		var dict140: [String: String] = [:]
		dict140["currency_name"] = "European euro"
		dict140["currency"] = "EUR"
		currency.append(dict140)

		var dict141: [String: String] = [:]
		dict141["currency_name"] = "Mauritanian ouguiya"
		dict141["currency"] = "MRU"
		currency.append(dict141)

		var dict142: [String: String] = [:]
		dict142["currency_name"] = "Mauritian rupee"
		dict142["currency"] = "MUR"
		currency.append(dict142)

		var dict143: [String: String] = [:]
		dict143["currency_name"] = "European euro"
		dict143["currency"] = "EUR"
		currency.append(dict143)

		var dict144: [String: String] = [:]
		dict144["currency_name"] = "Mexican peso"
		dict144["currency"] = "MXN"
		currency.append(dict144)

		var dict145: [String: String] = [:]
		dict145["currency_name"] = "United States dollar"
		dict145["currency"] = "USD"
		currency.append(dict145)

		var dict146: [String: String] = [:]
		dict146["currency_name"] = "Moldovan leu"
		dict146["currency"] = "MDL"
		currency.append(dict146)

		var dict147: [String: String] = [:]
		dict147["currency_name"] = "European euro"
		dict147["currency"] = "EUR"
		currency.append(dict147)

		var dict148: [String: String] = [:]
		dict148["currency_name"] = "Mongolian tugrik"
		dict148["currency"] = "MNT"
		currency.append(dict148)

		var dict149: [String: String] = [:]
		dict149["currency_name"] = "European euro"
		dict149["currency"] = "EUR"
		currency.append(dict149)

		var dict150: [String: String] = [:]
		dict150["currency_name"] = "East Caribbean dollar"
		dict150["currency"] = "XCD"
		currency.append(dict150)

		var dict151: [String: String] = [:]
		dict151["currency_name"] = "Moroccan dirham"
		dict151["currency"] = "MAD"
		currency.append(dict151)

		var dict152: [String: String] = [:]
		dict152["currency_name"] = "Mozambican metical"
		dict152["currency"] = "MZN"
		currency.append(dict152)

		var dict153: [String: String] = [:]
		dict153["currency_name"] = "Myanmar kyat"
		dict153["currency"] = "MMK"
		currency.append(dict153)

		var dict154: [String: String] = [:]
		dict154["currency_name"] = "Namibian dollar"
		dict154["currency"] = "NAD"
		currency.append(dict154)

		var dict155: [String: String] = [:]
		dict155["currency_name"] = "Australian dollar"
		dict155["currency"] = "AUD"
		currency.append(dict155)

		var dict156: [String: String] = [:]
		dict156["currency_name"] = "Nepalese rupee"
		dict156["currency"] = "NPR"
		currency.append(dict156)

		var dict157: [String: String] = [:]
		dict157["currency_name"] = "European euro"
		dict157["currency"] = "EUR"
		currency.append(dict157)

		var dict158: [String: String] = [:]
		dict158["currency_name"] = "CFP franc"
		dict158["currency"] = "XPF"
		currency.append(dict158)

		var dict159: [String: String] = [:]
		dict159["currency_name"] = "New Zealand dollar"
		dict159["currency"] = "NZD"
		currency.append(dict159)

		var dict160: [String: String] = [:]
		dict160["currency_name"] = "Nicaraguan cordoba"
		dict160["currency"] = "NIO"
		currency.append(dict160)

		var dict161: [String: String] = [:]
		dict161["currency_name"] = "West African CFA franc"
		dict161["currency"] = "XOF"
		currency.append(dict161)

		var dict162: [String: String] = [:]
		dict162["currency_name"] = "Nigerian naira"
		dict162["currency"] = "NGN"
		currency.append(dict162)

		var dict163: [String: String] = [:]
		dict163["currency_name"] = "New Zealand dollar"
		dict163["currency"] = "NZD"
		currency.append(dict163)

		var dict164: [String: String] = [:]
		dict164["currency_name"] = "Australian dollar"
		dict164["currency"] = "AUD"
		currency.append(dict164)

		var dict165: [String: String] = [:]
		dict165["currency_name"] = "United States dollar"
		dict165["currency"] = "USD"
		currency.append(dict165)

		var dict166: [String: String] = [:]
		dict166["currency_name"] = "North Korean won"
		dict166["currency"] = "KPW"
		currency.append(dict166)

		var dict167: [String: String] = [:]
		dict167["currency_name"] = "Macedonian denar"
		dict167["currency"] = "MKD"
		currency.append(dict167)

		var dict168: [String: String] = [:]
		dict168["currency_name"] = "Norwegian krone"
		dict168["currency"] = "NOK"
		currency.append(dict168)

		var dict169: [String: String] = [:]
		dict169["currency_name"] = "Omani rial"
		dict169["currency"] = "OMR"
		currency.append(dict169)

		var dict170: [String: String] = [:]
		dict170["currency_name"] = "Pakistani rupee"
		dict170["currency"] = "PKR"
		currency.append(dict170)

		var dict171: [String: String] = [:]
		dict171["currency_name"] = "United States dollar"
		dict171["currency"] = "USD"
		currency.append(dict171)

		var dict172: [String: String] = [:]
		dict172["currency_name"] = "Israeli new shekel"
		dict172["currency"] = "ILS"
		currency.append(dict172)

		var dict173: [String: String] = [:]
		dict173["currency_name"] = "United States dollar"
		dict173["currency"] = "USD"
		currency.append(dict173)

		var dict174: [String: String] = [:]
		dict174["currency_name"] = "Papua New Guinean kina"
		dict174["currency"] = "PGK"
		currency.append(dict174)

		var dict175: [String: String] = [:]
		dict175["currency_name"] = "Paraguayan guarani"
		dict175["currency"] = "PYG"
		currency.append(dict175)

		var dict176: [String: String] = [:]
		dict176["currency_name"] = "Peruvian sol"
		dict176["currency"] = "PEN"
		currency.append(dict176)

		var dict177: [String: String] = [:]
		dict177["currency_name"] = "Philippine peso"
		dict177["currency"] = "PHP"
		currency.append(dict177)

		var dict178: [String: String] = [:]
		dict178["currency_name"] = "New Zealand dollar"
		dict178["currency"] = "NZD"
		currency.append(dict178)

		var dict179: [String: String] = [:]
		dict179["currency_name"] = "Polish zloty"
		dict179["currency"] = "PLN"
		currency.append(dict179)

		var dict180: [String: String] = [:]
		dict180["currency_name"] = "European euro"
		dict180["currency"] = "EUR"
		currency.append(dict180)

		var dict181: [String: String] = [:]
		dict181["currency_name"] = "United States dollar"
		dict181["currency"] = "USD"
		currency.append(dict181)

		var dict182: [String: String] = [:]
		dict182["currency_name"] = "Qatari riyal"
		dict182["currency"] = "QAR"
		currency.append(dict182)

		var dict183: [String: String] = [:]
		dict183["currency_name"] = "European euro"
		dict183["currency"] = "EUR"
		currency.append(dict183)

		var dict184: [String: String] = [:]
		dict184["currency_name"] = "Romanian leu"
		dict184["currency"] = "RON"
		currency.append(dict184)

		var dict185: [String: String] = [:]
		dict185["currency_name"] = "Russian ruble"
		dict185["currency"] = "RUB"
		currency.append(dict185)

		var dict186: [String: String] = [:]
		dict186["currency_name"] = "Rwandan franc"
		dict186["currency"] = "RWF"
		currency.append(dict186)

		var dict187: [String: String] = [:]
		dict187["currency_name"] = "United States dollar"
		dict187["currency"] = "USD"
		currency.append(dict187)

		var dict188: [String: String] = [:]
		dict188["currency_name"] = "European euro"
		dict188["currency"] = "EUR"
		currency.append(dict188)

		var dict189: [String: String] = [:]
		dict189["currency_name"] = "Saint Helena pound"
		dict189["currency"] = "SHP"
		currency.append(dict189)

		var dict190: [String: String] = [:]
		dict190["currency_name"] = "East Caribbean dollar"
		dict190["currency"] = "XCD"
		currency.append(dict190)

		var dict191: [String: String] = [:]
		dict191["currency_name"] = "East Caribbean dollar"
		dict191["currency"] = "XCD"
		currency.append(dict191)

		var dict192: [String: String] = [:]
		dict192["currency_name"] = "European euro"
		dict192["currency"] = "EUR"
		currency.append(dict192)

		var dict193: [String: String] = [:]
		dict193["currency_name"] = "European euro"
		dict193["currency"] = "EUR"
		currency.append(dict193)

		var dict194: [String: String] = [:]
		dict194["currency_name"] = "East Caribbean dollar"
		dict194["currency"] = "XCD"
		currency.append(dict194)

		var dict195: [String: String] = [:]
		dict195["currency_name"] = "Samoan tala"
		dict195["currency"] = "WST"
		currency.append(dict195)

		var dict196: [String: String] = [:]
		dict196["currency_name"] = "European euro"
		dict196["currency"] = "EUR"
		currency.append(dict196)

		var dict197: [String: String] = [:]
		dict197["currency_name"] = "Sao Tome and Principe dobra"
		dict197["currency"] = "STN"
		currency.append(dict197)

		var dict198: [String: String] = [:]
		dict198["currency_name"] = "Saudi Arabian riyal"
		dict198["currency"] = "SAR"
		currency.append(dict198)

		var dict199: [String: String] = [:]
		dict199["currency_name"] = "West African CFA franc"
		dict199["currency"] = "XOF"
		currency.append(dict199)

		var dict200: [String: String] = [:]
		dict200["currency_name"] = "Serbian dinar"
		dict200["currency"] = "RSD"
		currency.append(dict200)

		var dict201: [String: String] = [:]
		dict201["currency_name"] = "Seychellois rupee"
		dict201["currency"] = "SCR"
		currency.append(dict201)

		var dict202: [String: String] = [:]
		dict202["currency_name"] = "Sierra Leonean leone"
		dict202["currency"] = "SLL"
		currency.append(dict202)

		var dict203: [String: String] = [:]
		dict203["currency_name"] = "Singapore dollar"
		dict203["currency"] = "SGD"
		currency.append(dict203)

		var dict204: [String: String] = [:]
		dict204["currency_name"] = "United States dollar"
		dict204["currency"] = "USD"
		currency.append(dict204)

		var dict205: [String: String] = [:]
		dict205["currency_name"] = "Netherlands Antillean guilder"
		dict205["currency"] = "ANG"
		currency.append(dict205)

		var dict206: [String: String] = [:]
		dict206["currency_name"] = "European euro"
		dict206["currency"] = "EUR"
		currency.append(dict206)

		var dict207: [String: String] = [:]
		dict207["currency_name"] = "European euro"
		dict207["currency"] = "EUR"
		currency.append(dict207)

		var dict208: [String: String] = [:]
		dict208["currency_name"] = "Solomon Islands dollar"
		dict208["currency"] = "SBD"
		currency.append(dict208)

		var dict209: [String: String] = [:]
		dict209["currency_name"] = "Somali shilling"
		dict209["currency"] = "SOS"
		currency.append(dict209)

		var dict210: [String: String] = [:]
		dict210["currency_name"] = "South African rand"
		dict210["currency"] = "ZAR"
		currency.append(dict210)

		var dict211: [String: String] = [:]
		dict211["currency_name"] = "Pound sterling"
		dict211["currency"] = "GBP"
		currency.append(dict211)

		var dict212: [String: String] = [:]
		dict212["currency_name"] = "South Korean won"
		dict212["currency"] = "KRW"
		currency.append(dict212)

		var dict213: [String: String] = [:]
		dict213["currency_name"] = "South Sudanese pound"
		dict213["currency"] = "SSP"
		currency.append(dict213)

		var dict214: [String: String] = [:]
		dict214["currency_name"] = "European euro"
		dict214["currency"] = "EUR"
		currency.append(dict214)

		var dict215: [String: String] = [:]
		dict215["currency_name"] = "Sri Lankan rupee"
		dict215["currency"] = "LKR"
		currency.append(dict215)

		var dict216: [String: String] = [:]
		dict216["currency_name"] = "Sudanese pound"
		dict216["currency"] = "SDG"
		currency.append(dict216)

		var dict217: [String: String] = [:]
		dict217["currency_name"] = "Surinamese dollar"
		dict217["currency"] = "SRD"
		currency.append(dict217)

		var dict218: [String: String] = [:]
		dict218["currency_name"] = "Norwegian krone"
		dict218["currency"] = "NOK"
		currency.append(dict218)

		var dict219: [String: String] = [:]
		dict219["currency_name"] = "Swedish krona"
		dict219["currency"] = "SEK"
		currency.append(dict219)

		var dict220: [String: String] = [:]
		dict220["currency_name"] = "Swiss franc"
		dict220["currency"] = "CHF"
		currency.append(dict220)

		var dict221: [String: String] = [:]
		dict221["currency_name"] = "Syrian pound"
		dict221["currency"] = "SYP"
		currency.append(dict221)

		var dict222: [String: String] = [:]
		dict222["currency_name"] = "New Taiwan dollar"
		dict222["currency"] = "TWD"
		currency.append(dict222)

		var dict223: [String: String] = [:]
		dict223["currency_name"] = "Tajikistani somoni"
		dict223["currency"] = "TJS"
		currency.append(dict223)

		var dict224: [String: String] = [:]
		dict224["currency_name"] = "Tanzanian shilling"
		dict224["currency"] = "TZS"
		currency.append(dict224)

		var dict225: [String: String] = [:]
		dict225["currency_name"] = "Thai baht"
		dict225["currency"] = "THB"
		currency.append(dict225)

		var dict226: [String: String] = [:]
		dict226["currency_name"] = "United States dollar"
		dict226["currency"] = "USD"
		currency.append(dict226)

		var dict227: [String: String] = [:]
		dict227["currency_name"] = "West African CFA franc"
		dict227["currency"] = "XOF"
		currency.append(dict227)

		var dict228: [String: String] = [:]
		dict228["currency_name"] = "New Zealand dollar"
		dict228["currency"] = "NZD"
		currency.append(dict228)

		var dict229: [String: String] = [:]
		dict229["currency_name"] = "Tongan pa’anga"
		dict229["currency"] = "TOP"
		currency.append(dict229)

		var dict230: [String: String] = [:]
		dict230["currency_name"] = "Trinidad and Tobago dollar"
		dict230["currency"] = "TTD"
		currency.append(dict230)

		var dict231: [String: String] = [:]
		dict231["currency_name"] = "Pound sterling"
		dict231["currency"] = "GBP"
		currency.append(dict231)

		var dict232: [String: String] = [:]
		dict232["currency_name"] = "Tunisian dinar"
		dict232["currency"] = "TND"
		currency.append(dict232)

		var dict233: [String: String] = [:]
		dict233["currency_name"] = "Turkish lira"
		dict233["currency"] = "TRY"
		currency.append(dict233)

		var dict234: [String: String] = [:]
		dict234["currency_name"] = "Turkmen manat"
		dict234["currency"] = "TMT"
		currency.append(dict234)

		var dict235: [String: String] = [:]
		dict235["currency_name"] = "United States dollar"
		dict235["currency"] = "USD"
		currency.append(dict235)

		var dict236: [String: String] = [:]
		dict236["currency_name"] = "Australian dollar"
		dict236["currency"] = "AUD"
		currency.append(dict236)

		var dict237: [String: String] = [:]
		dict237["currency_name"] = "Ugandan shilling"
		dict237["currency"] = "UGX"
		currency.append(dict237)

		var dict238: [String: String] = [:]
		dict238["currency_name"] = "Ukrainian hryvnia"
		dict238["currency"] = "UAH"
		currency.append(dict238)

		var dict239: [String: String] = [:]
		dict239["currency_name"] = "UAE dirham"
		dict239["currency"] = "AED"
		currency.append(dict239)

		var dict240: [String: String] = [:]
		dict240["currency_name"] = "Pound sterling"
		dict240["currency"] = "GBP"
		currency.append(dict240)

		var dict241: [String: String] = [:]
		dict241["currency_name"] = "United States dollar"
		dict241["currency"] = "USD"
		currency.append(dict241)

		var dict242: [String: String] = [:]
		dict242["currency_name"] = "Uruguayan peso"
		dict242["currency"] = "UYU"
		currency.append(dict242)

		var dict243: [String: String] = [:]
		dict243["currency_name"] = "United States dollar"
		dict243["currency"] = "USD"
		currency.append(dict243)

		var dict244: [String: String] = [:]
		dict244["currency_name"] = "Uzbekistani som"
		dict244["currency"] = "UZS"
		currency.append(dict244)

		var dict245: [String: String] = [:]
		dict245["currency_name"] = "Vanuatu vatu"
		dict245["currency"] = "VUV"
		currency.append(dict245)

		var dict246: [String: String] = [:]
		dict246["currency_name"] = "European euro"
		dict246["currency"] = "EUR"
		currency.append(dict246)

		var dict247: [String: String] = [:]
		dict247["currency_name"] = "Venezuelan bolivar"
		dict247["currency"] = "VES"
		currency.append(dict247)

		var dict248: [String: String] = [:]
		dict248["currency_name"] = "Vietnamese dong"
		dict248["currency"] = "VND"
		currency.append(dict248)

		var dict249: [String: String] = [:]
		dict249["currency_name"] = "United States dollar"
		dict249["currency"] = "USD"
		currency.append(dict249)

		var dict250: [String: String] = [:]
		dict250["currency_name"] = "CFP franc"
		dict250["currency"] = "XPF"
		currency.append(dict250)

		var dict251: [String: String] = [:]
		dict251["currency_name"] = "Yemeni rial"
		dict251["currency"] = "YER"
		currency.append(dict251)

		var dict252: [String: String] = [:]
		dict252["currency_name"] = "Zambian kwacha"
		dict252["currency"] = "ZMW"
		currency.append(dict252)

		var dict253: [String: String] = [:]
		dict253["currency_name"] = "United States dollar"
		dict253["currency"] = "USD"
		currency.append(dict253)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCancel(_ sender: UISegmentedControl) {

		print(#function)
		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionDone(_ sender: UISegmentedControl) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CurrencyView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return currency.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
		cell.bindData(data: currency[indexPath.row])
		cell.setSelected(indexPaths.contains(indexPath))
		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension CurrencyView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print(#function)
		if (indexPaths.contains(indexPath)) {
			indexPaths.remove(indexPath)
		} else {
			indexPaths.insert(indexPath)
		}
		tableView.reloadData()
	}
}
