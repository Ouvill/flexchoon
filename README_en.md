# FlexChoon & FlexWave Packages

LaTeX packages for displaying Japanese long vowel marks (ー) and wave symbols (〜) with arbitrary lengths.

[日本語README](README.md)

## Overview

This project provides two packages:

- **flexchoon**: Package for extending Japanese long vowel marks "ー" to arbitrary lengths
- **flexwave**: Package for drawing wave lines "〜" with arbitrary lengths

Both packages support both vertical and horizontal writing modes and work with various Japanese fonts.

## Features

### flexchoon Package
- Natural extension of long vowel marks to arbitrary lengths
- Preserves font-specific character shapes
- Supports line-break prohibition rules
- Compatible with both vertical and horizontal writing modes

### flexwave Package
- Draws smooth wave lines with arbitrary lengths
- High-quality rendering using TikZ
- Screen reader compatibility (overlays transparent 〜 characters)
- Compatible with both vertical and horizontal writing modes

## Requirements

- LuaLaTeX
- Required packages:
  - `trimclip`
  - `graphicx`
  - `luacode`
  - `luatexja-adjust`
  - `tikz`
  - `xcolor`

## Installation

1. Download `flexchoon.sty` and `flexwave.sty` to your project directory
2. Load the packages in your LaTeX document preamble:

```latex
\usepackage{flexchoon}  % Long vowel mark package
\usepackage{flexwave}   % Wave line package
```

## Usage

### flexchoon Usage Examples

```latex
\documentclass{jlreq}
\usepackage{flexchoon}

\begin{document}

% Basic usage
「うおぉ\flexchoon{1}っ！」 % 1 character length
「うおぉ\flexchoon{2}っ！」 % 2 characters length
「うおぉ\flexchoon{3}っ！」 % 3 characters length
「うおぉ\flexchoon{5}っ！」 % 5 characters length

% Alternative command
「うおぉ\expandchoon{3}っ！」 % Same as \flexchoon

\end{document}
```

### flexwave Usage Examples

```latex
\documentclass{jlreq}
\usepackage{flexwave}

\begin{document}

% Basic usage
「うわ\flexwave{1}っ！」 % 1 character length
「うわ\flexwave{2}っ！」 % 2 characters length
「うわ\flexwave{3}っ！」 % 3 characters length

% Specify line width
「うわ\flexwavewidth{3}{0.1\zw}っ！」 % Thick wave line

\end{document}
```

### Complete Sample

See the complete sample code in `sample/main.tex`:

```latex
\documentclass[tate,book,paper=a6paper,fontsize=9pt]{jlreq}
\usepackage{flexchoon}
\usepackage{flexwave}
\usepackage{luatexja-fontspec}

\setmainjfont{GenEi Koburi Mincho v6}

\begin{document}

\section{Long Vowel Mark Example}
「うおぉ\flexchoon{3}っ」

\section{Wave Line Example}
「うわ\flexwave{3}っ」

\end{document}
```

## Command Reference

### flexchoon Package

| Command | Description |
|---------|-------------|
| `\flexchoon{ratio}` | Display long vowel mark with specified ratio |
| `\expandchoon{ratio}` | Synonym for `\flexchoon` |

**Parameters:**
- `ratio`: Length ratio of the long vowel mark (integer or decimal)
  - Values less than 1 display regular "ー"
  - Values 2 and above apply the stretching effect

### flexwave Package

| Command | Description |
|---------|-------------|
| `\flexwave{length}` | Display wave line with standard thickness |
| `\flexwavewidth{length}{width}` | Display wave line with specified line width |

**Parameters:**
- `length`: Length of the wave line (in character units)
- `width`: Line thickness (e.g., `0.05\zw`, `1pt`, etc.)

## Technical Specifications

### flexchoon Working Principle

1. Divides the long vowel mark "ー" into three parts (left, center, right)
2. Preserves the original shape of left and right ends
3. Stretches only the center part according to the specified ratio
4. Generates natural-looking long vowel marks

### flexwave Working Principle

1. Uses TikZ to mathematically calculate wave forms
2. Adjusts sampling points according to specified length
3. Draws wave lines with smooth curves
4. Places transparent 〜 characters for screen reader compatibility

## Font Compatibility

Tested with the following fonts:

- GenEi Koburi Mincho (源暎こぶり明朝)
- GenEi Chikugo Mincho (源暎筑紫明朝)
- Shippori Mincho (しっぽり明朝)
- IPAex Gothic (IPAexゴシック)

## Important Notes

- Requires compilation with LuaLaTeX
- Does not work with pLaTeX or XeLaTeX
- Automatically optimized layout in vertical writing mode
- Line-break prohibition rules prevent long vowel marks and wave lines from appearing at line beginnings

## License

MIT License

## Authors

Ouvill

## Contributing

Please report bugs and feature requests via GitHub Issues. Pull requests are also welcome.

## Related Links

- [Sample Document](sample/main.tex)
- [Package Source Code](flexchoon.sty)
- [Wave Package Source Code](flexwave.sty)