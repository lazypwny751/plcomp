# plcomp (Perl Communication Protocol)
Modüler iletişim protokolü, Perl ve Kabuk betikleri ile hazırlanmış olup, metin seviyesinde TCP protokolünü kullanan şeffaf bir protokoldür

## Açıklama.
Modüler TCP katmanı iletişim protokolü perl dili ile yazılmış olup internet ağının çoğunluğunu oluşturan unix*/linux sistemleri için geliştirildi, systemd servisi desteği mevcut, methodolojik olarak gelen isteği ayrıştırıp, sunucu tarafında işledikten sonra çıkan sonucu base64 codec'i ile dağıttıktan sonra yalın metin olarak TCP katmanından ilgili istemciye aktarılır, istemci gelen base64'lü yalın metin verisini alıp ayrıştırarak, ilgili karşı işleyiciye gelen base64'lük veriyi ayrıştırarak parametre olarak sunar.

NOT: Burada modüler kontrolcüler ve işleyiciler için bir sürüm kontrolü yapılmamaktadır bunu işleyiciyi yapacak kişinin kendi kuracağı mekanizmaları ile halletmesi beklenir. 

## Bağımlılıklar
- [Perl >=5]()
- [Bash >=5]()
- [Cpan >1.64]()
- [Perl - Switch]()
- [Perl - Getopt::Long]()
- [Perl - IO::Socket::INET]()
- [Perl - MIME::Base64]()

## Kurulum.
```bash
git clone "https://github.com/lazypwny751/plcomp.git" && cd "plcomp"
cpan install "Getopt::Long" "Switch" "IO::Socket::INET" "MIME::Base64"
sudo make install
sudo systemctl enable plcomp && sudo systemctl start plcomp 
plcompc --data "test/print:bu bir deneme mesajıdır." # Bu sadece protokolün başarıyla kurulduğunu gösteren bir test komutudur. Eğer bu komutun çıktısı "bu bir deneme mesajıdır." değil ise, konu başlığı açıp durumu bildirebilirsiniz.
```

## Katkıda Bulunma.
Gönderme istekleri açıktır. Büyük (Major) değişikler için, lütfen önce konu başlığı oluşturup ne tarz bir değişiklik yapmak istediğinizden bahsedin.

## Lisans.
[GPLv3](https://choosealicense.com/licenses/gpl-3.0/)
