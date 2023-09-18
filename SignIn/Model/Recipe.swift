/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 3
  Author: Nguyen Vi Phi Long
  ID: s3904632
  Created  date: 06/09/2023
  Last modified: 11/09/2023)
  Acknowledgement:
*/

import Foundation

struct Recipe: Identifiable, Codable{
    var id: String = UUID().uuidString
    var name: String?
    var image: String?
    var makingTime: Int?
    var category: String?
    var description: String?
    var ingredients: [String]
    var instructions: [String]
    var review: [String]
    var userDocumentID: String
    var documentID: String?
    
    func getUserName(users: [User]) -> String {
        if let user = users.first(where: { $0.documentID == self.userDocumentID }) {
            let firstName = user.firstName ?? ""
            let lastName = user.lastName ?? ""
            return firstName + " " + lastName
        }
        return "User not found"
    }

}

extension String {
    func generateStringSequence() -> [String] {
        //MARK: E.g) "Shrimp burger" yields "S", "Sh", "Shr", "Shrim", etc.
        
        //Split the name by space
        var temp = self
        var nameArr = temp.components(separatedBy: " ")
        var sequences: [String] = []
        for i in 0..<nameArr.count {
            if let range = temp.range(of: nameArr[i]) {
                var startingIndex = temp.distance(from: temp.startIndex, to: range.lowerBound)
                for _ in 0..<startingIndex {
                    var index = temp.index(temp.startIndex, offsetBy: 0)
                    temp.remove(at: index)
                }
                for j in 1...temp.count {
                    sequences.append(String(temp.prefix(j)))
                }
            }
        }
        return sequences
    }
}

