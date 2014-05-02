#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(first);

mkdir "html" if !-d "html";

# convert Markdown to HTML
system qw(cp html-inc/index.md html/);
foreach my $md (glob "html/*.md") {
    next if $md eq 'html/toc.md';
    my $html = $md;
    $html =~ s/\.md/.html/;
    my $title = 'Slic3r Manual';
    if (my $page_title = first { "html/$_.md" eq $md } keys %page_titles) {
        $title .= ": $page_titles{$page_title}";
    }
    system 'pandoc', $md, qw(-f markdown -t html -o), $html,
        qw(--css style.css --title-prefix), $title,
        qw( --include-before-body=html-inc/header.html
            --include-before-body=html/toc.html
            --include-before-body=html-inc/before-body.html
            --include-after-body=html-inc/after-body.html);
}

# copy images and stylesheet
system qw(cp -rf), (glob "images-original/*"), "html/";
system qw(cp html-inc/style.css html/);

__END__
