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
#custom chromium / gooogle_chrome_stable package settings
{ config, lib, pkgs, ... }:
{
  programs.chromium = {
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
          { "url" = "https://github.com/"; name = "GitHub"; }
          { "url" = "https://github.com/simojo"; name = "simojo"; } # this implementation is based off the best nixos configuration I found, thanks simojo
	  { "url" = "https://github.com/DavidCincotta"; name = "DavidCincotta"; }
          { "url" = "https://digitalocean.com/"; name = "DigitalOcean"; }
          { "url" = "https://namecheap.com/"; name = "Namecheap"; }
          { "url" = "https://linkedin.com/"; name = "LinkedIn"; }
          { "url" = "https://amazon.com/"; name = "Amazon"; }
          { "url" = "https://newegg.com/"; name = "Newegg"; }
          { "url" = "https://ebay.com/"; name = "eBay"; }
        ]; }
        { "name" = "Nix"; "children" = [
          { "url" = "https://nixos.org/nix/manual/"; name = "nix-manual"; }
          { "url" = "https://nixos.org/nixpkgs/manual/"; name = "nixpkgs-manual"; }
          { "url" = "https://nixos.org/nixos/manual/"; name = "nixos-manual"; }
          { "url" = "https://nixos.org/nixos/options.html"; name = "nixos-options"; }
          { "url" = "https://nixos.org/nixos/packages.html"; name = "nixos-packages"; }
          { "url" = "https://discourse.nixos.org/"; name = "nixos-discourse"; }
          { "url" = "https://old.reddit.com/r/nixos/"; name = "nixos-reddit"; }
          { "url" = "https://nixos.wiki/"; name = "nixos-wiki"; }
          { "url" = "https://nixos.wiki/wiki/Nix_Cookbook#Creating_Shell_Scripts"; name= "nixos-shell-scripts"; }       
        ]; }
        { "name" = "Elixir"; "children" = [
          { "url" = "https://elixir-lang.org/"; name = "elixir-lang"; }
          { "url" = "https://elixir-lang.org/blog"; name = "elixir-blog"; }
          { "url" = "https://elixirforum.com/"; name = "elixir-forum"; }
          { "url" = "https://old.reddit.com/r/elixir/"; name = "elixir-reddit"; }
          { "url" = "https://elixir-lang.org/getting-started/introduction.html"; name = "elixir-book"; }
          { "url" = "https://elixirschool.com/en/"; name = "elixir-school"; }
          { "url" = "http://media.pragprog.com/titles/elixir/ElixirCheat.pdf"; name = "elixir-cheatsheet"; }
          { "url" = "https://hex.pm"; name = "elixir-hex"; }
          { "url" = "https://github.com/h4cc/awesome-elixir"; name = "elixir-awesome"; }
          { "url" = "https://hexdocs.pm/elixir/Kernel.html"; name = "elixir-docs-std"; }
          { "url" = "https://hexdocs.pm/elixir/Regex.html"; name = "elixir-docs-std-regex"; }
          { "url" = "https://hexdocs.pm/elixir/String.html"; name = "elixir-docs-std-string"; }
          { "url" = "https://hexdocs.pm/elixir/Enum.html"; name = "elixir-docs-std-enum"; }
          { "url" = "https://hexdocs.pm/elixir/List.html"; name = "elixir-docs-std-list"; }
          { "url" = "https://hexdocs.pm/elixir/Map.html"; name = "elixir-docs-std-map"; }
          { "url" = "https://hexdocs.pm/elixir/Supervisor.html"; name = "elixir-docs-std-supervisor"; }
          { "url" = "https://hexdocs.pm/elixir/GenServer.html"; name = "elixir-docs-std-genserver"; }
          { "url" = "https://hexdocs.pm/elixir/Process.html"; name = "elixir-docs-std-process"; }
          { "url" = "https://hexdocs.pm/eex/EEx.html"; name = "elixir-docs-eex"; }
          { "url" = "https://hexdocs.pm/ex_unit/ExUnit.html"; name = "elixir-docs-exunit"; }
          { "url" = "https://hexdocs.pm/iex/IEx.html"; name = "elixir-docs-iex"; }
          { "url" = "https://hexdocs.pm/logger/Logger.html"; name = "elixir-docs-logger"; }
          { "url" = "https://hexdocs.pm/mix/Mix.html"; name = "elixir-docs-mix"; }
        ]; }
        { "name" = "ZFS"; "children" = [
          { "url" = "https://www.freebsd.org/doc/handbook/zfs.html"; name = "zfs-handbook"; }
          { "url" = "https://wiki.archlinux.org/index.php/ZFS"; name = "zfs-archwiki"; }
          { "url" = "https://nixos.wiki/wiki/NixOS_on_ZFS"; name = "zfs-nixoswiki"; }
          { "url" = "https://wiki.gentoo.org/wiki/ZFS"; name = "zfs-gentoowiki"; }
          { "url" = "https://docs.oracle.com/cd/E26505_01/html/E37384/"; name = "zfs-oracle"; }
          { "url" = "https://old.reddit.com/r/zfs/"; name = "zfs-reddit"; }
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
          { "url" = "http://www.patorjk.com/software/taag/#p=display&f=Epic&t=nixos%0Ai3wm-gaps%20%0Aallacritty"; name = "ascii-art"; }
          { "url" = "https://www.coolgenerator.com/ascii-text-generator"; name = "ascii-art-2"; }
          { "url" = "https://www.tutorialspoint.com/how-to-mount-usb-drive-in-a-linux-system"; name = "mounting-memory-devices"; }
          { "url" = "https://alvinalexander.com/blog/post/linux-unix/create-aliases/"; name = "alias-tutorial-linux"; }
          { "url" = "https://www.geekyhacker.com/2016/06/18/how-to-open-formatted-markdown-files-in-linux-terminal/"; name = "markdown-viewer"; }
          { "url" = "https://www.baeldung.com/linux/use-command-line-arguments-in-bash-script"; name = "scripting-parameters-cli-input"; }
          { "url" = "https://perlmaven.com/regex-cheat-sheet"; name = "perl-regex-cheat-sheet"; }
          { "url" = "https://www.shortcutfoo.com/app/dojos/awk/cheatsheet"; name = "awk-cheat-sheet"; }
          { "url" = "https://github.com/philc/vimium/wiki"; name = "vimium-wiki"; }
        ];}
        { "name" = "Social"; "children" = [
          { "url" = "https://facebook.com"; name = "facebook"; }
          { "url" = "https://twitter.com"; name = "twitter"; }
          { "url" = "https://instagram.com"; name = "instagram"; }
          { "url" = "https://reddit.com/r/all"; name = "reddit"; }
          { "url" = "https://www.pinterest.com/"; name = "pintrest"; }
          { "url" = "https://www.messenger.com/"; name = "messenger-facebook"; }
          { "url" = "https://messages.google.com/web/conversations"; name = "messages-for-web-google"; }
          { "url" = "https://mail.google.com/mail/u/0/#inbox"; name = "gmail-inbox"; }
          { "url" = "https://mail.google.com/mail/u/0/h/?v=lui"; name = "gmail-inbox-simple-html"; }
          { "url" = "https://hangouts.google.com/"; name = "google-hangouts"; }
          { "url" = "https://voice.google.com/u/0/messages"; name = "google-voice"; }
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
        { "name" = "Medical"; "children" = [
          { "url" = "https://www.rxlist.com/drugs/alpha_a.htm"; name = "rxlist-drug-side-effects-by-name"; }
          { "url" = "https://www.rxlist.com/seroquel-side-effects-drug-center.htm#consumer"; name = "seroquel-research"; }
          { "url" = "https://www.rxlist.com/ativan-drug.htm"; name = "ativan-research"; }
          { "url" = "https://www.rxlist.com/ativan-injection-drug.htm"; name = "ativan-injection-research"; }
          { "url" = "https://www.rxlist.com/atarax-drug.htm"; name = "atarax-research"; }
          { "url" = "https://orthosports.com.au/pdf-download/Understanding-tendon-rehabilitation-Paul-Mason.pdf"; name = "tendon-recovery-research"; }
        ];}
        { "name" = "Food"; "children" = [
          { "url" = "https://therecipecritic.com/creamy-bacon-carbonara/"; name = "bacon-carbonara"; }
      ];}
      ];
    };
  };
}
