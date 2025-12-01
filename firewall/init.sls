# firewall/init.sls
#
# UFW-palomuuri automatisoituna Salt järjestelmäl
# v1 – perusversio (sallii portit 22 ja 80, estää muut)

ufw-package:
  pkg.installed:
    - name: ufw

ufw-default-deny:
  cmd.run:
    - name: "ufw default deny incoming"
    - unless: "ufw status | grep -q 'Default: deny (incoming)'"

ufw-allow-ssh:
  cmd.run:
    - name: "ufw allow 22/tcp"
    - unless: "ufw status | grep -q '22/tcp'"

ufw-allow-http:
  cmd.run:
    - name: "ufw allow 80/tcp"
    - unless: "ufw status | grep -q '80/tcp'"

ufw-enable:
  cmd.run:
    - name: "echo y | ufw enable"
    - unless: "ufw status | grep -q 'Status: active'"
    - require:
      - pkg: ufw-package
