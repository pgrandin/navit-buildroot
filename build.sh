#!/bin/bash
# (C) 2016, "Yann E. MORIN" <yann.morin.1998 at free.fr>
# License: WTFPL, https://spdx.org/licenses/WTFPL.html

main() {
    local ret start d h m mf fs

    if ! which unbuffer >/dev/null 2>&1; then
        printf "you need to install 'unbuffer' (from package expect or expect-dev)\n" >&2
        exit 1
    fi

    start=${SECONDS}

    ( exec 2>&1; unbuffer make "${@}"; ) \
    > >( while read line; do
             printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
         done \
         |tee -a br.log \
         |grep --colour=never -E '>>>'
       )
    ret=${?}

    d=$((SECONDS-start))
    printf "Done in "
    h=$((d/3600))
    d=$((d%3600))
    [ ${h} -eq 0 ] || { printf "%dh " ${h}; mf="02"; }
    m=$((d/60))
    d=$((d%60))
    [ ${m} -eq 0 ] || { printf "%${mf}dmin " ${m}; sf="02"; }
    printf "%${sf}ds\n" ${d}

    return ${ret}
}

main "${@}"

