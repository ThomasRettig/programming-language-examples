#!/usr/local/bin/perl
# generate a boilerplate HTML file
# comes with normalize.css

use warnings;

# usage options
if ($#ARGV != 1) {
    print "Options:\n";
    print "<filename>: The name of the HTML file to generate.\n";
    print "<number-of-files>: The number of HTML files to generate\n";
    print "<normalize>: Choose if you would like to inlcude a CSS reset inside the HTML file\n";
    print "Example usage to create 2 files called \"demo\":";
    print "demo 2\n";
    exit;
}

$title = $ARGV[0];
$num = $ARGV[1];

for ($i=1; $i <= $num; $i++) {

    open(HTML, ">$title $i.html");

    # prevent the files from overwriting each other by giving them an increasing number
    if($i==$num) {
    $next = 1;
    } else {
    $next = $i+1;
    }
    
    # write the boilerplate HTML to the newly created file
    print HTML "<html lang=\"en\">\n<head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n<title>$title</title><link rel=\"stylesheet\" type=\"text/css\" href=\"https://unpkg.com/normalize.css\@8.0.1/normalize.css\">\n</head>\n<body>\n";
    print HTML "<h1>$title</h1>\n";
    print HTML "</body>\n</html>\n";

    close(HTML);
}