FROM mcr.microsoft.com/devcontainers/base:noble

RUN apt-get update && apt-get -y install texlive-lang-japanese texlive-latex-extra texlive-luatex texlive-extra-utils latexmk pandoc \
  git \
  unzip

COPY .devcontainer/fonts/ /usr/local/share/fonts/

# fonts フォルダのzipを展開
RUN find /usr/local/share/fonts -name "*.zip" -exec unzip -d /usr/local/share/fonts {} \; && \
    fc-cache -f -v
