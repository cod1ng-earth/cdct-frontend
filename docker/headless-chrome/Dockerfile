
FROM debian:stretch-20190204-slim

ENV CHROME_STABLE_VERSION 72.0.3626.96-1

# Install dependencies
RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get install -yq curl libgconf-2-4

ENV CHROME_STABLE_VERSION 72.0.3626.96-1

# Install deps + add Chrome Stable + purge all the things
RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	--no-install-recommends \
	&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
	&& apt-get update && apt-get install -y \
	google-chrome-stable=${CHROME_STABLE_VERSION} \
	fontconfig \
	fonts-ipafont-gothic \
	fonts-wqy-zenhei \
	fonts-thai-tlwg \
	fonts-kacst \
	fonts-symbola \
	fonts-noto \
	ttf-freefont \
	--no-install-recommends \
	&& apt-get purge --auto-remove -y curl gnupg \
	&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh .
RUN chmod +x ./entrypoint.sh

EXPOSE 9222
ENTRYPOINT ["./entrypoint.sh"]
