" global
call lexima#add_rule({'char': '<', 'input': '<', 'input_after': '>'})
call lexima#add_rule({'char': '>', 'at': '\%#>', 'leave': 1})
call lexima#add_rule({'char': '<Space>', 'at': '<\%#>', 'input': '<Space>', 'input_after': '<Space>'})
call lexima#add_rule({'char': '<BS>',    'at': '<\%#>', 'delete': 1})
call lexima#add_rule({'char': '<BS>',    'at': '< \%# >', 'delete': 1})

" tex
call lexima#add_rule({'char': '$',       'input_after': '$', 'filetype': 'tex'})
call lexima#add_rule({'char': '$',       'at': '\%#\$', 'leave': 1, 'filetype': 'tex'})
call lexima#add_rule({'char': '<Space>', 'at': '\$\%#\$', 'input': '<Space>', 'input_after': '<Space>', 'filetype': 'tex'})
call lexima#add_rule({'char': '<BS>',    'at': '\$\%#\$', 'delete': 1, 'filetype': 'tex'})
call lexima#add_rule({'char': '<BS>',    'at': '\$ \%# \$', 'delete': 1, 'filetype': 'tex'})
call lexima#add_rule({'char': '$',    'at': '@\%#', 'input_after': '$@', 'filetype': 'tex'})

