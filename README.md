# AnuPpuccin Dracula

A personal, dark-only [Obsidian](https://obsidian.md) theme: a fork of [AnuPpuccin](https://github.com/AnubisNekhet/AnuPpuccin) by Anubis, updated for current Obsidian (1.14) and fixed to the [Dracula](https://draculatheme.com) palette.

Unlike upstream, this fork has **no Style Settings options**. The settings it uses are built in, everything else was removed, and it only ships a dark variant. You don't need the Style Settings plugin.

## What's built in

- **Palette:** Dracula, with Dracula purple as the accent.
- **Fonts:** Inter for text and interface, JetBrains Mono (Nerd Font if installed) for code. Install the fonts locally; Obsidian's own font settings still override them.
- **Layout:** card layout with shadows, card-style file browser and actions, hidden borders, animated safari-style tabs, auto-hiding title bar, hidden scrollbars.
- **Editor & markdown:**
  - active line highlight
  - vanilla-plus callouts in palette colours
  - coloured headings (purple, pink, cyan, green, orange, yellow) with an H1 divider
  - orange bold, yellow italic
  - LaTeX in cyan (inline) and purple (block)
  - styled lists and tables (centred, header highlight, alternating rows)
  - custom preview margins
  - comments hidden while not editing
- **Extras:**
  - custom checkboxes and speech bubbles
  - codeblock line numbers
  - Properties button
  - print styling
  - file and folder icons, full rainbow folders
  - darker canvas, PDF background blending

### Custom checkboxes and speech bubbles

| Syntax  | Description     |
| ------- | --------------- |
| `- [ ]` | Unchecked       |
| `- [x]` | Checked         |
| `- [>]` | Rescheduled     |
| `- [<]` | Scheduled       |
| `- [!]` | Important       |
| `- [-]` | Cancelled       |
| `- [/]` | In Progress     |
| `- [?]` | Question        |
| `- [*]` | Star            |
| `- [n]` | Note            |
| `- [l]` | Location        |
| `- [i]` | Information     |
| `- [I]` | Idea            |
| `- [S]` | Amount          |
| `- [p]` | Pro             |
| `- [c]` | Con             |
| `- [b]` | Bookmark        |
| `- ["]` | Quote           |
| `- [u]` | Up              |
| `- [d]` | Down            |
| `- [w]` | Win             |
| `- [k]` | Key             |
| `- [f]` | Fire            |
| `- [0]` | Speech bubble 0 |
| `- [1]` | Speech bubble 1 |
| `- [2]` | Speech bubble 2 |
| `- [3]` | Speech bubble 3 |
| `- [4]` | Speech bubble 4 |
| `- [5]` | Speech bubble 5 |
| `- [6]` | Speech bubble 6 |
| `- [7]` | Speech bubble 7 |
| `- [8]` | Speech bubble 8 |
| `- [9]` | Speech bubble 9 |

### Per-note CSS classes

Add these to a note's `cssclasses` property.

| Class             | Effect                                          |
| ----------------- | ----------------------------------------------- |
| `hide-metadata`   | Hides the Properties block                      |
| `metadata-button` | Collapses Properties into a button              |
| `row-alt`, `col-alt`, `checkered`, `th-highlight`, `table-full` | Table highlight styles |

## Installation

Build the theme and copy it into a vault:

```bash
make install VAULT="/path/to/vault"
```

This writes `.obsidian/themes/AnuPpuccin Dracula/`. You can put `VAULT := ...` in an untracked `local.mk` instead of passing it each time. Then select **AnuPpuccin Dracula** under Settings → Appearance.

## Building

With Nix, `nix develop` gives a shell with Dart Sass and make (`make build` writes `theme.css`), and `nix build` puts `theme.css` and `manifest.json` in `./result`. Without Nix, install [Dart Sass](https://sass-lang.com/dart-sass) and run `make build`.

Sources are in `src/` (entry point `src/base.scss`). `theme.css` is the compiled output and is committed.

## License

GPL-3.0, like upstream. AnuPpuccin is © Anubis. Its license asks that redistributions credit the theme and keep its Buy Me a Coffee link: <a href="https://www.buymeacoffee.com/anubisnekhet">buymeacoffee.com/anubisnekhet</a>.

### Special thanks to:

- [Paul Ryley](https://github.com/pryley) for countless contributions to the theme and amazing sense of design in general.
- [Chuck Harmston](https://github.com/chuckharmston) for his amazing alternate tabs snippet.
- [melnhh](https://github.com/melnhh) and Lunairee for their amazing colorschemes.
- [EdualcLaiv](https://github.com/EdualcLaiv) for porting Royal Velvet to AnuPpuccin.
- [xotea](https://github.com/xotea) for theming framework tweaks.
- [raisabelatrix](https://github.com/raisabelatrix) for [rainbow tags](https://gist.github.com/raisabelatrix/eb383f7e19b59f951430c2f3c6ed80b0) variables.


## Credits and Acknowledgements

- [@kepano's](https://github.com/kepano) [Minimal](https://github.com/kepano/obsidian-minimal) for the inspiration for [colorful frames](https://github.com/AnubisNekhet/AnuPpuccin/blob/main/src/modules/Features/colorful-frame.scss) and partial inspiration for style settings menus design, as well as style settings for the Minimal Cards snippet
- [@ceciliamay's](https://github.com/ceciliamay) [Primary](https://github.com/ceciliamay/obsidianmd-theme-primary) for inspiration for [custom checkboxes](https://github.com/AnubisNekhet/AnuPpuccin/blob/main/src/modules/Features/custom-checkboxes.scss) and [floating vault title](https://github.com/AnubisNekhet/AnuPpuccin/blob/main/src/modules/Features/floating-title.scss)
- [@SlRvb](https://github.com/SlRvb) for [ITS](https://github.com/SlRvb/Obsidian--ITS-Theme) frontmatter styling inspiration.
- [@Akifyss](https://github.com/Akifyss) for their [border theme](https://github.com/Akifyss/obsidian-border) layout design.
