run:
	docker run --rm=true -t -i \
		-p 4443:443 -p 8000:80 -p 2022:22 \
		cbayle/question2answer:1.0 /bin/bash

build:
	docker build -t cbayle/question2answer:1.0 .

