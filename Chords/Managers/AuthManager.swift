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
    }
    
    private init(){
        
    }
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://www.srinathdev.me"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)"
        
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
}
