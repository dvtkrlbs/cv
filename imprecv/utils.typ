// Helper Functions
#let monthname(n, display: "short", language: "en") = {
    n = int(n)

    let monthNames = (
        en: ("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"),
        tr: ("Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"),
    )

    let month = monthNames.at(language).at(n - 1)

    // if n == 1 { month = "January" }
    // else if n == 3 { month = "March" }
    // else if n == 2 { month = "February" }
    // else if n == 4 { month = "April" }
    // else if n == 5 { month = "May" }
    // else if n == 6 { month = "June" }
    // else if n == 7 { month = "July" }
    // else if n == 8 { month = "August" }
    // else if n == 9 { month = "September" }
    // else if n == 10 { month = "October" }
    // else if n == 11 { month = "November" }
    // else if n == 12 { month = "December" }
    // else { month = none }
    if month != none {
        if display == "short" {
            month = month.codepoints().slice(0, count: 3).join()
        } else {
            month
        }
    }
    month
}

#let strpdate(isodate, language: "en") = {
    let date = ""
    if lower(isodate) != "present" {
        let year = int(isodate.slice(0, 4))
        let month = int(isodate.slice(5, 7))
        let day = int(isodate.slice(8, 10))
        let monthName = monthname(month, display: "short", language: language)
        date = datetime(year: year, month: month, day: day)
        date = monthName + " " + date.display("[year repr:full]")
    } else if lower(isodate) == "present" {
        if language == "en" {
            date = "Present"
        } else if language == "tr" {
            date = "Halen"
        }
    }
    return date
}

#let daterange(start, end) = {
    if start != none and end != none [
        #start #sym.dash.en #end
    ]
    if start == none and end != none [
        #end
    ]
    if start != none and end == none [
        #start
    ]
}
