#!/usr/bin/perl

use strict;
use warnings;

if (!-d "html") {
    die "This script must be run from the Slic3r-Manual directory\n";
}

# read chapters
my @chapters = ();
{
    open my $fh, "<", "Slic3r-Manual.tex";
    while (<$fh>) {
        if (m[\\chapter{\\emph{(.+?)}}]) {
            push @chapters, { title => $1, include => [], sections => [] };
            $chapters[-1]{title} =~ s/\\//g;
        }
        if (m[\\include{(.+?)}] && @chapters) {
            push @{ $chapters[-1]{include} }, $1
                unless $1 =~ /Colophon/;
        }
    }
    close $fh;
}

# read sections
foreach my $chapter (@chapters) {
    my $include;
    $include = sub {
        open my $fh, "<", "$_[0].tex";
        while (<$fh>) {
            if (m[\\section{(.+?)}]) {
                push @{ $chapter->{sections} }, $1;
                $chapter->{sections}[-1] =~ s/\\//g;
            }
            if (m[\\input{(.+?)}]) {
                $include->($1);
            }
        }
        close $fh;
    };
    $include->($_) for map $_, @{ $chapter->{include} };
}

# write ToC
my %page_titles = ();
{
    open my $fh, ">", "html/toc.html";
    print $fh qq{<div id="manual-toc">\n};
    print $fh qq{<ul>\n};
    foreach my $chapter (@chapters) {
        $page_titles{$chapter->{include}[0]} = $chapter->{title};
        print $fh qq{<li>\n};
        printf $fh qq{<a href="%s.html">%s</a>\n}, $chapter->{include}[0], $chapter->{title};
        print $fh qq{<ul>\n};
        foreach my $section (@{ $chapter->{sections} }) {
            my $anchor = lc $section;
            $anchor =~ s/ /-/g;
            $anchor =~ s/[^a-z0-9-]//g;
            $anchor =~ s/--+/-/g;
            printf $fh qq{<li><a href="%s.html#%s">%s</a></li>\n}, $chapter->{include}[0], $anchor, $section;
        }
        print $fh qq{</ul>\n};
        print $fh qq{</li>\n};
    }
    print $fh qq{</ul>\n};
    print $fh qq{</div>\n};
    close $fh;
}

# convert LaTeX to Markdown
foreach my $tex (glob "*.tex") {
    my $md = $tex;
    $md =~ s/\.tex/.md/;
    system 'pandoc', $tex, qw(-f latex -t markdown -o), "html/$md";
}

# remove extra things ported from LaTeX
system qw(perl -pi -e s/\[(?:sec|sub|fig|par):.+?\]//), glob "html/*.md";
system qw(perl -pi -e s/\[H\]//), glob "html/*.md";

# add page titles
foreach my $page (sort keys %page_titles) {
    my $title = $page_titles{$page};
    system qw(perl -pi -e), "print \"% $title\n\" if \$. == 1", "html/$page.md";
}

# convert Markdown to HTML
system qw(cp html-inc/index.md html/);
foreach my $md (glob "html/*.md") {
    my $html = $md;
    $html =~ s/\.md/.html/;
    system 'pandoc', $md, qw(-f markdown -t html -o), $html,
        qw(--css style.css --title-prefix), 'Slic3r Manual',
        qw( --include-before-body=html-inc/header.html
            --include-before-body=html/toc.html
            --include-before-body=html-inc/before-body.html
            --include-after-body=html-inc/after-body.html);
}

# copy images and stylesheet
system qw(cp -rf), (glob "images-original/*"), "html/";
system qw(cp html-inc/style.css html/);

__END__
