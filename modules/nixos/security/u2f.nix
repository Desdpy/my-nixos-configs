{ pkgs, lib, ... }:

  let
    # Needed to get path in nix store, because we can't use the modules directly
    pam_unix = "${pkgs.linux-pam}/lib/security/pam_unix.so";
    pam_u2f = "${pkgs.pam_u2f}/lib/security/pam_u2f.so";
  in {

    # Sudo possible with only Yubikey
    security.pam.services.sudo.text = pkgs.lib.mkDefault (pkgs.lib.mkBefore ''
      # Extra authentication management.
      auth sufficient ${pam_u2f} cue
    '');

    # Login needs password and Yubikey
    security.pam.services.login.text = pkgs.lib.mkDefault (pkgs.lib.mkBefore ''
      # Extra authentication management.
      auth required ${pam_unix}
      auth required ${pam_u2f} cue
    '');

    # KDE (KScreenLocker) needs password and Yubikey
    security.pam.services.kde.text = pkgs.lib.mkDefault (pkgs.lib.mkBefore ''
      # Extra authentication management.
      auth required ${pam_unix}
      auth required ${pam_u2f} cue
    '');
  }