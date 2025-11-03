{ pkgs, ... }: {

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-vscode-remote.remote-wsl
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
      bbenoist.nix
      ms-vscode-remote.remote-ssh-edit
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
  };
}
