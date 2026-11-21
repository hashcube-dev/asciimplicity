#import "@preview/based-schemes:0.1.1": *

#let vertical(data, palette) = {
  set page(fill: palette.base02.rgb.full, margin: 5%, width: 600pt, height: 900pt)
  set text(fill: palette.base05.rgb.full, size: 20pt)
  set block(inset: 10pt, radius: 8pt)
  page(
    align(center+horizon,
      grid(
        gutter: 5%,
        // Title
        block(
          width: 100%, height: 7.5%,
          fill: palette.base03.rgb.full,
          // fucking insane oneliner
          context(text(weight: "bold", size: calc.min(30pt, 200pt/measure(data.Title).width * 30pt) , data.Title))
        ),
        // Art
        block(
          width: 100%,
          height: 75%,
          fill: palette.base00.rgb.full,
          align(horizon+center)[
            #set text(size: 32.5pt)
            #set par(leading: 12.5pt, spacing: 12.5pt)
            #eval(data.Drawing, mode: "code", scope: (palette: palette, sys: sys))
          ]
        ),
        // Origin
        block(
          width: 100%, height: 7.5%,
          fill: palette.base03.rgb.full,
          context(text(size: calc.min(27.5pt, 200pt/measure(data.Origin).width * 120pt) , data.Origin))
        )
      )
    )
  )
}
#let horizontal(data, palette) = {
  set page(fill: palette.base02.rgb.full, margin: 5%, width: 920pt, height: 430pt)
  set text(fill: palette.base05.rgb.full, size: 20pt)
  set block(inset: 10pt, radius: 8pt)
  page(
    align(center+horizon)[
      #grid(
        columns: (1fr, 1.75fr),
        gutter: 5%,
        // Title
        grid.cell( colspan: 2, block(
          width: 100%, height: 7.5%,
          fill: palette.base03.rgb.full,
          // fucking insane oneliner
          context(text(weight: "bold", size: calc.min(20pt, 200pt/measure(data.Title).width * 30pt) , data.Title))
        )),
        // Art
        grid.cell(
          rowspan: 2,
          block(
            width: 100%,
            height: 87.5%,
            fill: palette.base00.rgb.full,
            {
              set text(size: 17.5pt)
              set par(leading: 7.25pt, spacing: 7.25pt)
              eval(data.Drawing, mode: "code", scope: (palette: palette, sys: sys))
            }
          )
        ),
        // Origin
        block(
          width: 100%, height: 7.5%,
          fill: palette.base03.rgb.full,
          context(text(size: calc.min(15pt, 200pt/measure(data.Origin).width * 120pt) , data.Origin))
        ), 
        block(
          width: 100%, height: 75%,
          fill: palette.base00.rgb.full,
          {
            let status(item, shown) = {
              set list(marker: text("|>"))
              if shown == none {
                text(fill: palette.base00.rgb.full, item)
              } else if shown {
                text(fill: palette.base0B.rgb.full, item)
              } else {
                text(fill: palette.base08.rgb.full, item)
              }
            }
            set text(size: 30pt)
            set par(leading: 15pt, spacing: -5pt)
            align(left)[
              #set list(marker: text("|>"))
              - #context(text(size: calc.min(30pt, 200pt/measure(str(data.Year)).width * 59.9pt) , str(data.Year)))
              - #context(text(size: calc.min(30pt, 200pt/measure(str(data.Genre)).width * 59.5pt) , str(data.Genre)))
              - #context(text(size: calc.min(30pt, 200pt/measure(str(data.Author)).width * 59.5pt) , str(data.Author)))
              #status([- Single-player], data.Singleplayer)
              #status([- Online multiplayer], data.Online)
              #status([- Local multiplayer], data.Local)
            ]
          }
        )
      )
    ]
  )
}
#let data = yaml("manifests/" + sys.inputs.manifest + ".yaml")
#let palette = scheme(yaml("schemes/" + sys.inputs.scheme + ".yaml"))
#set text(font: "Iosevka Hashcube")
#vertical(data, palette)
#horizontal(data, palette)
