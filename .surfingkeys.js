// {{{ Mappings
// {{{ Unbind
api.unmap('<Ctrl-h>');
api.unmap('<Ctrl-j>');
// }}}
// {{{ Rebind
api.removeSearchAlias('s'); api.addSearchAlias('S', 'stackoverflow', 'http://stackoverflow.com/search?q=');
// }}}
api.map('J', 'd');
api.map('K', 'e');

api.map('H', 'S');
api.map('L', 'D');
// }}}

settings.startToShowEmoji = 3;

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #ffb6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult>ul>li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult>ul>li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
// click `Save` button to make above settings to take effect.
