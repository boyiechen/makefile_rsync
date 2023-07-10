# Define the path to your local folder and Dropbox folder
SRC_DIR = /cygdrive/c/Users/boyie/repo/makefile_rsync/src
DEST_DIR = /cygdrive/c/Users/boyie/repo/makefile_rsync/dest

# Define the path to your local folder and Dropbox folder
LOCAL_DIR = /cygdrive/c/Users/boyie/Dropbox/boyie_dropbox/testRsync
DROPBOX_DIR = /cygdrive/c/Users/boyie/repo/makefile_rsync/dest

init:
	@echo "Initializing the folders"
	mkdir dest

# the list of files to be synced
# FILEs_TO_SYNC = /cygdrive/c/Users/boyie/repo/diversity_disclosure/tex_file_list.txt
FILES_TO_SYNC = tex_to_sync.txt

# Default target to sync the folders
sync_tex_unix:
	@while read file; do \
		rsync -avu --update "$(SRC_DIR)/$$file" "$(DEST_DIR)/$$file"; \
	done < $(FILES_TO_SYNC)

sync_tex_win:
	for /F "delims=" %%f in ($(FILES_TO_SYNC)) do (\
		rsync -avu --update "$(SRC_DIR)/%%f" "$(DEST_DIR)/%%f"\
	)

sync_dropbox:
	rsync -avu --update "$(LOCAL_DIR)/" "$(DROPBOX_DIR)/"
	rsync -avu --update "$(DROPBOX_DIR)/" "$(LOCAL_DIR)/"

