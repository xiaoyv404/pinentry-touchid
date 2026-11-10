module github.com/jorgelbg/pinentry-touchid

go 1.26.0

replace github.com/foxcpp/go-assuan => ./go-assuan

require (
	github.com/foxcpp/go-assuan v1.0.0
	github.com/gopasspw/pinentry v0.0.2
	github.com/keybase/go-keychain v0.0.2-0.20261102153259-0458296a73e7
	github.com/lox/go-touchid v0.0.0-20170712105233-619cc8e578d0
)

require github.com/enescakir/emoji v1.0.0
