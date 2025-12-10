function! MyPythonIndent() abort
  let l:base = GetPythonIndent(v:lnum)
  let l:line = getline(v:lnum)

  " ==== 1) 閉じカッコ行の処理 ====
  if l:line =~# '^\s*[)\]}]'
    " 自分に対応する開きカッコの行を探す
    let l:ln = v:lnum - 1
    let l:open_paren = 0

    while l:ln > 0
      let l:text = getline(l:ln)
      let l:code = substitute(l:text, '"[^"]*"', '', 'g')
      let l:code = substitute(l:code, '#.*$', '', '')

      let l:opens  = len(substitute(l:code, '[^([{]', '', 'g'))
      let l:closes = len(substitute(l:code, '[^])}]', '', 'g'))
      let l:open_paren += l:opens - l:closes

      " まだ開きカッコが残っているところに到達したら、
      " その行のインデントに合わせる
      if l:open_paren > 0
        return indent(l:ln)
      endif

      if l:open_paren < 0
        break
      endif

      let l:ln -= 1
    endwhile

    " 見つからなければデフォルトにフォールバック
    return l:base
  endif

  " ==== 2) それ以外（括弧の中の行）の処理 ====
  let l:ln = v:lnum - 1
  let l:open_paren = 0

  while l:ln > 0
    let l:text = getline(l:ln)

    let l:code = substitute(l:text, '"[^"]*"', '', 'g')
    let l:code = substitute(l:code, '#.*$', '', '')

    let l:opens  = len(substitute(l:code, '[^([{]', '', 'g'))
    let l:closes = len(substitute(l:code, '[^])}]', '', 'g'))
    let l:open_paren += l:opens - l:closes

    if l:open_paren > 0
      return indent(l:ln) + &shiftwidth
    endif

    if l:open_paren < 0
      break
    endif

    let l:ln -= 1
  endwhile

  " ==== 3) 括弧の外なら標準に任せる ====
  return l:base
endfunction

setlocal indentexpr=MyPythonIndent()

