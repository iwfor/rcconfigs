imap <TAB> <C-R>=TabComplete()<CR>
function! TabComplete ()
    if col('.') == 1
	return "\<Tab>"
    end

    if strpart(getline('.'), col('.') - 2, 1) !~ '^[A-Za-z0-9_-]$'
	return "\<Tab>"
    else
	return "\<C-P>"
    end
endfunction

