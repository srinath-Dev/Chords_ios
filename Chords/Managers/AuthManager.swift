//
//  AuthManager.swift
//  Chords
//
//  Created by Srinath Dev on 19/09/21.
//

import Foundation

final class AuthManager {
    
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "271dd0ec97a84c3cac9b8307de5c54cf"       
        static let clientSecret = "04b9f3a1ff8b45129ac1040c1754cb1f"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
    }
    
    private init(){
        
    }
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://www.srinathdev.me"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        
        return URL(string: string)
        
    }
    
    var  isSignedIn:Bool {
        return false
    }
    
    private var accessToken:String? {
        return nil
    }
    
    private var refreshToken:String?{
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken:Bool{
        return false
    }
    
    public func exchangeCodeForToken(code:String, completion: @escaping ((Bool) -> Void )){
        
        //get token
        guard let url = URL(string: Constants.tokenAPIURL)else{
            return
        }
        
        var  components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: "https://www.srinathdev.me")
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else{
            print("Failure to get base64")
            completion(false)
            return
        }
        
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        let task =   URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data,
                  error ==  nil else {
                      completion(false)
                return
            }
          
          do {
              let json = try JSONSerialization.jsonObject(with:data, options: .allowFragments)
              print("SUCCESS: \(json)")
          }catch{
              print(error.localizedDescription)
              completion(false)
          }
            
        }
        task.resume()
    }
    
    public func refreshAccessToken(){
        
    }
    
    public func cacheToken(){
        
    }
}
