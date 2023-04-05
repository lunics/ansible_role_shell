#!/usr/bin/env bash

rsync -avzh ~/cloud/linux/share/nvim_sessions/*.vim ~/cloud/linux/share/nvim_sessions/backup

[ -f "$HOME/.config/tmux/plugins/tmux-resurrect/scripts/save.sh" ] \
  && sh $HOME/.config/tmux/plugins/tmux-resurrect/scripts/save.sh

systemctl list-units | grep k3s > /dev/null \
  && /usr/local/bin/k3s-killall.sh

veracrypt -t -d

/usr/bin/poweroff
