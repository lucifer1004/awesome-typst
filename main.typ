#let inputYAML = "links.yaml"

#set document(
 title: "Awesome Typst",
)

#set page(
 paper: "us-letter",
 numbering: "1",
)

#set text(
 font: "ETBembo",
 size: 16pt,
)

#show link: it => [
	#set text(blue)
	#it
]

#let coverPage(title) = {
 set text(font: "ETBembo")
 set page(fill: maroon)
 set align(center)
 v(20%)
 text(title, 50pt, white)
}

#coverPage[*Awesome \ Typst*]

#pagebreak()

#outline()

#pagebreak()

#for (section, items) in yaml(inputYAML) [
	= #section

	#for i in items [
		+ #link(i.url, i.name)
		  - #i.description
	]

	#line(length: 80%)

	#table(
		columns: 3,
		stroke: none,
		[*Link*], [*Description*], [*Notes*],

		..(for i in items {
			( [#link(i.url, i.name)], i.description, "", )
		})
	)

	#pagebreak()
]
