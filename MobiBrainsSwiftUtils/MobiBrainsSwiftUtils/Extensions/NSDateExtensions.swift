
import UIKit

extension Date {

	// Convert timeinterval to date string from format

	static func convertTimeInterval(_ interval: Double, toFormat: String) -> String {

		let date = Date(timeIntervalSince1970: interval / 1000)
		return date.toString(format: toFormat)
	}

	static func convertTimeIntervalToHoursMinsSecs(_ interval: Double) -> String {

		let currentdate = Date()
		let date = Date(timeInterval: interval / 1000, since: currentdate)
		let calendar = Calendar.current
		let components = (calendar as NSCalendar).components([.hour, .minute, .second], from: currentdate, to: date, options: [])
		var dateString = ""
		if components.hour! > 0 {
			dateString = dateString + String(format: "%d hours ", components.hour!)
		}
		if components.minute! > 0 {
			dateString = dateString + String(format: "%d min ", components.minute!)
		}
		if components.second! > 0 {
			dateString = dateString + String(format: "%d sec", components.second!)
		}
		return dateString
	}

	// Initializes NSDate from string and format
//	public init?(fromString string: String, format: String) {
//		let formatter = DateFormatter()
//		formatter.dateFormat = format
//		if let date = formatter.date(from: string) {
//			(self as NSDate).init(timeInterval: 0, since: date)
//		} else {
//			return nil
//		}
//	}

    public func toDate(fromString string: String, format: String) -> NSDate? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let date = formatter.date(from: string) {
            return NSDate.init(timeInterval: 0, since: date)
        }
        return nil
    }

	// Converts NSDate to String
	public func toString(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
		let formatter = DateFormatter()
		formatter.dateStyle = dateStyle
		formatter.timeStyle = timeStyle
		return formatter.string(from: self)
	}

	// Converts NSDate to String, with format
	public func toString(format: String) -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = format
		return formatter.string(from: self)
	}

	// Calculates how many days passed from now to date
	public func daysInBetweenDate(_ date: Date) -> Double {
		var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
		diff = fabs(diff / 86400)
		return diff
	}

	// Calculates how many hours passed from now to date
	public func hoursInBetweenDate(_ date: Date) -> Double {
		var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
		diff = fabs(diff / 3600)
		return diff
	}

	// Calculates how many minutes passed from now to date
	public func minutesInBetweenDate(_ date: Date) -> Double {
		var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
		diff = fabs(diff / 60)
		return diff
	}

	// Calculates how many seconds passed from now to date
	public func secondsInBetweenDate(_ date: Date) -> Double {
		var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
		diff = fabs(diff)
		return diff
	}

	// Easy creation of time passed String. Can be Years, Months, days, hours, minutes or seconds
	public func timePassed() -> String {

		let date = Date()
		let calendar = Calendar.current
		let components = (calendar as NSCalendar).components([.year, .month, .day, .hour, .minute, .second], from: self, to: date, options: [])
		var str: String

		if components.year! >= 1 {
			components.year == 1 ? (str = "year") : (str = "years")
			return "\(components.year) \(str) ago"
		} else if components.month! >= 1 {
			components.month == 1 ? (str = "month") : (str = "months")
			return "\(components.month) \(str) ago"
		} else if components.day! >= 1 {
			components.day == 1 ? (str = "day") : (str = "days")
			return "\(components.day) \(str) ago"
		} else if components.hour! >= 1 {
			components.hour == 1 ? (str = "hour") : (str = "hours")
			return "\(components.hour) \(str) ago"
		} else if components.minute! >= 1 {
			components.minute == 1 ? (str = "minute") : (str = "minutes")
			return "\(components.minute) \(str) ago"
		} else if components.second == 0 {
			return "Just now"
		} else {
			return "\(components.second) seconds ago"
		}
	}

}

//extension Date: Comparable { }
//// Returns if dates are equal to each other
//public func == (lhs: Date, rhs: Date) -> Bool {
//	return (lhs == rhs)
//}
//// Returns if one date is smaller than the other
//public func < (lhs: Date, rhs: Date) -> Bool {
//	return lhs.compare(rhs) == .orderedAscending
//}
//
//public func > (lhs: Date, rhs: Date) -> Bool {
//	return lhs.compare(rhs) == .orderedDescending
//}
