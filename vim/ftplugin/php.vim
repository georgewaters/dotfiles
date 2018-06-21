" Neomake
let g:neomake_open_list=2
let g:neomake_php_enabled_makers = ['php', 'phpmd', 'phpcs', 'phpstan']

" automatically call on write
call neomake#configure#automake('nrw')
