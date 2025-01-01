^#r::Reload

SC29::Send("!{Tab}")
^SC29::Send("{SC29}")

!-::WinMinimize("A")
!=::WinMaximize("A")

;Swaps the [] and {} keys.
$SC01A::Send("+{SC01A}")
$SC01B::Send("+{SC01B}")
$+SC01A::Send("{SC01A}")
$+SC01B::Send("{SC01B}")


