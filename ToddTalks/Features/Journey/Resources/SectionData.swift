//
//  UnitData.swift
//  ToddTalks
//
//  Created by Fernando Putra on 05/05/23.
//

import Foundation

struct SectionData {
    static let section1M1: Section = Section(
        id: "section1M1",
        headline: "Bagian 1 (12 - 15 Bulan)",
        subHeadline: "Komunikasi Dasar",
        stages: [
            [StageData.stage1M1U1],
            [StageData.stage2M1U1]
        ],
        guideline: SectionGuideline(
            lottie: Lotties.baby,
            headline: "Pedoman Bagian 1",
            subHeadline: "Pelajari tips dan trik untuk menyelesaikan bagian 1",
            tips: [
                "Mengajak anak Anda berbicara secara teratur, meskipun kemungkinan ia belum bisa memahami sepenuhnya apa yang dikatakan. Hal ini dapat membantu anak agar terbiasa dengan suara dan intonasi bahasa yang digunakan dalam percakapan sehari-hari.",
                "Menyebutkan objek di sekitar lingkungan anak Anda, seperti saat di rumah Anda bisa menyebutkan nama buah dan benda yang ada.",
                "Mengajukan pertanyaan sederhana kepada anak Anda untuk membantunya berbicara dan berinteraksi. Misalnya, saat  berada di luar rumah Anda bisa bertanya pada anak Anda, \"Apa yang kamu lihat?\"",
                "Menjaga interaksi dengan anak Anda, baik secara verbal maupun non-verbal. Dalam berinteraksi Anda dapat memberikan respons yang positif saat anak mulai mengeluarkan kata-kata atau bunyi-bunyian."
            ]
        )
    )
    
    static let section2M1: Section = Section(
        id: "section2M1",
        headline: "Bagian 2 (16 - 19 Bulan)",
        subHeadline: "Belajar Abjad",
        stages: [
            [StageData.stage1M1U2],
            [StageData.stage2M1U2, StageData.stage3M1U2],
            [StageData.stage4M1U2, StageData.stage5M1U2]
        ],
        guideline: SectionGuideline(
            lottie: Lotties.baby,
            headline: "Pedoman Bagian 2",
            subHeadline: "Pelajari tips dan trik untuk menyelesaikan bagian 2",
            tips: [
                "Melakukan kontak mata dengan anak saat berinteraksi. Dalam melakukannya Anda bisa memposisikan tinggi satu sama lain, seperti merendahkan badan hingga sejajar dengan anak ataupun menyetarakan tingginya sejajar dengan Anda.",
                "Membicarakan hal-hal yang dilihat maupun dilakukan oleh anak Anda, seperti mengikuti arahannya saat bermain bersama dan membahas hal yang diminati anak.",
                "Bicara dengan anak dalam bentuk yang pendek dan sederhana, serta sering mengulanginya di hadapan anak agar ia dapat mengingat dan mengucapkannya secara perlahan.",
                "Sering mengajak anak berbicara saat sedang melakukan aktivitas bersama."
            ]
        )
    )
    
    static let section3M1: Section = Section(
        id: "section3M1",
        headline: "Bagian 3 (20 - 24 Bulan)",
        subHeadline: "Belajar Gabungan Abjad",
        stages: [
            [StageData.stage1M1U3],
            [StageData.stage2M1U3, StageData.stage3M1U3]
        ],
        guideline: SectionGuideline(
            lottie: Lotties.baby,
            headline: "Pedoman Bagian 3",
            subHeadline: "Pelajari tips dan trik untuk menyelesaikan bagian 3",
            tips: [
                "Membicarakan kegiatan sehari-hari yang dilihat atau dilakukan anak dan memberinya jeda untuk merespons perkataan Anda.",
                "Menggunakan objek atau gesture untuk membantu anak dalam memahami pertanyaan dan instruksi.",
                "Membaca buku atau melihat gambar bersama sambil menjelaskannya kepada anak.",
                "Sering mengulangi kata-kata di hadapan anak agar ia dapat mengingat dan mengucapkannya secara perlahan.",
                "Bersabar dan tunggu anak menyelesaikan suatu perkataan atau memintanya untuk menunjukkannya secara langsung."
            ]
        )
    )
}
