current_dir = $(shell pwd)

server:
	hugo server -D
	

build:
	hugo


upload:
	chmod -R 755 $(current_dir)/public
	lftp -e "set ftp:ssl-allow no; mirror -R $(current_dir)/public sftp://$(BREW_LADY_USER):$(BREW_LADY_PASS)@$(BREW_LADY_IP_ADDRESS)/; exit" -u $(BREW_LADY_USER),$(BREW_LADY_PASS) $(BREW_LADY_IP_ADDRESS)
