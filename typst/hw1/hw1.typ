#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.4" as fletcher: diagram, node, edge

#let Rect = $bold(sans("Rect"))$
#let Sq = $bold(sans("Sq"))$
#let Tri = $bold(sans("Tri"))$
#let Light = $bold(sans("Light"))$

// colors!
#let actRed = color.mix((red, 50%), (white))
#let actBlue = color.rgb(60%, 75%, 100%)
#let actGreen = color.mix((green, 40%), (white))
#let actYellow = color.mix((yellow, 30%), (white))

#let color1 = actRed
#let color2 = actYellow
#let color3 = actBlue
#let color4 = actGreen

= Homework \#1

Here's your homework for this week, due Sunday 1/26 by pdf upload to
Canvas. I'm also posting the .tex source on my
#link("https://github.com/rhinopotamus/math312")[new MATH 312 github repo];,
with lots of comments, so that you can see how it is made and borrow
some tricks.

+ In class on Wednesday we discussed an attendance and participation
  policy. I think we settled on a coherent vision of a respectful and
  involved classroom community, and in particular, we talked about when
  it's okay and not okay to be absent. Please write an appropriate
  amount of words about what you understand the attendance and
  participation policy to be.

+ Get set up with a mathematical document typesetting system. Refer to
  this
  #link("https://github.com/rhinopotamus/math312/blob/main/resources/typesetting.md")[typesetting resources document]
  for some pointers.

+ In class on Wednesday, we explored the group of symmetries of a
  rectangle, which I shall call $Rect$. Explore $"Sq"$, the group of
  symmetries of a square.

  - We decided that $Rect$ contains 4 distinct symmetries (and we say
    that $Rect$ has _order_ 4 and write $|Rect|= 4$):

    - $e$, the "identity" symmetry where you do nothing

    - $f$, a (vertical) flip

    - $s$, a (horizontal) spin

    - $r$, a half-turn rotation (so it doesn't matter whether it's cw or
      ccw)

    Certainly $lr(|Sq|) > lr(|Rect|)$ -- in particular, a
    quarter-turn rotation is a symmetry of the square that isn't a
    symmetry of a rectangle. How many _distinct_ symmetries are in
    $Sq$? Give them good letter names.

  - Here's the Cayley diagram for $Rect$: (NOTE: Currently drawn in base CeTZ. TODO: switch to Fletcher so I can draw the identity loops.)

    #cetz.canvas({
      import cetz.draw: *

      group(name: "top-left", {
        {set-style(stroke: none)
        rect((0,.5),(rel: (1,.5)), fill: color1)
        rect((1,.5),(rel: (1,.5)), fill: color2)
        rect((0, 0),(rel: (1,.5)), fill: color4)
        rect((1, 0),(rel: (1,.5)), fill: color3)}
        rect((0,0),(rel: (2,1)), stroke: black)
        content((.5, .75),[$1$]); content((1.5, .75),[$2$])
        content((.5, .25),[$4$]); content((1.5, .25),[$3$])
      })
      translate((5,0))
      group(name: "top-right", {
        {set-style(stroke: none)
        rect((0,.5),(rel: (1,.5)), fill: color2)
        rect((1,.5),(rel: (1,.5)), fill: color1)
        rect((0, 0),(rel: (1,.5)), fill: color3)
        rect((1, 0),(rel: (1,.5)), fill: color4)}
        rect((0,0),(rel: (2,1)), stroke: black)
        content((.5, .75),[$2$]); content((1.5, .75),[$1$])
        content((.5, .25),[$3$]); content((1.5, .25),[$4$])
      })
      translate((0, -3.5))
      group(name: "bottom-right", {
        {set-style(stroke: none)
        rect((0,.5),(rel: (1,.5)), fill: color3)
        rect((1,.5),(rel: (1,.5)), fill: color4)
        rect((0, 0),(rel: (1,.5)), fill: color2)
        rect((1, 0),(rel: (1,.5)), fill: color1)}
        rect((0,0),(rel: (2,1)), stroke: black)
        content((.5, .75),[$3$]); content((1.5, .75),[$4$])
        content((.5, .25),[$2$]); content((1.5, .25),[$1$])
      })
      translate((-5,0))
      group(name: "bottom-left", {
        {set-style(stroke: none)
        rect((0,.5),(rel: (1,.5)), fill: color4)
        rect((1,.5),(rel: (1,.5)), fill: color3)
        rect((0, 0),(rel: (1,.5)), fill: color1)
        rect((1, 0),(rel: (1,.5)), fill: color2)}
        rect((0,0),(rel: (2,1)), stroke: black)
        content((.5, .75),[$4$]); content((1.5, .75),[$3$])
        content((.5, .25),[$1$]); content((1.5, .25),[$2$])
      })
      {
        set-style(mark: (symbol: "stealth"))
        set-style(stroke: (thickness: 2pt))
        line("top-left", "top-right", stroke: (paint: blue), name: "top")
        line("bottom-left", "bottom-right", stroke: (paint: blue), name: "bottom")
        line("top-left.south-east", "bottom-right.north-west", stroke: (paint: green), name: "diag1")
        line("top-right.south-west", "bottom-left.north-east", stroke: (paint: green), name: "diag2")
        line("top-left", "bottom-left", stroke: (paint: red), name: "left")
        line("top-right", "bottom-right", stroke: (paint: red), name: "right")
      }
      content(("top.start", 50%, "top.end"), text(blue)[$s$], padding: 0.1, anchor: "south")
      content(("bottom.start", 50%, "bottom.end"), text(blue)[$s$], padding: 0.1, anchor: "north")
      content(("left.start", 50%, "left.end"), text(red)[$f$], padding: 0.1, anchor: "east")
      content(("right.start", 50%, "right.end"), text(red)[$f$], padding: 0.1, anchor: "west")
      content(("diag1.start", 30%, "diag1.end"), text(green)[$r$], padding: 0.1, anchor: "north-east")
      content(("diag2.start", 30%, "diag2.end"), text(green)[$r$], padding: 0.1, anchor: "north-west")
    })
  
    Draw a Cayley diagram for
    $Sq$. Notes:

    - It would be reasonable to omit the identity loops to reduce visual
      clutter.

    - Will all of your arrows be double-headed this time?

  - We decided that $Rect$ is _generated by_ any two non-trivial
    symmetries and we wrote several different _presentations_,
    such as
    $Rect = angle.l f , s divides f^2 = s^2 = e , f s = s f angle.r$.

    - See if you can determine a minimal generating set for $Sq$.
      (There are 12 possibilities.)

    - See if you can write a presentation for $Sq$.

  - What's similar and what's different between $Rect$ and $Sq$?

    - In $Rect$, every pair of symmetries _commuted_ -- for
      instance, $f r = r f$. (We say that $Rect$ is _abelian_.)
      Is this true for $Sq$?

    - In $Rect$, every symmetry was its own _inverse_ -- for
      instance, $s s "(aka" s^2 ")" = e$. (We say that every
      element of $Rect$ is _idempotent_.) Is this true for
      $Sq$?

Here are some extension problems. You should try "some" of them. How
many is "some"? Idk.

4. Count the symmetries of every upper-case letter in the English
  alphabet. Assume they're the most boring, non-decorated, sans-serif
  versions possible; for instance, "U" should really look like
  "$union.big$". Notice that every letter has at least one symmetry (the
  identity).

+ Explore $Tri$, the group of symmetries of an equilateral triangle.

+ Write out the multiplication table for $Rect$. (Convention: the box
  in the $s$ row and the $r$ column is $s r$, not $r s$.)

  #table(columns: 5, align: center, 
  [], table.vline(stroke:2pt), $e$, $s$, $r$, $f$, table.hline(stroke:2pt),
  $e$, [], [], [], [],
  $s$, [], [], [], [],
  $r$,[], [], [], [],
  $f$,[], [], [], []  
  )

+ Write out the multiplication table for $Sq$.

+ Write out the multiplication table for $Tri$.

+ Here is a thing called a _frieze_. It goes on infinitely in both
  directions. Explore the group of symmetries of this figure. (Is it
  finite or infinte?)

+ Not every group comes from symmetries of a geometric figure (they're
  just nice examples to play with). Consider two light switches on a
  wall side by side, and think about all the possible actions that you
  can do to the two light switches. For example, one action is to toggle
  the left light switch while leaving the right one alone. Let's call
  this group of actions $Light_2$.
  #set enum(numbering: "(a)")

  + How many distinct actions does $Light_2$ have? Give these actions
    good letter names.

  + Draw a Cayley diagram for $Light_2$.

  + Find a minimal generating set for $Light_2$ and write a
    presentation.

  + Seem familiar?
