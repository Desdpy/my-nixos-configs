{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    trezor-suite
    monero-gui
    monero-cli
  ];

  # Enable trezord
  services.trezord.enable = true;
}