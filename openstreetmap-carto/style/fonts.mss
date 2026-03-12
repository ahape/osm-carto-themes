/*
About fonts:

Noto is a font family that wants to cover most of Unicode with a harmonic
design across various scripts. We use Noto for most text and some fallback fonts.

By order:

1. Noto Sans:

Noto Sans is available for most scripts and it is used as a first choice. Noto
provides also a Serif style for quite a few scripts, Rashi for Hebrew, Nask
for Arabic. This CartoCSS style uses the Sans style because it’s the most
consistent and the most legible choice. Also, the other styles might redefine
parts of the Latin script, which is not desired.

Where available the UI version of the fonts – which provides tighter vertical
metrics – is used. We intent to have all scripts of Noto in
our list except dead (historic) scripts of whom we assume that they are not
used in “name” tags in OSM. Most of the list is in alphabetical order,
but there are some exceptions.

  - Noto Sans is before all other fonts

  - Noto Sanc CJK JP is placed behind the other fonts because it redefines the
    Latin script, and their design should not overwrite the standard design.

The used CJK font covers all CJK languages, but defaults to the Japanese
glyph style if various glyph styles are available. We have to default to one
of JP, KR, SC, TC because this style has no knowledge about what language the
“names” tag contains. As in Korea Han characters are not so widely used, it is
better to default to either Chinese or Japanese. As Chinese exists in the two
variants SC/TC, it won’t be a uniform rendering anyway. So we default to
Japanese. However, this choice stays somewhat arbitrary and subjective.

2. Noto fonts that are not available in a Sans style:

The old Noto Sans Tibetan has been renamed to Noto Serif
Tibetan in 2015, since then only Noto Serif Tibetan gets updated.

Noto provides two variants of Emoji: Noto Color Emoji and Noto Emoji. The
colour variant is a SVG flavoured OpenType font that contains coloured emojis.
This is not useful in cartography, so we use the “normal” monochromatic
Noto Emoji.

3. Fallback fonts:

Hanazono covers almost all CJK characters, even in Unicode Plane 2.
*/

/* Use vendored fonts. This allows for more recent versions and better coverage */
Map {
  font-directory: url('fonts');
}

/*
A regular style.
*/

/*
A bold style is available for almost all scripts. Bold text is heavier than
regular text and can be used for emphasis. Fallback is a regular style.
*/

/*
Italics are only available for the (Latin-Greek-Cyrillic) base font, not the other scripts.
(Apart from that, only Noto Tamil has an Italic style, but just for Serif, not for Sans.)
For a considerable number of labels this style will make no difference to the regular style.
*/
