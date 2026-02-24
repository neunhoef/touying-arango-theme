# Typst + Arango Theme: Installation & Usage

## 1. Install Typst

### Option A: Pre-built binary (fastest)

```bash
# Download the latest release
curl -fsSL https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz \
  | tar -xJ --strip-components=1 -C ~/.local/bin/

# Verify
typst --version
```

Make sure `~/.local/bin` is in your `$PATH`. If not:
```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Option B: Via cargo (if you have Rust installed)

```bash
cargo install typst-cli
```

### Option C: Package managers

```bash
# Arch Linux
pacman -S typst

# Nix
nix-env -iA nixpkgs.typst

# Homebrew (Linuxbrew)
brew install typst
```

## 2. Install the Urbanist font

The Arango brand template uses **Urbanist**. Typst needs it installed on your system.

```bash
# Create local font directory
mkdir -p ~/.local/share/fonts

# Download Urbanist from Google Fonts
curl -L "https://fonts.google.com/download?family=Urbanist" -o /tmp/urbanist.zip
unzip /tmp/urbanist.zip -d ~/.local/share/fonts/Urbanist/

# Refresh font cache
fc-cache -fv

# Verify it's found
fc-list | grep -i urbanist
```

Also install **Fira Code** for code blocks (if you don't have it):
```bash
sudo apt install fonts-firacode   # Debian/Ubuntu
# or
pacman -S ttf-fira-code           # Arch
```

## 3. Project structure

```
my-presentation/
├── arango-theme.typ      # The theme file
├── sample-deck.typ       # Your presentation
└── images/               # Optional: images to embed
    ├── logo.svg
    └── diagram.png
```

## 4. Compile

```bash
cd my-presentation/

# Compile to PDF (16:9 is set in the theme)
typst compile sample-deck.typ

# Watch mode (recompiles on save — great with a PDF viewer)
typst watch sample-deck.typ
```

The first compile will auto-download the `touying` package from the Typst
package registry. No manual package installation needed.

## 5. Theme features & usage cheatsheet

### Slide types

```typ
// Title slide (dark green background)
#title-slide(
  title: [Your Title],
  subtitle: [Your Subtitle],
  author: [Name – Role],
  date: [Month Year],
)

// Section divider (dark green, large text)
#section-slide(
  title: [Section Name],
  subtitle: [Optional description],
)

// Regular content slide (just use a == heading)
== Slide Title
Your content here with *bold*, _italic_, `code`.

// Closing slide
#closing-slide(
  title: [Thank You],
  subtitle: [Contextual Data Layer],
)
```

### Cards (the rounded boxes from the template)

```typ
// Single card
#arango-card(title: "Card Header")[
  Card body content here.
  - Bullet one
  - Bullet two
]

// 2-column cards
#grid(
  columns: (1fr, 1fr),
  column-gutter: 16pt,
  arango-card(title: "Left")[Content],
  arango-card(title: "Right")[Content],
)

// 3-column cards
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 12pt,
  arango-card(title: "A")[...],
  arango-card(title: "B")[...],
  arango-card(title: "C")[...],
)
```

### Numbered steps

```typ
#arango-step(number: 1, title: [Step Title], description: [Details])
#arango-step(number: 2, title: [Next Step], description: [More details])
```

### Quote with lime highlight

```typ
#arango-quote(author: [Name], role: [Title, Company])[
  "Key quote text with #lime-highlight[highlighted phrase] here."
]
```

### Images

```typ
// Full width
#image("images/diagram.png", width: 100%)

// Side by side with text
#grid(
  columns: (1fr, 1fr),
  column-gutter: 24pt,
  [Your text content here.],
  image("images/photo.png", width: 100%),
)
```

### Tables

```typ
#table(
  columns: (1fr, 1fr, 2fr),
  [*Header A*], [*Header B*], [*Header C*],
  [Row 1],      [Data],       [Description],
  [Row 2],      [Data],       [Description],
)
```

### Code blocks

````typ
```python
def hello():
    print("Hello from Typst!")
```
````

## 7. Tips for LLM-generated slides

When prompting an LLM to generate slides using this theme, include these
instructions in your prompt:

> Write a Typst presentation using Touying and a custom Arango theme.
> The file starts with:
> ```
> #import "@preview/touying:0.6.1": *
> #import "arango-theme.typ": *
> #show: arango-theme.with(aspect-ratio: "16-9")
> ```
>
> Use these slide types:
> - `#title-slide(title: [...], subtitle: [...], author: [...], date: [...])`
> - `#section-slide(title: [...], subtitle: [...])`
> - `== Heading` for regular content slides
> - `#closing-slide(title: [...], subtitle: [...])`
>
> For card layouts use `#arango-card(title: "...")[...]` inside `#grid(...)`.
> For numbered steps use `#arango-step(number: N, title: [...])`.
> For quotes use `#arango-quote(author: [...], role: [...])[...]`.

## 8. Customizing colors

All colors are defined at the top of `arango-theme.typ`:

```typ
#let arango-dark     = rgb("#0d3b1e")   // dark green
#let arango-lime     = rgb("#b8e600")   // lime accent
#let arango-teal     = rgb("#2a9d8f")   // bullet markers
// ... etc
```

Change these and everything cascades automatically.
