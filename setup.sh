mkdir -p ~/.config/nvim
rsync --delete --archive --exclude lazyvim.json ./ ~/.config/nvim
