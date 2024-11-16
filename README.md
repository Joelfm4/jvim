# Vim Shortcuts

## Buffer Manager
- **`<Leader>fb`**: Quick menu
- **`<Leader>fn`**: Navigate to the next buffer
- **`<Leader>fm`**: Navigate to the previous buffer

## Autocompletion
- **`<C-Space>`**: Complete
- **`<C-e>`**: Abort
- **`<CR>`**: Confirm

## LSP (Language Server Protocol)
- **`<K>`**: Show hover information
- **`<L>`**: Go to definition
- **`<Leader>ca`**: Code actions

## File Tree
- **`<Leader>e`**: Open file tree
- **`<Leader>q`**: Close file tree

## Undo Tree
- **`<Leader>p`**: Open undo tree

## Miscellaneous
- **`<Leader>gf`**: Auto-format

## Terminal
- **`<Leader>ft`**: Open terminal

## Harpoon
- **`<leader>hm`**: Adds the current file as a mark.
- **`<leader>hq`**: Opens the Harpoon quick menu to view and manage all marks.
- **`<leader>h1 to <leader>h4`**: Directly navigates to marks 1 through 4.
- **`<leader>hn and <leader>hp`**: Cycle through the marks (next and previous).


## Move Lines 
- **`<A-j>`**: Moves the current line one position down
- **`<A-k>`**: Moves the current line one position up 
- **`<A-h>`**: Moves the current character one position left 
- **`<A-l>`**: Moves the current character one position right


## Surround selections

- **`di"`**: Delete everything inside quotes (but not limited to) 

```help
    Old text                    Command         New text
--------------------------------------------------------------------------------
    surround_words             ysiw)           (surround_words)
    make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML tags</b>    dst             remove HTML tags
    'change quotes'            cs'"            "change quotes"
    <b>or tag types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(function calls)     dsf             function calls
```
