{ ... }: {

  swapDevices = [ {
    device = "/.swapvol/swapfile";
    size = 16*1024;
  } ];
}