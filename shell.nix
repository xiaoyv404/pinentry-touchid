{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
      go
      gopls
      gotools

      # keep this line if you use bash
      pkgs.bashInteractive
    ];
}
