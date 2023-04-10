

if 0 
	echom "if" 
elseif "nope!"
	echom "elseif"
else
	echom "finally!"
endif

if 10 > 1
	echom "foo"
endif 

if 10 > 2001
	echom "bar"
endif

if 10 == 11
	echom "first"
elseif 10 == 10
	echom "second" 
endif 

if "foo" == "bar" 
	echom "one" 
elseif "foo" == "foo"
	echom "two"
endif

set noignorecase
if "foo" == "FOO"
	echom "vim is case insensitive"
elseif "foo" == "foo"
	echom "vim is case sensitive" 
endif

" set ignorecase
" if "foo" == "FOO"
" 	echom "no, it couldnt be" 
" elseif "foo" == "foo"
" 	echom "this must be the one" 
" endif 

function Meow() 
	echom "Meow!"
endfunction 

call Meow() 

function GetMeow()
	return "Meow string!"
endfunction 

echom GetMeow() 

echom Meow()









 
