" Vim syntax file
" Language:	jlj Post file
" Maintainer:	Marc Hartstein <marc.hartstein@alum.vassar.edu>
" Last Change:	2009-04-14

" I like to use Markdown with Format: external; set this to "mkd"
" If you prefer raw HTML (Format: preformatted), and don't want the extra
"   highlighting for Markdown, change this to "html"
" If you prefer to use LJ's formatter (Format: none), or Jerry's Wiki-style
"   formatting (Format: jerry), highlighting for the body will probably be
"   weird.  Patches for either of these modes which don't break the existing
"   functionality would be gladly accepted.
" If you use a different external formatter, include its syntax instead below.
let s:body_format = "html"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Include formatting in the Body
if s:body_format == "mkd"
    syntax include @BODY syntax/mkd.vim
elseif s:body_format == "html"
    syntax include @BODY syntax/html.vim
endif

" Only spellcheck in appropriate regions
syn spell notoplevel

" Header
syn region jljHeader    start=/\%^/     end=/^$/       skipwhite skipnl skipempty 

syn match jljDivider    /^--- Edit your event text below this line.  Do not edit this line. ---$/   nextgroup=jljBody   skipwhite skipnl skipempty 

" Body: Spellcheck in here, also treat as Markdown
syn region jljBody      start=/^/         end=/\%$/   contains=@Spell,@BODY contained

" Contents of the JLJ Header section
syn match jljKey    /^[^:]\+\ze:/   contained   containedin=jljHeader
syn keyword jljKeyword  contained containedin=jljHeader default external jerry preformatted none everyone private friends yes no
syn match jljComment    /(.*)/  contained containedin=jljHeader

" Add some special 'html' tags and args for the lj extensions
syn match htmlTagName contained /lj\%(-cut\|-poll\|-pq\|-pi\|-raw\)\?/
syn keyword htmlArg   contained user

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_jlj_syntax_inits")
  if version < 508
    let did_jlj_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink jljDivider     Delimiter

  HiLink jljKey         Type
  HiLink jljKeyword     Keyword
  HiLink jljComment     Comment

  delcommand HiLink
endif

let b:current_syntax = "jlj"

" vim: ts=8
