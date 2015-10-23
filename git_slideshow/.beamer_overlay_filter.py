#!/usr/bin/env python

"""overlay_filter

Simplistic pandoc filter to include beamer overlay specifications on
inline tex in markdown

Whereas in normal beamer LaTeX you'd write

    \cmd<overlay>{...}

in markdown write

    \cmd{<overlay>}{...}

then process with

    pandoc --filter overlay_filter

Environments are passed through to LaTeX, so there's no need to filter
them; write onlyenv as normal, for example.

Requires pandocfilters (pip install pandocfilters).
"""

from pandocfilters import toJSONFilter, RawInline,RawBlock
import re
import sys


# ov_pat = re.compile(r'^(\\\w+)(\{<[0-9-+,]+>})({.*)$',flags=re.DOTALL)
# ov_pat = re.compile(r'^(\w+)(\{<[0-9-+,]+>\})({.*)$',flags=re.DOTALL)
ov_pat_begin = re.compile(r'(\\begin\{pass\}\n)')
ov_pat_end=re.compile(r'(\\end\{pass\})')
inline_pat=re.compile(r'\\pass\{(.*)\}')

def overlay_filter(key, value, fmt, meta):
    if key == 'RawBlock' and value[0]=="latex":
        sys.stderr.write("match " + str(value[1])+str(type(value[1])) + "\n")
        # sys.stderr.write()
        c = value[1]
        c = re.sub(ov_pat_begin,"",c)
        c = re.sub(ov_pat_end,"",c)
        return RawBlock("latex", c)
    elif key== 'RawInline' and value[0]=='tex':
        m = inline_pat.match(value[1])
        if m:
            c = m.group(1)
            return RawInline("tex", c)


if __name__ == "__main__":
    toJSONFilter(overlay_filter)
