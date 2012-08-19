Strings
=======

A string manipulation library for GAP.

Licence
-------

GNU GENERAL PUBLIC LICENSE, Version 3

Installation
------------

GAP v4.5.5

To initialise the Strings Package, put the Strings folder in the pkg directory of your GAP 
root and in GAP type:

`gap> LoadPackage("Strings");`

Alternatively, you can download the source to any/folder/you/like/Strings and then run GAP with

`gap -l 'path/to/your/GAP4r5r5/bin/;any/folder/you/like/;'`

Quick Start
-----------

### strpos( haystack, needle, offset )

Returns the starting position of `needle` contained in `haystack`. Returns `-1` if the `needle` is not a substring of the `haystack`. 

### substr( str, start, length )

Returns a substring of `str` starting from `start` for `length` characters.


### str\_replace( find\_string, replace\_string, haystack )

Replaces all occurrences of some `find_string` with another `replace_string` in `haystack`.


### FindMatchingBracket( str, open, close )

Finds the closing bracket that matches the first occurrence of `open` in `str`.
