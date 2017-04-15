
all: model.png

%.png: %.scad
	openscad $< --preview -o $@
	convert $@ -trim $@

%.svg: %.scad
	openscad $< -o temp.svg

clean:
	rm -fr *.png projection*.svg

