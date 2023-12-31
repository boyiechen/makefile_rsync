# Using rsync in makefile under Windows

## Use cases
This repo is a minimal usecase to show how makefile can help syncing files. Two use cases are:
1. Syncing files from local to dropbox and vise versa (do not ask why I need this... I luv research)
2. Syncing files from a source folder to the destination folder.

The second use case is particularly helpful when the latex tables or figures managed by git under your main project folder are generated by codes (either R or Python), and you need to sync them to your overleaf local git repo.

To be more specific, let's say there are two folder and they are distinct git-managed repos: `project` and `project_latex`.
The former one is your main project folder that stores the codes for running analysis. Inside the folder, there is a `results` folder to store the `.tex`/`.pdf` files that render tables or figures you need to put into overleaf later on.
The later one is your overleaf project folder that is synced with git (one of overleaf's feature). So to update the tables and figures in overleaf, you need to sync `.tex` files from `project/results/*.tex` to `project_latex/tables_figures/`, and then commit and push.

Instead of copy/paste, the makefile helps sync the files automatically.

## Commands

- `make init`: to create a destination folder
- `make sync_dropbox`: sync files between local files and remote files
- `make sync_tex_win`: sync tex files in project folders to overleaf latex folder.

Note that you can manually set what files need to be synced by editing `tex_to_sync.txt`
