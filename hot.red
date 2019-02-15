Red []

CURRENT_CMD: to-block system/script/args
HOTLIB-PATH: to-red-file rejoin [get-env either system/platform == 'Windows ["USERPROFILE"]["HOME"] %/.hot/]

foreach file read HOTLIB-PATH [
    do/args rejoin [HOTLIB-PATH file] system/options/path
]

;
; Commands
;
cmd: context [
    install: func [url [url!]][
        file: last split-path url
        write rejoin [HOTLIB-PATH file] read url
    ]

    uninstall: func ['cmd-context [word!]][
       delete to-red-file rejoin [HOTLIB-PATH cmd-context ".red"]
    ]
]

help: does [
    foreach [f _] to-block do cmd [
        print to-string rejoin ["cmd/" f]
    ]
    foreach file read HOTLIB-PATH [
        c: replace to-string file ".red" ""
        foreach [f _] to-block do to-word c [
            print to-string rejoin [c "/" f]
        ]
    ]
]

;
; Main
;
do CURRENT_CMD
