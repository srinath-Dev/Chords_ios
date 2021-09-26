//
//  AuthResponse.swift
//  Chords
//
//  Created by Srinath Dev on 26/09/21.
//

import Foundation

struct AuthResponse: Codable{
    let access_token: String
    let expires_in:Int
    let refresh_token:String?
    let scope: String
    let token_type:String
}

//{
//    "access_token" = "BQD8aNlr7xL4t3xUrPW0_9Ij0XTrjOXMYQac08lbeLTrwv1I_9c6Mcz6yNjZoYZI9oiOYGCh24jr8py9o2ilElER2O8x_Px1dj6Fmwy_DoANIwgz_lwAhBjstt3v31K3uMlfUth0fP-w0XpmHdnBAnVA0xA6baFJ6YoaVoaZJEcJYvE";
//    "expires_in" = 3600;
//    "refresh_token" = "AQBs-BHooi_l3FTHQJgiW3wCVZq_zuXriFbsQ4f9gOwxjfYr2mOoD6pvUZP6qm0ehp7Cyyk81nvzMy_pcADABJgbfs8gHjozwnh7_-DPUq4t6bbTlTu4gkY58wyo9np1OaQ";
//    scope = "user-read-private";
//    "token_type" = Bearer;
//}
