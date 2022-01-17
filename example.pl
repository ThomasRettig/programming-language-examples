#!/usr/local/bin/perl
# generate a boilerplate HTML file

if ($#ARGV != 1) {
    print "Valid arguments: <filename> <num-of-files>\n";
    print "Example usage: demo 2\n";
    exit;
}

$title = $ARGV[0];
$num = $ARGV[1];

for ($i=1; $i <= $num; $i++) {

    open(HTML, ">$title $i.html");

    if($i==$num) {
    $next = 1;
    } else {
    $next = $i+1;
    }

    print HTML "<html lang=\"en\">\n<head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n<title>$title</title>\n</head>\n<body>\n";
    print HTML "<h1>$title</h1>\n";
    print HTML "</body>\n</html>\n";

    close(HTML);
}
