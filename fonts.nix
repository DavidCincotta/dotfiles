{ config, lib, pkgs, ... }:
{
  fonts = {
    enableDefaultFonts = true;
    fonts = [
      pkgs.nerdfonts
    ];
    fontconfig = {
      localConf = ''
  <?xml version='1.0'?>
  <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
  <fontconfig>

  <!-- Default font (no fc-match pattern) -->
   <match>
    <edit mode="prepend" name="family">
     <string>Fixed</string>
    </edit>
   </match>

  <!-- Default sans-serif font -->
   <match target="pattern">
     <test qual="any" name="family"><string>sans-serif</string></test>
     <!--<test qual="any" name="lang"><string>ja</string></test>-->
     <edit name="family" mode="prepend" binding="same"><string>Fixed</string>  </edit>
   </match>
   
  <!-- Default serif fonts -->
   <match target="pattern">
     <test qual="any" name="family"><string>serif</string></test>
     <edit name="family" mode="prepend" binding="same"><string>Fixed</string>  </edit>
   </match>

  <!-- Default monospace fonts -->
   <match target="pattern">
     <test qual="any" name="family"><string>monospace</string></test>
     <edit name="family" mode="prepend" binding="same"><string>Fixed</string></edit>
   </match>

  <!-- Fallback fonts preference order -->
   <alias>
    <family>sans-serif</family>
    <prefer>
     <family>Fixed</family>
    </prefer>
   </alias>
   <alias>
    <family>serif</family>
    <prefer>
     <family>Fixed</family>
    </prefer>
   </alias>
   <alias>
    <family>monospace</family>
    <prefer>
     <family>Fixed</family>
    </prefer>
   </alias>

  </fontconfig>
      '';
    };
  };
}

