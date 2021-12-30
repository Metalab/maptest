sed -i \
-e 's/"world:\\\/\\\/cccsbg\\\/\(.*\)"/"\\\/_\\\/global\\\/finga.github.io\\\/rc3-cccsbg\\\/\1"/g' \
-e 's/"world:\\\/\\\/devlol\\\/\(.*\)"/"\\\/_\\\/global\\\/devlol-systems.pages.devlol.org\\\/vspace-workadv\\\/\1"/g' \
-e 's/"world:\\\/\\\/grandgarage\\\/\(.*\)"/"\\\/_\\\/global\\\/grand-garage.github.io\\\/gg-workadventure\\\/\1"/g' \
-e 's/"world:\\\/\\\/Metalab\\\/\(.*\)"/"\\\/_\\\/global\\\/metalab.github.io\\\/maptest\\\/\1"/g' \
-e 's/"world:\\\/\\\/realraum\\\/\(.*\)"/"\\\/_\\\/global\\\/realraum.github.io\\\/workadventur3space\\\/\1"/g' \
-e 's/"world:\\\/\\\/steyr-werke\\\/\(.*\)"/"\\\/_\\\/global\\\/steyr-werke.gitlab.io\\\/workadventure-stw\\\/\1"/g' \
-e 's/"world:\\\/\\\/chaoszone\\\/\(.*\)"/"\\\/_\\\/global\\\/raw.githubusercontent.com\\\/die3ungleichen\\\/2D-Welt-thueringen\\\/main\\\/\1"/g' \
$@
for f in $@
do
	tmp=$(mktemp)
	jq -ce '
		.properties +=
			[{"name":"apiUrl","type":"string","value":"https://play.aaaaaaaaaaaadventu.re"}]
		| (.layers[] | select(.properties != null and .properties[].name=="jitsiRoom") | .properties) +=
			[{"name":"jitsiUrl","type":"string","value":"meet.jit.si"}]
		| (.layers[].properties[]? | select(.name == "exitUrl" and (.value | startswith("world://")))| .name) |=
			"badExitUrl"
		' $f >$tmp
	mv $tmp $f
done
