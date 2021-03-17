## Домашнее задание к занятию "3.9. Элементы безопасности информационных систем"

1. 
```
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
	sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
	sudo apt-get update && sudo apt-get install vault
	mkdir -p vault/data
	vagrant@vagrant:~$ nano config.hcl
	ui = true

	storage "file" {
	path = "./vault/data"
	}

	# HTTPS listener
	listener "tcp" {
	address       = "0.0.0.0:8200"
		tls_cert_file = "/opt/vault/tls/tls.crt"
		tls_key_file  = "/opt/vault/tls/tls.key"
	}
```
2. sudo vault server -dev-listen-address="0.0.0.0:8200" -config=config.hcl  
<img align="top" src="img/vault.jpg">	<!--![vault](img/vault.jpg)-->
<img align="top" src="img/vault_server.jpg">	<!--![vault_server](img/vault_server.jpg)-->
3. <img align="top" src="img/CA.jpg">	<!--![CA](img/CA.jpg)-->
4. <img align="top" src="img/netology_crt.jpg">	<!--![netology_crt](img/netology_crt.jpg)-->
5. <img align="top" src="img/nginx_ssl.jpg">	<!--![nginx_ssl.jpg](img/nginx_ssl.jpg)-->
6. 
```
echo 127.0.0.1 netology.example.com >> /etc/hosts
ln -s /home/vagrant/certs/ca.crt /usr/local/share/ca-certificates/demo_ca.crt
update-ca-certificates
```
<img align="top" src="img/curl.jpg">	<!--![curl](img/curl.jpg)-->
 