return {
    s('&', fmt('[[ {} ]] && {}', { i(1), i(2) })),
    s('|', fmt('[[ {} ]] || {}', { i(1), i(2) })),
    s('if', fmt('if [[ {} ]]; then\n\t{}\nfi', { i(1), i(2) })),
}
