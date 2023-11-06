{ pkgs, ... }:

{
  users.users.jonathan = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBSlnCzEq8KrEnCV0lisLzlO87/79lS5Ot4IjV4Oa2G3 deck@steamdeck"
    ];
    initialHashedPassword = "$y$j9T$RZ3Xvd417pxVsAOLbkKb91$WK10KAGV1B5/KRm6AewemibV/8rcZ3V7wGpUo1kvaK4";
    shell = pkgs.zsh;
  };
}
