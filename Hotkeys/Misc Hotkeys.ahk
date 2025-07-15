^#r::Reload

!-::WinMinimize("A")
!=::WinMaximize("A")

;Swaps the [] and {} keys.
$SC01A::Send("+{SC01A}")
$SC01B::Send("+{SC01B}")
$+SC01A::Send("{SC01A}")
$+SC01B::Send("{SC01B}")

#Space::WinSetAlwaysOnTop(-1, "A")
