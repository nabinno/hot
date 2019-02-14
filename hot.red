Red []

CMD: first to-block system/script/args
HOTLIB-PATH: to-red-file rejoin [get-env either system/platform == 'Windows ["USERPROFILE"]["HOME"] %/.hot/]

foreach file read HOTLIB-PATH [
    do/args rejoin [HOTLIB-PATH file] system/options/path
]

help: does [
    foreach file read HOTLIB-PATH [
        c: replace to-string file ".red" ""
        foreach [f _] to-block do to-word c [
            print to-string rejoin [c "/" f]
        ]
    ]
]

do CMD
