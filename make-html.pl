#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(first);

if (defined $ARGV[0] && $ARGV[0] eq '--server') {
    chdir 'html';
    system qw(python -m SimpleHTTPServer 8000);
    exit;
} elsif ($ARGV[0]) {
    die "Unknown option\n";
}

system qw(rm -rf html);
mkdir "html";

# convert ToC
system qw(pandoc src/toc.md -f markdown -t html -o html/toc.html);

# convert manual pages
convert_dir('src');

# copy images and stylesheet
system qw(cp html-inc/style.css html/);

sub convert {
    my ($md, $html) = @_;
    
    return if $md =~ /\/toc\.md$/;
    
    printf "Converting %s to %s\n", $md, $html;
    system 'pandoc', $md, qw(-f markdown -t html -o), $html,
        qw(--css /style.css --title-prefix), 'Slic3r Manual',
        qw( --include-before-body=html-inc/header.html
            --include-before-body=html/toc.html
            --include-before-body=html-inc/before-body.html
            --include-after-body=html-inc/after-body.html);
}

sub convert_dir {
    my ($dir) = @_;
    
    my $html_dir = $dir;
    $html_dir =~ s{^src(/|$)}{html$1};
    mkdir $html_dir;
    
    system qw(cp -r), "$dir/images", "$html_dir/"
        if -d "$dir/images";
    
    foreach my $md (glob "$dir/*.md") {
        my $html = $md;
        $html =~ s{^src/}{html/};
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
