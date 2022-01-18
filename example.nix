let
  myattrset = { a = 1; b = 2; };
in
  with myattrset; "In this string we have access to ${toString a} and ${toString b}"