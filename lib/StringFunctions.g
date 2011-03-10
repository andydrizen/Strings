################################################################################
# Strings/lib/StringFunctions.g                                 Andy L. Drizen
#                                                                   26/02/2011
# File overview:
#
# strpos - finds the position of a string in a string
#
# substr - returns a sub string of a string
#
# str_replace - replaces all occurrences of some string with another string
#
# FindMatchingBracket - finds the bracket that matches the first occurrence 
#						of open in the string
#
################################################################################

strpos:=function( haystack, needle, offset )
	
	# offset is the number of characters to skip from 
	# the beginning of the haystack
	
	local h,n,k, sh, sn;
	sh:=Size(haystack);
	sn:=Size(needle);
	for h in [1+offset..sh - sn+1] do
		k:=0;
		for n in [1..sn] do
			if needle[n] = haystack[h+n-1] then
				k:=k+1;
			fi;
		od;
		if k = sn then
			return h;
		fi;
	od;
	return -1;
end;

substr:=function( str, start, length )
	local result, i,s;
	result:="";
	s:=Size(str);
	for i in [start..Minimum(start+length-1, s)] do
		Add(result, str[i]);
	od;
	return result;
end;

str_replace:=function(find_string, replace_string, haystack)
	local i, q;
	q:=strpos(haystack, find_string, 0);
	while q>-1 do
		for i in [1..Size(find_string)] do
			Remove(haystack, q);
		od;
		for i in [1..Size(replace_string)] do
			Add(haystack, replace_string[i], q+i-1);
		od;
		q:=strpos(haystack, find_string, q+Size(replace_string)-1);
	od;
	return haystack;
end;

FindMatchingBracket:=function ( str, open, close )
	local offset,o,c;
	offset:=1;
	while offset < Size(str) do
		o:=strpos( str, [open], offset);
		c:=strpos( str, [close], offset);
		if 	o =-1 or c < o then
			return c;
		else
			offset:=o-1 + FindMatchingBracket(substr(str,o, Size(str)), open, close );
		fi;
	od;
	return 0;
end;