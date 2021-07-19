if !exists("g:quickrun_config")
  let g:quickrun_config = {
        \    "_" : {
        \       "runner" : "job",
        \   },
        \    'tex': {
        \    'command': 'platex',
        \    'exec': ['%c -output-directory %s:h %s', 'dvipdfmx -o %s:r.pdf %s:r.dvi', 'open %s:r.pdf']
        \   },
        \    'plantuml': {
        \    "command": "plantuml",
        \    "exec": ["%c %s", "open %s:r.png"],
        \}
        \}
endif
