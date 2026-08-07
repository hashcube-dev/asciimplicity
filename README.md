# Asciimplicity

Asciimplicity is a Programmatically generated set of Steam Grids made from a simple `.yaml` file.

## Build Instructions

Requirements:
- Typst Compiler
- Nushell (to run the build script)
- [Iosevka Hashcube](https://tangled.org/did:plc:efquyxtdunysezeo27wkrw5l)

```sh
./build (manifest) (flavor)
```

`manifest` is the name of the grid to generate. It defaults to `@all`, which builds all manifests
`flavor` is the catppuccin flavor to use when generating. It defaults to `mocha`

## FAQ

### What is this?

Asciimplicity (now called [Asciimplicity Legacy](https://www.steamgriddb.com/collection/18465))
is a collection of simplistic Steam Grids that I made with ascii. These kinda sucked.
Not the grids themselves, some of them are kinda good, but rather the way I had been making them.
I was using GOOGLE SLIDES and doing a lot of things manually. This is why the last one was posted
almost a year ago at the time of writing this; it just really sucked to do.

Recently though, I got reminded of the project and thought "I can do this way better." So I did.

### Why Catppuccin?

It's the colorscheme I use and also it has a Typst Module.

### Why Typst?

I chose Typst for a few main reasons.

1. It has a Catppuccin Module
2. It's open source
3. I'm extremely comfortable working in it
4. It generates images
5. It has YAML support

### Why YAML?

It has easy multiline strings and Typst supports it

### How is this easier/better than doing things manually?

Well, for starters, this is fully open-source. fully cutting out Google as the middle man.
Second, everything is mostly automatic, the only thing that is manual is putting in some info and making the drawing.
Lastly, and this is the coolest thing by far, the Ascii art is CODE! This is the example drawing.

```typst
for color in (
    palette.rosewater, palette.flamingo, palette.pink, palette.mauve,
    palette.red, palette.peach, palette.yellow, palette.green,
    palette.teal, palette.sky, palette.sapphire, palette.blue,
    palette.lavender, palette.text, palette.subtext1, palette.subtext0,
) { for _ in range(30) { text(fill: color.rgb)[@] }; [\ ] }
```

### Can you add `X` Game?

I might add it. However, through the power of open-source, YOU HAVE THE POWER (to go do it yourself)!!

### Can I add support for another colorscheme?

Yes, but do it in a fork. I'm good with just Catppuccin for now.
