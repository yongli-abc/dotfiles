#!/bin/bash
echo "Installing dot files..."

DEFAULT_INSTALL_PATH="${HOME}/"
# DEFAULT_INSTALL_PATH="./tmp/" # for testing purpose
echo "Default install path:${DEFAULT_INSTALL_PATH}"

INSTALL_TARGETS=(".bash_profile" ".bashrc" ".gitconfig" ".tmux.conf" ".zshrc")
echo "Install targets are:${INSTALL_TARGETS[*]}"

backup_created=0
backup_suffix=`date +%Y%m%d_%H%M%S`
backup_dir_path="${DEFAULT_INSTALL_PATH}"".dotfiles.bk.${backup_suffix}"

echo "backup_dir_path=${backup_dir_path}" 
mkdir "${backup_dir_path}"

printf "\n"

# Iterate each target
for target in "${INSTALL_TARGETS[@]}"; do
	echo "Intalling target: ${target_path}"

	source_path="${PWD}/${target}"
	echo "Source path:${source_path}"

	target_path="${DEFAULT_INSTALL_PATH}${target}"
	echo "Target path:${target_path}"

	if [[ -f "${target_path}" ]]; then
		mv "${target_path}" "${backup_dir_path}"
		echo "Moved existing ${target} to ${backup_dir_path}"
		backup_created=1
	fi

	ln -s "${source_path}" "${target_path}" 

	printf "\n"
done

if [[ "${backup_created}" == 0 ]]; then
	rmdir "${backup_dir_path}"
fi