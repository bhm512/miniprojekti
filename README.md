# Miniprojekti

## Taustatiedot projektiin

Tämän projektin idea tuli omasta kiinnostuksestamme tietoturvaan, siksi päätimme opetella/hyödyntää sitä myös tässä suhteellisen yksinkertaisessa projektissa. 
Projektisssa esiintyy yksinkertainen ja idempotentti SaltStack- konfiguraatiotiedoston, jonka avulla voidaan ottaa käyttöön suojattu palomuuri = UFW, Debian Linux järjestelmässä. 

Tavoitteena oli hyödyntää kurssilla opittuja asioita kuten: modernia keskitettyä hallintaa, infra-koodina perus periaatteita ja yhtä totuutta.

- Yhden lauseen selitys = Määrittää toimiva ja turvallinen UFW- palomuuri idempotentin tilan avulla (Salt).

  Jos haluaa ajaa kyseisen homman, niin täytyy lisätä /Miniprojekti/ kansioon top.sls ja sinne:

<img width="128" height="56" alt="Näyttökuva 2025-12-01 kello 18 34 37" src="https://github.com/user-attachments/assets/5de32b27-b52a-4aa3-9720-02426b5ec9f3" />
 
Kloonaa repositorio

git clone https://github.com/bhm512/miniprojekti
cd miniprojekti

Luo top.sls 

(Se screenshot mikä siinä on nytkin)

Base:
  ‘*’ :
firewall

3.  Lisää projektihakemisto Saltin Minion tiedostoon  /etc/salt/minion

file_roots:
  base:
    - /polku/tähän/repositorioon

4. Aja salt-tila

sudo salt-call --local state.apply



  
### Vaiheet

- Ensiksi luotiin uusi repo projektille githubiin, josta kloonattiin tämä debian virtuaalikoneelle. 

- Seuraavaksi luotiin kansio salt tiloille (mkdir firewall)

- Tässä kansiorakenne
  <img width="398" height="153" alt="Näyttökuva 2025-12-01 kello 17 22 20" src="https://github.com/user-attachments/assets/6e9c5f5c-29ca-4fe9-b670-955987e657ab" />


- Tämän jälkeen kirjoitimme idempotentin Salt-tilan UFW-palomuuriin.

  <img width="601" height="607" alt="Näyttökuva 2025-12-01 kello 17 30 42" src="https://github.com/user-attachments/assets/abbde6f2-d900-45fa-a52a-836a51b18d2d" />

  Selitykset tilakomennoista:

  - 1. komento = pkg.installed = varmistaa että paketti on asennettu
    2. Toinen kappalle suorittaa komennon (pitää lukea deny-incoming, jotta se toimii)
    3. Sallii portin 22, jos ei ole jo sallittu
    4. Sallii portin 80, jos ei ole jo sallittu
    5. Alin kappale ottaa UFW:n käyttöön, jos ei ole jo.
   
-> Tämän jälkeen: sudo salt-call --local state.apply firewall
  
<img width="1466" height="765" alt="Näyttökuva 2025-12-01 kello 17 40 56" src="https://github.com/user-attachments/assets/197ed13c-ded0-4ce0-8a8a-5398f82cd442" />

<img width="1470" height="648" alt="Näyttökuva 2025-12-01 kello 17 41 29" src="https://github.com/user-attachments/assets/01f69669-42c2-4718-8945-b590d2c4e73b" />

 -> varmistin palomuurin toiminnan 

<img width="515" height="210" alt="Näyttökuva 2025-12-01 kello 17 44 39" src="https://github.com/user-attachments/assets/983a9ee2-ce5d-42c4-b208-2cf6d56ac539" />

Toimii!


### Lähteet

- https://docs.saltproject.io/en/latest/contents.html
- https://help.ubuntu.com/community/UFW
- https://wiki.debian.org/UncomplicatedFirewall
- https://terokarvinen.com/palvelinten-hallinta/
- https://terokarvinen.com/2018/salt-quickstart-salt-stack-master-and-slave-on-ubuntu-linux/?fromSearch=salt%20quickstart%20salt%20stack%20master%20and%20slave%20on%20ubuntu%20linux

