function! GitCommit()
  let commit_msg = input('Enter commit message: ')
  execute '!git commit -m ' . shellescape(commit_msg)
endfunction
command! Gc call GitCommit()

function! GitPush()
  execute '!git push'
endfunction
command! Gp call GitPush()

function! GitCommitAndPush()
  call GitCommit()
  call GitPush()
endfunction
command! Gcp call GitCommitAndPush()
