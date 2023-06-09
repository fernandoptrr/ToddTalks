//
//  Achievement.swift
//  ToddTalks
//
//  Created by Fernando Putra on 03/05/23.
//

import Foundation

struct Achievement: Identifiable {
    let id : String
    let imagePath: String
    let name: String
    let date: Date
    let body: String
    var isEmpty: Bool = true
    var imageData: Data?
    var lottie : String = Lotties.bye
}

var achievements = [
    Achievement(id: "test1",imagePath: "achievement1", name: "Kata Pertama!", date: Date(), body: "Langkah pertama yang sangat mengesankan !!!", isEmpty: true, lottie : Lotties.bye),
    Achievement(id: "test2",imagePath: "achievement1", name: "Bahasa Tubuh", date: Date(), body: "Hebat! Kamu berhasil menyelesaikannya dengan baik!", isEmpty: true, lottie: Lotties.blowkiss),
    Achievement(id: "test3",imagePath: "achievement1", name: "Stage P", date: Date(), body: "Langkah awal yang sangat mengesankan!!!", isEmpty: true, lottie: Lotties.pisang),
    Achievement(id: "test4",imagePath: "achievement1", name: "Stage B", date: Date(), body: "Hebat! Kamu berhasil menyelesaikannya dengan baik!", isEmpty: true),
    Achievement(id: "test5",imagePath: "achievement1", name: "Stage W", date: Date(), body: "Wah, pencapaian yang keren!!", isEmpty: true),
    Achievement(id: "test6",imagePath: "achievement1", name: "Stage M", date: Date(), body: "Mantap! Kamu sudah bisa mengucapkan kata dengan huruf M dengan sangat baik!", isEmpty: true),
    Achievement(id: "test7",imagePath: "achievement1", name: "Stage H", date: Date(), body: "Hore! Kamu berhasil mengucapkan kata dengan huruf H dengan sangat baik!", isEmpty: true),
    Achievement(id: "test8",imagePath: "achievement1", name: "Stage B, M", date: Date(), body: "Luar biasa! Kamu dapat menyusun dua kata berbunyi B dan M!", isEmpty: true),
    Achievement(id: "test9",imagePath: "achievement1", name: "Stage P, H", date: Date(), body: "Selamat! Kamu berhasil mengucapkan dua kata dengan bunyi P dan H dengan sangat baik!!", isEmpty: true),
    Achievement(id: "test10",imagePath: "achievement1", name: "Stage W, H/B/M", date: Date(), body: "Yes! Kamu sudah bisa menyusun dua kata dengan bunyi huruf W!!", isEmpty: true),
]
