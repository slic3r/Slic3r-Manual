#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(first);

mkdir "html" if !-d "html";

# convert ToC
system qw(pandoc src/toc.md -f markdown -t html -o html/toc.html);

# convert index page
convert('src/index.md', 'html/index.html');

# convert manual pages
convert_dir("src/$_") for get_subdirs('src');

# copy images and stylesheet
system qw(cp -rf), "src/images", "html/";
system qw(cp html-inc/style.css html/);

sub convert {
    my ($md, $html) = @_;
    
    system 'pandoc', $md, qw(-f markdown -t html -o), $html,
        qw(--css style.css --title-prefix), 'Slic3r Manual',
        qw( --include-before-body=html-inc/header.html
            --include-before-body=html/toc.html
            --include-before-body=html-inc/before-body.html
            --include-after-body=html-inc/after-body.html);
}

sub convert_dir {
    my ($dir) = @_;
    
    foreach my $md (glob "html/*.md") {
        my $html = $md;
        $html =~ s/\.md/.html/;
        convert($md, $html);
    }
    
    convert_dir("$dir/$_") for get_subdirs($dir);
}

sub get_subdirs {
    my ($dir) = @_;
    
    my @dirs = ();
    opendir(my $dirh, $dir) or die "Failed to get listing for $dir";
    foreach my $subdir (readdir $dirh) {
        push @dirs, $subdir
            if -d "$dir/$subdir"
                && $subdir ne '.'
                && $subdir ne '..';
    }
    closedir $dirh;
    return @dirs;
}

__END__
