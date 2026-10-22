#import "@preview/lovelace:0.3.0": *
#import "@preview/cetz:0.5.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge


#let tq = $thick | thick$

#let currentH(level: 1) = {
  let elems = query(selector(heading.where(level: level)).after(here()))

  elems = elems.filter(it => it.location().page() == here().page())

  if elems.len() != 0 and elems.first().location().page() == here().page() {
    return [#elems.last().body]
  } else {
    elems = query(selector(heading.where(level: level)).before(here()))
    if elems.len() != 0 {
      return [#elems.last().body]
    }
  }
  return "Dictionnaire"
}

#let convert_months(num) = {
  (
    (num == 1, "janvier"),
    (num == 2, "février"),
    (num == 3, "mars"),
    (num == 4, "avril"),
    (num == 5, "mai"),
    (num == 6, "juin"),
    (num == 7, "juillet"),
    (num == 8, "août"),
    (num == 9, "septembre"),
    (num == 10, "octobre"),
    (num == 11, "novembre"),
    (num == 12, "décembre"),
  )
    .find(t => t.at(0))
    .at(1)
}

#let convert_days(name) = {
  (
    (name == "Monday", "lundi"),
    (name == "Tuesday", "mardi"),
    (name == "Wednesday", "mercredi"),
    (name == "Thursday", "jeudi"),
    (name == "Friday", "vendredi"),
    (name == "Saturday", "samedi"),
    (name == "Sunday", "dimanche"),
  )
    .find(t => t.at(0))
    .at(1)
}

#let template(
  doc,
  title: "",
  subtitle: "",
  author: "",
  collaborators: (),
  show_outline: true,
  outline_depth: 2,
  footer: ("a", "b")
) = {
  [
    #let author = if type(author) == array { author.join(", ") } else { author }
    
    #let collaborators = if type(collaborators) == array { collaborators.join(", ") } else { collaborators }
    
    #set text(lang: "fr")

    #set document(title: title, author: author, date: datetime.today())

    #set par( // À vérifier si ok /!\
      justify: true,
      spacing: 1em,
    )

    #show link: set text(blue)

    #set figure(
      supplement: "Figure"
    )

    #set page(
      margin: (x: 30pt, top: 50pt, bottom: 40pt),
      header: context {
        let current-chapter = currentH()
        let current-page = here().page()

        let entries-on-page = query(metadata)
          .filter(it =>
            counter(page).at(it.location()).first() == current-page
          )

        if entries-on-page.len() > 0 {
          set text(size: 9pt)
        
          grid(
            columns: (1fr, 1fr, 1fr),
            align: (left, center, right),
            entries-on-page.first().value,
            title,
            entries-on-page.last().value,
          )
          block(line(length: 100%, stroke: 0.5pt), above: 0.4em)
        }
        
      },

      footer: context  {
        let footer-left = "Lycée du Parc"
        let footer-center = counter(page).display(
            "1",
            both: false,
        )
        let footer-right = author
        set text(9pt)
        if counter(page).get().first() > 3 { // 1 for no first page, etc...
          grid(
            columns: (1fr, 1fr, 1fr),
            align: (left, center, right),
            if calc.even(here().page()) {footer-right} else {footer-left},
            footer-center,
            if calc.even(here().page()) {footer-left} else {footer-right}
          )
        }
      },
    )

    #set heading(numbering: none)

    // #let header_counter(level) = context {
    //   counter(heading).display((..nums) => {
    //     let c = nums.pos().last()
    //     if level == 1 { numbering("I -", c) } else if level == 2 { numbering("1)", c) } 
    //     else if level == 3 { numbering("a.", c) } 
    //     else { numbering("(i)", c) }
    //   })
    // }
    // #let header_counter(level) = context {
    //   counter(heading).display((..nums) => {
    //     let c = nums.pos().last()
    //     if c == 0 { "0 -" } else if level == 1 { numbering("I -", c) } else if level == 2 {
    //       numbering("1)", c)
    //     } else if level == 3 { numbering("a.", c) } else { numbering("(i)", c) }
    //   })
    // }

    #show heading: it => {
      par()[
        // #header_counter(it.level)
        #if it.body.text.len() == 1 {$scr(#it.body)$} else {it.body}
      ]
    }

    // #show heading.where(level: 1): it => {
    //   v(0.5em)
    //   set text(18pt, font: "Leckerli One")
    //   it
    //   counter(math.equation).update(0) // reset equation counter for each chapter
    // }

    // #show heading.where(level: 2): it => {
    //   stack(
    //     spacing: 0.32em,
    //     it,
    //     align(center, line(length: 100%, stroke: (paint: gray, thickness: 0.8pt))),
    //   )
    // }
    // #set math.equation(numbering: "(1)")
    // #show math.equation: it => {
    //   if it.block and not it.has("label") [
    //     #counter(math.equation).update(v => v - 1)
    //     #math.equation(it.body, block: true, numbering: none)#label(" ")
    //   ] else {
    //     it
    //   }
    // }
    
    #doc
  ]
}

#let slugify(s) = {
  lower(s)
    .replace(" ", "-")
    .replace("'", "-")
    .replace("é", "e")
    .replace("è", "e")
    .replace("ê", "e")
    .replace("ë", "e")
    .replace("à", "a")
    .replace("â", "a")
    .replace("ä", "a")
    .replace("î", "i")
    .replace("ï", "i")
    .replace("ô", "o")
    .replace("ö", "o")
    .replace("ù", "u")
    .replace("û", "u")
    .replace("ü", "u")
    .replace("ç", "c")
}

#let entries = state("entries", ())
#let entries-count = state("entries-count", 0)

// Word : titre de l'entrée
// Related : liste d'entrées en lien avec
#let item(word, children, related: ()) = {
  entries.update(old => {
    old.push((
      word: word,
      slug: slugify(word),
      children: children,
      related: related
    ))

    old
  })
}

#let render-entries() = {

  // Cache ou non les entrées avec écrit "todo" à l'intérieur
  let hide-todo = true

  entries.update(old => {
    old.sorted(key: it => it.slug)
  })

  context {
    
    let initial = ""
    let count = 0

    for el in entries.final() {

        if el.slug.at(0) != initial {
          
          initial = el.slug.at(0)
          pagebreak()

          if initial == "a" {place(hide(heading(level: 1)[Dictionnaire]))}
          v(4em)
          
          align(center)[
            #text(size: 70pt)[== #upper(initial)]
          ]

          v(-1em)
        }

        // Invisible si todo dans le résultat
        if lower(repr(el.children)).contains("todo") and hide-todo {
          [#strong("")#label(el.slug)]
          continue
        }

        count += 1
        
        // On garde un seul bloc avec le label
        [#strong(el.word) #label(el.slug)]

        // Metadata pour les mots en haut
        metadata(el.word)
        
        el.children

        // Entrées en lien
        if el.related.len() > 0 {
          linebreak()
          // sym.arrow.r.hook          
          $\u{21AA} thick$
          if type(el.related) == str {
            link(label(slugify(el.related)))[#el.related]
          } else { 
            el.related.map(it => link(label(slugify(it)))[#it]).join(", ")
          }
          linebreak()
        }
        
        v(1em)
    }
    
    entries-count.update((it) => count)
  }
}

#let remarque(children) = {
  [_Remarque :_ #children]
}

#let exemple(children) = {
  [_Exemple :_ #children]
}

#let implementation(children) = {
  [_Implémentation :_ #children]
}

#let code(name, body) = figure(
  kind: "algorithm",
  supplement: "Algorithme",
  caption: name,
  
  pseudocode-list(
    target: 100%,
    booktabs: true,
    title: name + h(1fr),
    line-numbering: none,
    indentation: 1.4em,
    line-gap: 0.8em,
    hooks: .5em,
    body
  )
)

#let draw-arrow(x, y) = {
  import cetz.draw: * 
  line(x, y, mark: (end: ")>", fill: black))
}

#let draw-tree1(data) = {
  import cetz.draw: *
  import cetz.tree: *
  
  tree(direction: "bottom",
    draw-node: (node) => {
      circle((), radius: .15, fill: black, stroke: none)
      content(() + (-0.6, 0.3), text(black, [#node.content]))
    },
    draw-edge: (parent, child) => {
      let (a, b) = (parent.group-name, child.group-name)
      line((a, 0, b), (b, 0, a))
    },
    data
  )
}

#let cap(l) = text(fill: blue, size: 64pt)[#l]