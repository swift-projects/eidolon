import Foundation

class GenericError: JSONAble {
    let detail: [String:AnyObject]
    let message: String
    let type: String
    
    init(type: String, message: String, detail: [String:AnyObject]) {
        self.detail = detail
        self.message = message
        self.type = type
    }
    
    override class func fromJSON(json:[String: AnyObject]) -> JSONAble {
        let json = JSON(object: json)
        
        let type = json["type"].stringValue
        let message = json["message"].stringValue
        let detailDictionary = json["detail"].object as [String: AnyObject]

        return GenericError(type: type, message: message, detail: detailDictionary)
    }
}
