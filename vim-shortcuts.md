# Vim Shortcuts and Tips
A great place to learn the basics of vim is by typing 'vimtutor' in the command line
## The c operator
c is a change operator (essentially delete text and open insert mode)
* ce - Change text until end of word
  * lubw (type ce with cursor on u, then ine).

## The r operator
* r - replace one character
* R - replace more than one character (typing a new character for each one)

## o command
* O opens a line above
* o opens a new line below

## G (Cursor location and file status)
* Ctrl + g - Show your location in the file and the file status.
* G - move to a line in the file

## Searching
* To search for a phrase in the backward direction, use ? instead of /
* To go back to where you came from press  CTRL-O  (Keep Ctrl down while pressing the letter o).  Repeat to go back further.  CTRL-I goes forward.
* :set ic - ignore case for searches
  * Can also use \c at the end of the search to ignore case

### Matching Parenthesis Search
* Type  %  to find a matching ),], or }  

## Replacing
* :s/thee/the/g . Adding the g flag means to substitute globally in the line
* To change every occurrence of a character string between two lines,
  * Type   :#,#s/old/new/g    where #,# are the line numbers of the range of lines where the substitution is to be done.
  * Type   :%s/old/new/g      to change every occurrence in the whole file.
  * Type   :%s/old/new/gc     to find every occurrence in the whole file, with a prompt whether to substitute or not.

# Command Line

## Auto Complete
* Ctrl-d shows list of matching commands, pres tab to start auto completing
## Execute external command
* :!<COMMAND>

## Writing Files
* :w [Filename] - Write to file, filename is optional and will write to that file name
* select test then type : ('<,'> will appear) then w [Filename] to write selected text to a file

## Retrieving and Merging Files
* :r FILENAME - Insert the contents of FILENAME at cursor
  * :r !<command> will inert the output of a command-line command

## Map and remap
	
From [Stack Overflow](https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping)
remap is an option that makes mappings work recursively. By default it is on and I'd recommend you leave it that way. The rest are mapping commands, described below:

:map and :noremap are recursive and non-recursive versions of the various mapping commands. What that means is that if you do:

:map j gg
:map Q j
:noremap W j
j will be mapped to gg. Q will also be mapped to gg, because j will be expanded for the recursive mapping. W will be mapped to j (and not to gg) because j will not be expanded for the non-recursive mapping.

Now remember that Vim is a modal editor. It has a normal mode, visual mode and other modes.

For each of these sets of mappings, there is a mapping that works in normal, visual, select and operator modes (:map and :noremap), one that works in normal mode (:nmap and :nnoremap), one in visual mode (:vmap and :vnoremap) and so on.

For more guidance on this, see:

:help :map
:help :noremap
:help recursive_mapping
:help :map-modes



