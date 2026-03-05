let
  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO08PdZfjx63jCnOP4PAi62ussK4BhzCVNm0o2p67xKP";
  systems = [ desktop ];
in
{
  "email/personal/password.age".publicKeys = [ desktop ];
}