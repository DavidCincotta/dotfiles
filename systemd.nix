
{ pkgs, ... }:
let
  file = {
    battery = "/etc/nixos/batterynotification.bash";
  };
in
{  
  systemd.services.battery-notification = {
    description = "pushes notifications when battery is low";
    after = [ "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.twmn pkgs.bash pkgs.ps pkgs.acpi];
    environment = {
      MY_SERVICE_HOME = "/home/david";
    };
    script = ''echo "start"; bash ${file.battery} 15 60;'';
    reload  = ''echo "reload"; bash ${file.battery} 15 60; kill $(ps -aux | grep -i batterynotification.bash | awk 'NR==1{print $2}');'';
    preStop  = ''echo "stop"; kill $(ps aux | grep -i batterynotification.bash | awk 'NR==1{print $2}'); '';
    #serviceConfig = {
    #  User = "david";
    #};
  };

}
  
