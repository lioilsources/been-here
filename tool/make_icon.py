#!/usr/bin/env python3
"""Draws the app icon and the splash mark.

Kept as a script rather than as two opaque PNGs so the shapes can be argued
with later: everything here is a handful of numbers.

    python3 tool/make_icon.py

Writes assets/icon/icon.png (1024, opaque, for the launcher),
assets/icon/splash.png (1024, transparent, for the splash screen) and
assets/icon/adaptive.png (the mark inside Android's safe zone).
"""

from __future__ import annotations

import pathlib

from PIL import Image, ImageDraw

SIZE = 1024
SUPERSAMPLE = 4  # drawn large, then resized: PIL has no antialiasing

AMBER = (180, 99, 42, 255)  # the seed colour of the app's theme
CREAM = (246, 239, 233, 255)

OUT = pathlib.Path(__file__).resolve().parent.parent / "assets" / "icon"


def draw_mark(
    draw: ImageDraw.ImageDraw,
    s: int,
    colour: tuple[int, int, int, int],
    hole: tuple[int, int, int, int],
) -> None:
    """A place marker whose head is a clock face.

    A pin says "here", a clock says "then". The whole app is those two words
    in one picture, so the icon may as well be too.
    """
    # Head.
    cx, cy, r = s * 0.5, s * 0.42, s * 0.26
    draw.ellipse([cx - r, cy - r, cx + r, cy + r], fill=colour)

    # Point: a triangle from the widest part of the head down to the tip.
    # Slightly inside the circle so the joint doesn't show a notch.
    half = r * 0.72
    draw.polygon(
        [(cx - half, cy + r * 0.62), (cx + half, cy + r * 0.62), (cx, s * 0.87)],
        fill=colour,
    )

    # The face: the background again, punched out of the head. On the icon
    # that is the amber behind it; on the splash it is a real hole, because
    # the splash background is whatever the phone's theme is.
    face = r * 0.66
    draw.ellipse([cx - face, cy - face, cx + face, cy + face], fill=hole)

    # Hands: ten past ten reads as a clock at any size. Drawn in the mark's
    # own colour, on the punched-out face.
    width = int(s * 0.035)
    draw.line([(cx, cy), (cx, cy - face * 0.70)], fill=colour, width=width)
    draw.line([(cx, cy), (cx + face * 0.52, cy + face * 0.28)], fill=colour, width=width)
    dot = s * 0.022
    draw.ellipse([cx - dot, cy - dot, cx + dot, cy + dot], fill=colour)


def icon() -> Image.Image:
    s = SIZE * SUPERSAMPLE
    image = Image.new("RGBA", (s, s), AMBER)
    draw_mark(ImageDraw.Draw(image), s, CREAM, AMBER)
    return image.resize((SIZE, SIZE), Image.LANCZOS)


def splash() -> Image.Image:
    s = SIZE * SUPERSAMPLE
    image = Image.new("RGBA", (s, s), (0, 0, 0, 0))
    # Smaller inside its box: the splash tool centres this at roughly a
    # quarter of the screen, and the mark needs air around it.
    draw_mark(ImageDraw.Draw(image), s, AMBER, (0, 0, 0, 0))
    return image.resize((SIZE, SIZE), Image.LANCZOS)


def adaptive() -> Image.Image:
    """The mark alone, small enough for Android's adaptive-icon safe zone.

    Android crops an adaptive foreground to a circle roughly 66 % across and
    animates it beyond that, so anything drawn edge to edge loses its head.
    """
    s = SIZE * SUPERSAMPLE
    mark = Image.new("RGBA", (s, s), (0, 0, 0, 0))
    draw_mark(ImageDraw.Draw(mark), s, CREAM, (0, 0, 0, 0))

    inner = int(SIZE * 0.58)
    canvas = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    canvas.paste(
        mark.resize((inner, inner), Image.LANCZOS),
        ((SIZE - inner) // 2, (SIZE - inner) // 2),
    )
    return canvas


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    icon().save(OUT / "icon.png")
    splash().save(OUT / "splash.png")
    adaptive().save(OUT / "adaptive.png")
    print(f"wrote icon.png, splash.png and adaptive.png into {OUT}")


if __name__ == "__main__":
    main()
