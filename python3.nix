{pkgs,...}:
with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    pandas requests lxml selenium psutil ansible dbus-python ijson async-timeout aiohttp-cors yarl aiohttp multidict setuptools jinja2 psutil zipstream sentry-sdk jsonschema distro async_generator aiofiles prompt-toolkit py-cpuinfo numpy scipy virtualenv

    #yewtuberec#pyperclip youtube-search-python yt-dlp
  ];
  customPython = pkgs.python3.withPackages my-python-packages;
in
{
  environment.systemPackages = [customPython];
}




