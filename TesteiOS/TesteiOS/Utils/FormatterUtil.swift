import Foundation

class FormatterUtil {
  
  class func formatterFloat(value: Double) -> String {
    
   let formattedValue = String(format: "%.2f", value)
   let percentageValue = "\(formattedValue) %"

   return percentageValue
  }
  
}
