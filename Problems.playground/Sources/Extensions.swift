import Foundation

extension Character {
    /*
     let str = "hello world".uppercased()
     let lastChar = str[str.index(before: str.endIndex)]
     lastChar.asciiValue
     
     "D" -> 68
    */
    public var asciiValue: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}

