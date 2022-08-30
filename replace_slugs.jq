.properties +=
	[{"name":"apiUrl","type":"string","value":"https://play.aaaaaaaaaaaadventu.re/pusher"}]
| (.layers[] | recurse(.layers[]?) | select(.properties != null and .properties[].name=="jitsiRoom") | .properties) +=
    [{"name":"jitsiUrl","type":"string","value":"meet.jit.si"}]
| (.layers[] | recurse(.layers[]?) | .properties[]? | select(.name=="exitUrl" and (.value | startswith("world://cccsbg/"))) | .value) |=
     ("/_/global/finga.github.io/rc3-cccsbg/" + (. | ltrimstr("world://cccsbg/")))
| (.layers[] | recurse(.layers[]?) | .properties[]? | select(.name=="exitUrl" and (.value | startswith("world://devlol/"))) | .value) |=
     ("/_/global/devlol-systems.pages.devlol.org/vspace-workadv/" + (. | ltrimstr("world://devlol/")))
| (.layers[] | recurse(.layers[]?) | .properties[]? | select(.name=="exitUrl" and (.value | startswith("world://grandgarage/"))) | .value) |=
     ("/_/global/grand-garage.github.io/gg-workadventure/" + (. | ltrimstr("world://grandgarage/")))
| (.layers[] | recurse(.layers[]?) | .properties[]? | select(.name=="exitUrl" and (.value | startswith("world://it-syndikat/"))) | .value) |=
     ("/_/global/git.it-syndikat.org/IT-Syndikat/rc3-its-assembly-2021/raw/branch/master/a12dventure/" + (. | ltrimstr("world://it-syndikat/")))
| (.layers[] | recurse(.layers[]?) | .properties[]? | select(.name=="exitUrl" and (.value | startswith("world://Metalab/"))) | .value) |=
     ("/_/global/metalab.github.io/maptest/" + (. | ltrimstr("world://Metalab/")))
| (.layers[] | recurse(.layers[]?) | .properties[]? | select(.name=="exitUrl" and (.value | startswith("world://realraum/"))) | .value) |=
     ("/_/global/realraum.github.io/workadventur3space/" + (. | ltrimstr("world://realraum/")))
| (.layers[] | recurse(.layers[]?) | .properties[]? | select(.name=="exitUrl" and (.value | startswith("world://steyr-werke/"))) | .value) |=
     ("/_/global/steyr-werke.gitlab.io/workadventure-stw/" + (. | ltrimstr("world://steyr-werke/")))
| (.layers[] | recurse(.layers[]?) | .properties[]? | select(.name=="exitUrl" and (.value | startswith("world://chaoszone/"))) | .value) |=
     ("/_/global/raw.githubusercontent.com/die3ungleichen/2D-Welt-thueringen/main/" + (. | ltrimstr("world://chaoszone/")))
