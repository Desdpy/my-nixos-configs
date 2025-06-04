{ ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.WiredDesdpy = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel" # Enable ‘sudo’ for the user.
      "input" 
      "networkmanager" 
      "libvirtd" # Enable virtualisation for virt-manager
      "scanner" # For scanning documents
      "lp" # For printing documents
    ]; 
  };
}
