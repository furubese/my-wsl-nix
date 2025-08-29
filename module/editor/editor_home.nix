{ config, pkgs,  ...}:

{
  #home.packages = with pkgs; [
    #pkgs.zed-editor
  #];
  
  # Zsh Aliases
  programs.zsh.shellAliases = {
    code = "/mnt/c/user/vscode/Microsoft\\ VS\\ Code/Code.exe";
  };
}
