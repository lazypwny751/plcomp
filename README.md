# plcomp (Perl Communication Protocol)
The modular communication protocol is a transparent protocol using the text-level TCP protocol, prepared with Perl and shell scripts.

![](https://cdn.dribbble.com/users/411340/screenshots/4421762/camel_dribbble.gif)

## Description.
The modular TCP layer communication protocol is written in perl language and developed for unix*/linux systems that make up the majority of the internet network, systemd service support is available, methodologically parsing the incoming request, processing it on the server side, and distributing the result with base64 codec, then TCP as plain text. layer to the relevant client, the client receives the incoming base64 plain text data and parses it, parses the incoming base64 data to the corresponding counter-processor and presents it as a parameter.

NOTE: There is no version control for modular controllers and handlers here, it is expected that the handler will handle it with their own mechanisms.

## Requirements.
- [Perl >=5]()
- [Bash >=5]()
- [Cpan >1.64]()
- [Perl - Switch]()
- [Perl - Getopt::Long]()
- [Perl - IO::Socket::INET]()
- [Perl - MIME::Base64]()

## Installation.
```bash
git clone "https://github.com/lazypwny751/plcomp.git" && cd "plcomp"
cpan install "Getopt::Long" "Switch" "IO::Socket::INET" "MIME::Base64"
sudo make install
sudo systemctl enable plcomp && sudo systemctl start plcomp 
plcompc --data "test/print:test one two three." # That's Just test command.
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[GPL3](https://choosealicense.com/licenses/gpl-3.0)