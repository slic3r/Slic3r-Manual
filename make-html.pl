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
        push @{ $chapter->{include} }, $_[0];
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

my $toc = <<"EOF";
<div id="manual-toc">

* [Introduction](Intro.html)
    * [Overview](Intro.html)
    * [Getting Support](Slic3rSupport.html)
* [Getting Slic3r](GettingSlic3r.html)
    * [Downloading](GettingSlic3r.html#downloading)
    * [Installing](GettingSlic3r.html#installing)
    * [Building from source](GettingSlic3r.html#building-from-source)
* [First Print](FirstPrint.html)
    * [Calibration](FirstPrint.html#calibration)
    * [Configuration Wizard](FirstPrint.html#configuration-wizard)
    * [The Important First Layer](FirstPrint.html#the-important-first-layer)
    * [Working with Models](FirstPrint.html#working-with-models)
    * [Printing](FirstPrint.html#printing)
* [Simple Mode](SimpleMode.html)
    * [Print Settings](SimpleMode.html#print-settings)
    * [Filament Settings](SimpleMode.html#filament-settings)
    * [Printer Settings](SimpleMode.html#printer-settings)
* Expert Mode
    * [Speed](Speed.html)
    * [Infill Patterns and Density](InfillPatternsAndDensity.html)
    * [Infill Optimization](InfillOptimization.html)
    * [Fighting Ooze](FightingOoze.html)
    * [Skirt](Skirt.html)
    * [Cooling](Cooling.html)
    * [Support Material](SupportMaterial.html)
    * [Multiple Extruders](MultipleExtruders.html)
    * [Extrusion Width](ExtrusionWidth.html)
    * [Variable Layer Height](VariableLayerHeight.html)
* [Configuration Organization](ConfigurationOrganization.html)
    * [Exporting and Importing Configuration](ConfigurationOrganization.html#exporting-and-importing-configuration)
    * [Managing Profiles](ConfigurationOrganization.html#profiles)
* [Repairing Models](RepairingModels.html)
* Advanced Topics
    * [Sequential Printing](SequentialPrinting.html)
    * [SVG Output](SVGOutput.html)
    * [Command Line Usage](CommandLineUsage.html)
    * [Post-Processing Scripts](PostProcessingScripts.html)
* [Troubleshooting](Troubleshooting.html)
    * [Z Wobble](Troubleshooting.html#z-wobble)
    
</div>
EOF

{
    open my $fh, ">", "html/toc.md";
    print $fh $toc;
    close $fh;
    system qw(pandoc html/toc.md -f markdown -t html -o html/toc.html);
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
{
    foreach my $line (split /\n/, $toc) {
        if ($line =~ /\[(.+?)\]\(([^#]+?)\)/) {
            my ($title, $file) = ($1, $2);
            $file =~ s/#.*//;
            $file =~ s/\.html$//;
            system qw(perl -pi -e), "print \"% $title\n\" if \$. == 1", "html/$file.md";
        }
    }
}

# convert Markdown to HTML
system qw(cp html-inc/index.md html/);
foreach my $md (glob "html/*.md") {
    next if $md eq 'html/toc.md';
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
