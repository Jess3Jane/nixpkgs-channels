{ stdenv, fetchzip }:

let
  version = "20190731";
in fetchzip {
  name = "iana-etc-${version}";
  url = "https://github.com/Mic92/iana-etc/releases/download/${version}/iana-etc-${version}.tar.gz";
  sha256 = "0vqr4zm53zn7z75ynmf59xfrlhpyk8f41xd6i4v8j0f7k6hfdvpi";

  postFetch = ''
    tar -xzvf $downloadedFile --strip-components=1
    install -D -m0644 -t $out/etc services protocols
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/Mic92/iana-etc;
    description = "IANA protocol and port number assignments (/etc/protocols and /etc/services)";
    platforms = platforms.unix;
    license = licenses.mit;
  };
}
