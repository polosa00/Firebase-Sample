//
//  NetworkManager.swift
//  Firebase-Sample
//
//  Created by Александр Полочанин on 3.06.23.
//
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private func configureFB() -> Firestore {
        var dataBase: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        dataBase = Firestore.firestore()
        return dataBase
    }
    
    
    
    func getPost(collection: String, documentName: String, completion: @escaping(Document?) -> Void) {
        let dataBase = configureFB()
        dataBase.collection(collection).document(documentName).getDocument { document, error in
            guard error == nil else { completion(nil); return }
            let document = Document(
                fieldOne: document?.get("fieldOne") as! String,
                fieldTwo: document?.get("fieldTwo") as! String
            )
            completion(document)
        }
    }
    
    func getImage(pictureName: String, completion: @escaping (UIImage) -> Void) {
        
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathReference = reference.child("pictures")
        
        var image: UIImage = UIImage(named: "default_pic")!
        
        let fileReference = pathReference.child(pictureName + ".jpeg")
        fileReference.getData(maxSize: 1024 * 1024) { data, error in
            guard error == nil else { completion(image); return }
            image = UIImage(data: data!)!
            completion(image)
        }
    }
    
    
    
    private init() {}
}
