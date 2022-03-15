#
#    ooooo      ooo  o8o                .oooooo.    .oooooo..o 
#    `888b.     `8'  `"'               d8P'  `Y8b  d8P'    `Y8 
#     8 `88b.    8  oooo  oooo    ooo 888      888 Y88bo.      
#     8   `88b.  8  `888   `88b..8P'  888      888  `"Y8888o.  
#     8     `88b.8   888     Y888'    888      888      `"Y88b 
#     8       `888   888   .o8"'88b   `88b    d88' oo     .d8P 
#    o8o        `8  o888o o88'   888o  `Y8bood8P'  8""88888P'  
#                                                              
#                                                              
#                                                              
# main config file
{ config, lib, pkgs, ... }:
let
  dotfiles = {
    alacritty_config = "/etc/nixos/dotfiles/alacrittyconfig.dotfile";
    i3_config = "/etc/nixos/dotfiles/i3config.dotfile";
    gitconfig = builtins.readFile /etc/nixos/secrets/gitconfig;
  };
  my-python-packages = python-packages: with python-packages; [
    pandas
    requests
    lxml
    selenium
    psutil
    ansible
    dbus-python
    ijson
    async-timeout

    aiohttp-cors yarl aiohttp multidict setuptools
    jinja2 psutil zipstream sentry-sdk jsonschema distro async_generator aiofiles
    prompt-toolkit py-cpuinfo

  ]; 
  python-with-my-packages = pkgs.python3.withPackages my-python-packages;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
#      ./nixfiles/coregui.nix
#      ./nixfiles/corecli.nix
#      ./nixfiles/service.nix
#      ./nixfiles/vim.nix
#      ./nixfiles/networking.nix
    ];
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
  sound.enable = true;
  sound.mediaKeys.enable=true;
  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
    };
    bluetooth.enable = true;
  };
  time.timeZone = "America/New_York";
  location = {
    #https://www.latlong.net/
    latitude = 42.319519;
    longitude = -72.629761;
  };
  powerManagement = {
    enable = true;
    powerDownCommands = "poweroff;";
  };
  users = {
    mutableUsers = true;
    users = {
      david = {
        isNormalUser = true;
        password = "";
        extraGroups = ["wheel" "networkmanager" "pulse" "audio" "sound"];
      };
    };
    extraGroups.vboxusers.members=["david"];
    extraUsers.david.shell = pkgs.fish;
    };
  security.sudo.wheelNeedsPassword = false;
  virtualisation.virtualbox.host.enable = true;
  system.stateVersion = "22.05";


  programs = {
    java.enable=true;
    steam.enable=true;
    light.enable=true;
    fish = {
      enable = true;
      interactiveShellInit = ''
        alias gs="git status";
        alias ga="git add";
        alias gm="git commit -m ";
        alias gp="git push";
        alias e="vim -n";
        alias s="sudo";
        alias se="sudo vim -n";
        alias l="lsd -liAS --total-size --group-dirs last";
        alias ls="lsd";
        alias g="grep -P";
        alias ontouchpad="xinput enable 11";
	alias offtouchpad="xinput disable 11";
        alias rebuild="sudo nixos-rebuild switch";
        alias ctrlc="xclip -selection c";
        alias ctrlv="xclip -selection c -o";
	alias gpom="git push -u origin master";
	alias gs="git status";
	alias f="fish";
        alias sf="sudo fish";
        alias lynx="lynx -cfg=/etc/nixos/dotfiles/lynx.cfg";
        alias figlet="figlet -d /home/david/Documents/asciiart/figlet-fonts/";
        alias m="more";
        #xinput disable 12;
        #xinput disable 11;
        '';
       
    };
    chromium = {
      enable = true;
      extensions = [
        "dbepggeogbaibhgnhhndojpepiihcmeb"    # 01  Vimium
        "cjpalhdlnbpafiamejdnhcphjbkeiagm"    # 02  uBlock Origin
        "aghfnjkcakhmadgdomlmlhhaocbkloab"    # 03  Just Black theme, makes top bar black
        "dmghijelimhndkbmpgbldicpogfkceaj"    # 04  Dark Mode
        "khpcanbeojalbkpgpmjpdkjnkfcgfkhb"    # 05  Chromium smooth scroll
        "icpgjfneehieebagbmdbhnlpiopdcmna"    # 06  New Tab Redirect
        #"inomeogfingihgjfjlpeplalcfajhgai"    # 07  ChromeRemoteDesktop
        "lpcaedmchfhocbbapmcbpinfpgnhiddi"    # 08  Google Keep, I use it as a synced reminder app
        "bmnlcjabgnpnenekpadlanbbkooimhnj"    # 09  Honey, it is good to see price changes on amazon
        "cmedhionkhpnakcndndgjdbohmhepckk"    # 10  Addblock for Youtube, double duty on the youtube adds usually works.
        "hpbmedimnlknflpbgfbllklgelbnelef"    # 11  Time tags youtube Really good for sharing information through video
        "noondiphcddnnabmjcihcjfbhfklnnep"    # 12  password alert. Protect your google password
        #"aapbdbdomjkkjkaonfhkkikfgjllcleb"    # 13  Google translate. Expand your knowledge by seeing more of the interneti
        "nnckehldicaciogcbchegobnafnjkcne"    # 14  Google Tone. Very cool extension that I want to see used.
        "gmbmikajjgmnabiglmofipeabaddhgne"    # 15  Save to Google Drive. I have a Google 1 subscription, 1$/month. Use the space.
        #"efinmbicabejjhjafeidhfbojhnfiepj"    # 16  Report Webspam with this extension by google
        #"iodihamcpbpeioajjeobimgagajmlibd"    # 17  Online Shell
        "pbcodcjpfjdpcineamnnmbkkmkdpajjg"    # 18  Text linking, similar to saving to google keep.
        #"fllaojicojecljbmefodhfapmkghcbnh"    # 19  Google Analytics Opt-out
        #"gbiekjoijknlhijdjbaadobpkdhmoebb"    # 20  Personalized Adds Opt-out
        #"onjcfgnjjbnflacfbnjaapcbiecckilk"    # 21  midful break. It is important to not looks at the screen for too many hours in a row. Think positive thoughts
        "pjnfggphgdjblhfjaphkjhfpiiekbbej"    # 22  similar pages. Discover new pages with just one click.
        #"gbkeegbaiigmenfmjfclcdgdpimamgkj"    # 23  Offline Editting for important G.Docs & Excel 
        #"ngcfglcfnghkmiihacggclkdcijilhnh"    # 24  Save research notes / pages to an extension.
        "pgjjikdiikihdfpoppgaidccahalehjh"    # 25  Speed Test
        "chphlpgkkbolifaimnlloiipkdnihall"    # 26  OneTab. Reduce RAM Usage by up to 95%
        "kjfmedbganalpkohkeghhpppicoigdal"    # 27  iorad, tutorial builder, records input actions to be shared
        "dhdgffkkebhmkfjojejmpbldmpobfkfo"    # 28  TamperMonkey, Create your own automation scripts for websites
        "pmnhcgfcafcnkbengdcanjablaabjplo"    # 29  Clearbit Connect, find peoples emails within gmail
        "peoapnglceoafojobbkpohnojniabmkd"    # 30  Minimal Reading Mode
        "ihbdojmggkmjbhfflnchljfkgdhokffj"    # 31  Reedy. Try out this extension to see if you can read faster.
        "mgijmajocgfcbeboacabfgobmjgjcoja"    # 32  Dictionary By Google, learn new words
        "kgjfgplpablkjnlkjmjdecgdpfankdle"    # 33  Zoom. Schedule zoom meetings in google calendar
        "mgacnbmocekcfjbdfpdnbnjfhaomffhk"    # 34  history search. Easily search history and exclude certain pages (social media, porn)
        "mihcahmgecmbnbcchbopgniflfhgnkff"    # 35  Google Mail Checker. See how many new emails are in your inbox.
        #"jknemblkbdhdcpllfgbfekkdciegfboi"   # 36  Suspicious Site Reporter. An option for people who don't torrent 
        #"hkgfoiooedgoejojocmhlaklaeopbecg"   # 37  picture in picture. option to pop out youtube videos
        #"eekailopagacbcdloonjhbiecobagjci"   # 38  Backspace. Go back in history with the key, old feature.
        #"akimgimeeoiognljlfchpbkpfbmeapkh"   # 39  Google Arts and Culture. Choose between a new-tab-homepage or visually stunning art
        #"ngceodoilcgpmkijopinlkmohnfifjfb"   # 40  Pomodoro timer
        #"kbfnbcaeplbcioakkpcpgfkobkghlhen"   # 41  Grammarly. Helps with spelling mistakes. Common extension, but I have found it annoying
        #"inoeonmfapjbbkmdafoankkfajkcphgd"   # 42  Read and write for chrome. Makes writing a little easier in Google docs. expensive and pay for use
        #"cehdjppppegalmaffcdffkkpmoflfhkc"   # 43  PopupTabSwitcher, interferes with vimium / i3
        #"lgblkllcjgihfnlefhnnpppndbbjallh"   # 44  Email This. emails to your gmail to read for later
        #"mclkkofklkfljcocdinagocijmpgbhab"   # 45  Google Input tools, for multi language support
        #"odpdkefpnfejbfnmdilmfhephfffmfoh"   # 46  Learn another language as you surf the web
        "pbcpfbcibpcbfbmddogfhcijfpboeaaf"   # 47  Edit the CSS for any page. Good complement for darkreader to cover all used websites
        #"hmanckoiohnlgdommlcckcflkmllobgj"   # 48  Ink for google, interesting webpage alterations for core google services
        #"pdiebiamhaleloakpcgmpnenggpjbcbm"   # 49  Tab Snooze, interesting tab reloading features, might be helpful as a reminder for some 
        #"hdokiejnpimakedhajhdlcegeplioahd"   # 50  LastPass  #I prefer to use google password services
        "chphlpgkkbolifaimnlloiipkdnihall"    # 51  Onetab  saves tabs in the "onetab" reduces chromium memory consumption
        "pcnhacefkmiiaohfeomepmkakclhbgkh"    # 52  Tanami chrome extension
      ];
      extraOpts = let
      in {
        "DefaultInsecureContentSetting" = 2; # disallow
        "custom_chrome_frame" = true;

        #  I believe it is unnecessary to hid from google.
        #  They might invade privacy, but they have good services.

        # disable all manner of account-related things.
        #"BrowserSignin" = 0; # disable
        #"BrowserAddPersonEnabled" = false;
        #"BrowserGuestModeEnabled" = false;
        #"UserDisplayName" = "PolicyUser";
        #"UserFeedbackAllowed" = false;
        #"BackgroundModeEnabled" = false;
        #"MetricsReportingEnabled" = false;
        #"BlockExternalExtensions" = true;
        #"AutofillAddressEnabled" = false;
        #"AutofillCreditCardEnabled" = false;
        #"PasswordManagerEnabled" = false;
        
        "PromptForDownloadLocation" = true;



        # This option results in no automatic search, only able to input urls, but can type "google+tab" to search
        #"DefaultSearchProviderEnabled" = false;
        
        "DefaultSearchProviderEnabled" = true;
        

        "DefaultSearchProviderName" = "Google";
        "DefaultSearchProviderKeyword" = "google.com";
        "DefaultSearchProviderIconURL" = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1004px-Google_%22G%22_Logo.svg.png";
        "DefaultSearchProviderSearchURL" = "https://google.com/search?q={searchTerms}";


        # Original Author Simojo really likes his privacy
        # usually it's just me testing things so allow it.
        #"SSLErrorOverrideAllowed" = true;
        # prefer not-google for most search
        #change search provider for privacy
        #"DefaultSearchProviderName" = "DuckDuckGoPolicy";
        #"DefaultSearchProviderKeyword" = "duckduckgo.com";
        #"DefaultSearchProviderIconURL" = "https://duckduckgo.com/favicon.ico";
        #"DefaultSearchProviderSearchURL" = "https://duckduckgo.com?q={searchTerms}";

        # bookmarks management
        # when needing to browse through, use Ctrl+Shift+O.
        # otherwise, these are here for auto-complete purposes.
        "BookmarkBarEnabled" = true;
        "ShowAppsShortcutInBookmarkBar" = false;
        "ManagedBookmarks" = [
          { "toplevel_name" = "Managed Bookmarks"; }
          { "name" = "Daily"; "children" = [
            { "url" = "https://calendar.google.com/calendar/r"; name = "Calendar"; }
            { "url" = "https://gmail.com/"; name = "Mail"; }
            { "url" = "drive.google.com/drive/u/0/my-drive"; name = "Drive"; }
            { "url" = "https://allegheny.instructure.com"; name = "Canvas"; }
            { "url" = "https://app.slack.com/"; name = "Slack"; }
            { "url" = "jupyter.cs.allegheny.edu"; name = "Jupyter"; }
            { "url" = "https://airtable.com"; name = "Airtable"; }
            { "url" = "https://github.com/DavidCincotta"; name = "GitHub"; }
          ]; }
          { "name" = "Entertainment"; "children" = [
            { "url" = "https://open.spotify.com"; name = "Spotify"; }
            { "url" = "https://youtube.com"; name = "YouTube"; }
            { "url" = "https://hulu.com/my-stuff"; name = "Hulu"; }
          { "name" = "Movies"; "children" = [
            { "url" = "https://123-watch.com/tron-legacy/"; name = "Tron: Legacy";}
            { "url" = "https://w.123-movies.club/lucy-2014/watching/"; name = "Lucy";}
          ];}
          ]; }
          { "name" = "Services"; "children" = [
            { "url" = "https://github.com/search/advanced"; name = "GitHubSearch"; }
            { "url" = "https://github.com/DavidCincotta"; name = "DavidCincotta"; }
            { "url" = "https://linkedin.com/"; name = "LinkedIn"; }
            { "url" = "https://amazon.com/"; name = "Amazon"; }
            { "url" = "https://ebay.com/"; name = "eBay"; }
          ]; }
          { "name" = "Nix"; "children" = [
            { "url" = "https://nixos.org/nix/manual/"; name = "nix-manual"; }
            { "url" = "https://nixos.org/nixpkgs/manual/"; name = "nixpkgs-manual"; }
            { "url" = "https://nixos.org/nixos/manual/"; name = "nixos-manual"; }
            { "url" = "https://nixos.org/nixos/options.html"; name = "nixos-options"; }
            { "url" = "https://nixos.org/nixos/packages.html"; name = "nixos-packages"; }
            { "url" = "https://discourse.nixos.org/"; name = "nixos-discourse"; }
            { "url" = "https://reddit.com/r/nixos/"; name = "nixos-reddit"; }
            { "url" = "https://nixos.wiki/"; name = "nixos-wiki"; }
            { "url" = "https://nixos.wiki/wiki/Nix_Cookbook#Creating_Shell_Scripts"; name= "nixos-shell-scripts"; }       
          ]; }
          { "name" = "FISH"; "children" = [
            { "url" = "https://fishshell.com/docs/current/index.html"; name = "fish-manual"; }
          ];}
          { "name" = "Git"; "children" = [
            { "url" = "https://docs.github.com/en/enterprise/2.15/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent"; name = "ssh-key-gen"; }
          ]; }
          { "name" = "Misc.Coding"; "children" = [ 
            { "url" = "https://www.shadertoy.com/"; name = "shadertoy"; }
            { "url" = "https://www.cyberciti.biz/faq/unix-linux-get-the-contents-of-a-webpage-in-a-terminal/"; name = "terminal-web"; }
            { "url" = "https://www.coolgenerator.com/ascii-text-generator"; name = "ascii-art-2"; }
            { "url" = "https://www.tutorialspoint.com/how-to-mount-usb-drive-in-a-linux-system"; name = "mounting-memory-devices"; }
            { "url" = "https://www.shortcutfoo.com/app/dojos/awk/cheatsheet"; name = "awk-cheat-sheet"; }
          ];}
          { "name" = "Writing & Reading"; "children" = [
            { "url" = "https://play.typeracer.com/"; name = "typeracer-practice-touchtype"; }
            { "url" = "https://typing.io/lessons"; name = "typing.io-coding-type-practice"; }
            { "url" = "http://twinery.org/2/#!/stories"; name = "twine"; }
            { "url" = "https://www.worksheetworks.com/english/writing/handwriting/cursive-practice.html"; name = "cursive-practice"; }
            { "url" = "https://libgen.is/"; name="libgen-free-books-by-isbn-is"; } 
            { "url" = "https://libgen.li/"; name="libgen-free-books-by-isbn-li"; } 
            { "url" = "https://www.goodreads.com/"; name="goodreads"; }
          ];}
          { "name" = "ShortcutFoo"; "children" = [
            { "url" = "https://www.shortcutfoo.com/app/dojos/awk"; name = "awk-practice"; }
          ];}
          { "name" = "Food"; "children" = [
            { "url" = "https://therecipecritic.com/creamy-bacon-carbonara/"; name = "bacon-carbonara"; }
          ];}
        ];
      };
    };
  };
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"
  ];
  nixpkgs.config.allowUnfree = true;
  environment = {
    systemPackages = [
      pkgs.acpi
      pkgs.age
      pkgs.atop
      pkgs.bash
      pkgs.bat
      pkgs.curl
      pkgs.docker
      pkgs.elixir
      pkgs.entr
      pkgs.exa
      pkgs.fd
      pkgs.file
      pkgs.fzf
      pkgs.git #              Standart Version control
      pkgs.gnugrep
      pkgs.gnumake
      pkgs.gnupg
      pkgs.gnused
      pkgs.gnutar
      pkgs.htop
      pkgs.killall
      pkgs.less
      pkgs.ncdu
      pkgs.netcat
      pkgs.nix
      pkgs.nmap
      pkgs.objconv
      pkgs.openvpn
      pkgs.pinentry
      pkgs.ripgrep
      pkgs.rsync
      pkgs.sd
      pkgs.tig
      pkgs.tldr
      pkgs.tmux
      pkgs.tree #               see tree structure of the filesystem
      #pkgs.vim_configurable #   vim that uses plugins
      pkgs.wpa_supplicant
      pkgs.xclip #              send cli output to the clipboard or the reverse
      pkgs.zip #                standard library for ziping directories
      pkgs.unzip
      pkgs.fish #               great shell, cool features like wild cards, 
      pkgs.networkmanager #     mission critical wifi manager
      #pkgs.blueman #           bluetooth manager like network manager, seems to be unecessary 
      pkgs.pciutils #           standard linux tools
      pkgs.gcc  #               c++
      #pkgs.rustup #             rust toolchain manager
      #pkgs.rustc #              rust language
      #pkgs.go #                 go language
      pkgs.bind #               standard linux tools - installed for dig
      #pkgs.lynx #               terminal based browser, follows the same color scheme as system terminal
      pkgs.wget
      pkgs.w3m  #               
      #pkgs.pandoc #             convert between many different type of file types
      #pkgs.qbittorrent  #       standart torrent client
      #pkgs.neovim       #       new vim, I like normal vim
      pkgs.asciiquarium #       embrace marine life from the terminal with ascii art
      #pkgs.gif-for-cli  #       Confert media to ascii art
      pkgs.lsd  #               colorful ls program written in rust
      #pkgs.boxes #              draw boxes around input text
      #pkgs.figlet #             make large letters out of input, ascii
      #pkgs.lolcat #             add rainbow colors to standart output
      #pkgs.jp2a   #             jpg to ascii art
      #pkgs.toilet #             ascii in colorful letters
      python-with-my-packages # custom python3 instalation
      #pkgs.graphviz
      pkgs.bat
      pkgs.fzf
      pkgs.maven
      #pkgs.nodejs-14_x
      #pkgs.nodePackages.eslint
      #pkgs.nodePackages.typescript
      #pkgs.nudoku
      #pkgs.heroku
      #pkgs.orca-c
      pkgs.postgresql
      pkgs.awscli2
      pkgs.openssl
      
      pkgs.scala
      pkgs.sbt
      pkgs.coursier

      pkgs.alacritty
      pkgs.feh
      pkgs.ffmpeg
      pkgs.hsetroot
      pkgs.libguestfs
      pkgs.libvirt
      pkgs.lmms
      pkgs.neofetch
      pkgs.polybar
      pkgs.scrot
      pkgs.shotcut
      #pkgs.slock
      #pkgs.virt-manager
      pkgs.xorg.xmodmap
      pkgs.xorg.xset
      pkgs.ranger
      pkgs.google-chrome
      #pkgs.chromium
      pkgs.calibre
      #pkgs.etcher
      #pkgs.gparted
      #pkgs.spotify
      #pkgs.discord
      pkgs.i3
      pkgs.i3-gaps
      pkgs.unclutter-xfixes
      #pkgs.libreoffice
      #pkgs.gnumeric
      pkgs.zoom-us
      pkgs.nerdfonts
      #pkgs.skype
      pkgs.polybar
      #pkgs.slack-term
      pkgs.wireshark
      pkgs.wireshark-cli
      pkgs.pavucontrol
      

      #pkgs.steam
      #pkgs.steamPackages.steamcmd
      #pkgs.steamPackages.steam
      #pkgs.steamPackages.steam-runtime
      #pkgs.steam-tui
      #pkgs.steam-run-native
      #pkgs.wine
      #pkgs.eidolon
      #pkgs.libgdiplus
      #pkgs.pipewire


      #pkgs.virtualbox
      pkgs.gns3-gui
      pkgs.gns3-server
      pkgs.dynamips
      pkgs.ubridge
      pkgs.inetutils

      pkgs.networkmanagerapplet


      (pkgs.neovim.override {
        vimAlias = true;
        configure = {
          packages.myPlugins = with pkgs.vimPlugins; {
            start = [ vim-lastplace vim-nix ]; 
            opt = [];
          };
          customRC = ''
            " your custom vimrc
            set number
            set hidden
            syntax on
            set nocompatible
            set backspace=indent,eol,start
            set tabstop=4
            set shiftwidth=4
            set expandtab
            " ...
            '';
          };
        }
      )
    ];


    etc."gitconfig".text = dotfiles.gitconfig;
    etc."alacritty".text = builtins.readFile dotfiles.alacritty_config;
    sessionVariables.TERMINAL = ["alacritty"];
    sessionVariables.TERM = ["alacritty"];
    sessionVariables.EDITOR = ["vim"];
    variables = { EDITOR = "vim"; };
  };
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
  security = {
    wrappers = { 
      /*
      ping= {
        #setuid=true;
        owner = "root";
        group = "root";
        source = "${pkgs.ping.out}/bin/ping";
        capabilities = "cap_net_raw+eip";
      };
      */
      ubridge= {
        #setuid=true;
        owner = "root";
        group = "root";
        source = "${pkgs.ubridge.out}/bin/ubridge";
        capabilities = "cap_net_admin+eip cap_net_raw+eip cap_net_broadcast+eip cap_net_bind_service+eip";
      };
    };
  };
  networking = {
    hostName = "nixos";
    #wireless.enable = true;#Handled by NM better 
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
    useDHCP = false;
    useNetworkd = false;
  };

  /*
  buildPythonPackage = {
    name = "CustomEnvVariablesInit";

    buildInputs = [ pkgs.python pkgs.libxml2 ];

    src = null;

    COLOR_SCHEME = "000";
    TOUCHPAD_BOOL = "1";
  };
  */ 

  services = {
    openssh = {
      enable = true;
    };
    unclutter-xfixes = {
      enable = true;
      extraOptions = ["ignore-scrolling"];
    };
    logind = {
      extraConfig = "
        HandleLidSwitch=ignore
        HandleLidSwitchDocked=ignore
        HandleLidSwitchExternalPower=ignore
        ";
      #killUserProcesses = true;
    };
    xserver = {
      libinput.enable = true;
      libinput.touchpad.naturalScrolling = true;
      autoRepeatDelay = 300;
      autoRepeatInterval = 30;
      desktopManager = {
        plasma5 = {
          enable = false;
        };
      };
      displayManager = {
        defaultSession = "none+i3";
        #defaultSession = "plasma+i3";
          autoLogin={
            enable=true;
            user="david";
        };
      };
      enable = true;
      layout = "us";
      autorun = true;
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
          configFile = "/etc/nixos/dotfiles/i3config.dotfile";
          extraPackages = with pkgs; [
            dmenu
            i3lock
            i3status
          ];
        };
      };
    };
  };
}
