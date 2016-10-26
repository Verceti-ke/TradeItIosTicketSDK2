class DateTimeFormatter: NSObject {
    fileprivate static let formatter = DateFormatter()

    static func time(_ datetime: Date = Date()) -> String {
        formatter.dateFormat = "hh:mma zzz"
        return formatter.string(from: datetime)
    }
}
