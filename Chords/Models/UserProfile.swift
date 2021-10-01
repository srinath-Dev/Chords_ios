//
//  UserProfile.swift
//  Chords
//
//  Created by Srinath Dev on 19/09/21.
//

import Foundation

struct UserProfile {
    let country: String
    let display_name:String
    let email:String
    let explicit_content: [String: Int]
    let external_urls: [String:String]
    let followers: [String: Codable]
}

//{
//    country = IN;
//    "display_name" = "Srinath Dev";
//    "explicit_content" =     {
//        "filter_enabled" = 0;
//        "filter_locked" = 0;
//    };
//    "external_urls" =     {
//        spotify = "https://open.spotify.com/user/rd522gcfvkeyhns8l0zjlzdi2";
//    };
//    followers =     {
//        href = "<null>";
//        total = 0;
//    };
//    href = "https://api.spotify.com/v1/users/rd522gcfvkeyhns8l0zjlzdi2";
//    id = rd522gcfvkeyhns8l0zjlzdi2;
//    images =     (
//                {
//            height = "<null>";
//            url = "https://i.scdn.co/image/ab6775700000ee8520717b3fd248297e10d19c64";
//            width = "<null>";
//        }
//    );
//    product = open;
//    type = user;
//    uri = "spotify:user:rd522gcfvkeyhns8l0zjlzdi2";
//}
