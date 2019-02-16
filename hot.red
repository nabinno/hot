Red []

CURRENT-CMD: to-block system/script/args
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
    fn-name-rule: charset [#"a" - #"z" #"-"]
    foreach [fn _] to-block do cmd [
        if parse to-string fn [some fn-name-rule] [
            print to-string rejoin ["cmd/" fn]
        ]
    ]
    foreach file read HOTLIB-PATH [
        ctx: replace to-string file ".red" ""
        foreach [fn _] to-block do to-word ctx [
            if parse to-string fn [some fn-name-rule] [
                print to-string rejoin [ctx "/" fn]
            ]
        ]
    ]
]

;
; Main
;
do CURRENT-CMD
