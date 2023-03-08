

import Foundation

/// DateFormatter
 let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "dd/M/yyyy, H:mm"
    
    return dateFormatter
}()
