#!/usr/bin/perl
use strict;
use warnings;
use Term::ANSIColor;

my ($title, $num, $normalize) = @ARGV;

# Validate input
if (!$title || !$num || $normalize !~ /^(y|n)$/i) {
    print color('bright_red'), "Usage: ", color('reset'), "$0 <filename> <number-of-files> <normalize[y/n]>\n";
    exit;
}

for (my $i = 1; $i <= $num; $i++) {
    my $file_name = "${title}_${i}.html";
    open my $html_fh, '>', $file_name or die color('bright_red'), "Can't open file: $!", color('reset');
    print $html_fh <<~END_HTML;
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>$title</title>
            <link rel="stylesheet" href="https://unpkg.com/normalize.css\@8.0.1/normalize.css">
        </head>
        <body>
            <h1>$title</h1>
        </body>
        </html>
    END_HTML
    close $html_fh;
    print color('bright_green'), "Created file: ", color('reset'), "$file_name\n";
}
