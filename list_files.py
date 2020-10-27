"""List Markdown files included in `toc.md`."""
import re


TOC_FILE_NAME = 'toc.md'


def list_md_files():
    with open(TOC_FILE_NAME, 'r') as f:
        md = f.readlines()
    files = set()
    for line in md:
        if not line.startswith('    *'):
            continue
        s = line.split('(')[1].split(')')[0].split('#')[0]
        assert s.startswith('/'), s
        s = s[1:]
        if s in files:
            continue
        if s.startswith('libslic3r-doc'):
            continue
        files.add(s)
        print(s)


if __name__ == '__main__':
    list_md_files()
