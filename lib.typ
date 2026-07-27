#let light_novel(title: "", body) = {
  set page(
    paper: "jis-b6",
    margin: (top: 15mm, bottom: 23mm, left: 16mm, right: 16mm),
    numbering: "1",
    footer: context {
      let page_num = counter(page).get().first()
      let headings = query(heading.where(level: 1).before(here()))
      
      if headings.len() > 0 {
        let chapter_title = if headings.len() > 0 {
          headings.last().body
        } else {
          ""
        }
        
        if calc.even(page_num) {
          place(left, move(dx: -0.9cm, dy: 0.6cm, text([#page_num #sym.dot #title], size: 8pt)))
        } else {
          place(right, move(dx: 0.9cm, dy: 0.6cm, text([#chapter_title #sym.dot #page_num], size: 8pt)))
        }
      }
    },
  )
  
  set text(font: "KoPubWorldBatang", size: 10pt)
  set par(leading: 1.25em, first-line-indent: (amount: 0.6em, all: true), justify: true)
  show heading.where(level: 1): set text(size: 20pt)
  show heading: it => [
    #pagebreak(to: "odd")
    #v(1em, weak: false)
    #it
    #v(3em)
  ]
  
  body
}