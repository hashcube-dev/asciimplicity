#import "@preview/catppuccin:1.1.0": *

#let vertical(data, palette) = {
  set page(fill: palette.surface0.rgb, margin: 5%, width: 600pt, height: 900pt)
  set text(fill: palette.text.rgb, size: 20pt)
  set block(inset: 10pt, radius: 8pt)
  page(
    align(center+horizon,
      grid(
        gutter: 5%,
        // Title
        block(
          width: 100%, height: 7.5%,
          fill: palette.surface1.rgb,
          // fucking insane oneliner
          context(text(weight: "bold", size: calc.min(30pt, 200pt/measure(data.Title).width * 30pt) , data.Title))
        ),
        // Art
        block(
          width: 100%,
          height: 75%,
          fill: palette.base.rgb,
          align(horizon+center)[
            #set text(size: 32.5pt)
            #set par(leading: 12.5pt, spacing: 12.5pt)
            #eval(data.Drawing, mode: "code", scope: (palette: palette, sys: sys))
          ]
        ),
        // Origin
        block(
          width: 100%, height: 7.5%,
          fill: palette.surface1.rgb,
          context(text(size: calc.min(27.5pt, 200pt/measure(data.Origin).width * 120pt) , data.Origin))
        )
      )
    )
  )
}
#let horizontal(data, palette) = {
  set page(fill: palette.surface0.rgb, margin: 5%, width: 920pt, height: 430pt)
  set text(fill: palette.text.rgb, size: 20pt)
  set block(inset: 10pt, radius: 8pt)
  page(
    align(center+horizon)[
      #grid(
        columns: (1fr, 1.75fr),
        gutter: 5%,
        // Title
        grid.cell( colspan: 2, block(
          width: 100%, height: 7.5%,
          fill: palette.surface1.rgb,
          // fucking insane oneliner
          context(text(weight: "bold", size: calc.min(20pt, 200pt/measure(data.Title).width * 10pt) , data.Title))
        )),
        // Art
        grid.cell(
          rowspan: 2,
          block(
            width: 100%,
            height: 87.5%,
            fill: palette.base.rgb,
            {
              set text(size: 17.5pt)
              set par(leading: 5pt, spacing: 5pt)
              eval(data.Drawing, mode: "code", scope: (palette: palette, sys: sys))
            }
          )
        ),
        // Origin
        block(
          width: 100%, height: 7.5%,
          fill: palette.surface1.rgb,
          context(text(size: calc.min(15pt, 200pt/measure(data.Origin).width * 120pt) , data.Origin))
        ), 
        block(
          width: 100%, height: 75%,
          fill: palette.base.rgb,
          {
            let status(item, shown) = {
              set list(marker: text("|>"))
              if shown == none {
                text(fill: palette.base.rgb, item)
              } else if shown {
                text(fill: palette.green.rgb, item)
              } else {
                text(fill: palette.red.rgb, item)
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
#let palette = flavors.at(sys.inputs.flavor).colors
#set text(font: "IosevkaHashcube Nerd Font Mono")
#vertical(data, palette)
#horizontal(data, palette)
