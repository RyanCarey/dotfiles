" Vim syntax file
" Language: Caffe files
" Credits:  
" modified from python.vim by Neil Schemenauer

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
let s:cpo_save = &cpo
set cpo&vim

  " numbers
syn match   number  "\<0[oO]\=\o\+[Ll]\=\>"
syn match   number  "\<0[xX]\x\+[Ll]\=\>"
syn match   number  "\<0[bB][01]\+[Ll]\=\>"
syn match   number  "\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match   number  "\<\d\+[jJ]\>"
syn match   number  "\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match   number  "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match   number  "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
syn match   number  "MAX"
syn match   number  "LMDB"
syn match   number  "true"
syn match   number  "false"
syn match   number  "TEST"
syn match   number  "TRAIN"
syn match   number  "CPU"
syn match   number  "GPU"
 
syn match   braces  "[{}]"
syn match   comment "#.*$"

syn keyword attribute   name type layer top layer bottom input_dim
syn keyword attribute pooling_param pool kernel_size stride lrn_param
syn keyword attribute local_size alpha beta num_output pad
syn keyword attribute convolution_param group inner_product_param
syn keyword attribute input dropout_param dropout_ratio
syn keyword attribute include phase transform_param mirror
syn keyword attribute crop_size mean_file data_param source
syn keyword attribute batch_size backend include lr_mult
syn keyword attribute decay_mult mean_value param weight_filler
syn keyword attribute std bias_filler value net test_iter test_interval
syn keyword attribute base_lr lr_policy gamma stepsize display max_iter
syn keyword attribute momentum weight_decay snapshot snapshot_prefix
syn keyword attribute solver_mode

syntax region string start=/\v"/ skip=/\v\\./ end=/\v"/

if version <= 508
  let did_python_syn_inits = 1
  command -nargs=+ HiLink hi link <args>
else
  command -nargs=+ HiLink hi def link <args>
endif

" The default highlight links.  Can be overridden later.
hi def link comment     Comment
hi def link attribute   Statement
hi def link number      Number
hi def link braces  Function
hi def link string String

let b:current_syntax = "caffe"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=2 noet:
