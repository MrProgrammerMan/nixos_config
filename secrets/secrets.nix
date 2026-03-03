let
  desktop = "";
  laptop = "";
  systems = [ laptop desktop ];
in
{
  "secret1.age".publicKeys = systems;
  "armored-secret.age" = {
    publicKeys = [ user1 ];
    armor = true;
  };
}