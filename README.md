# communityhandlers
Handlers for the Genesys PureConnect Community

This is a place for me to share handlers that I reference on the community forum, since we can't upload handlers directly.

**DivModNumOne.ihd

This handler splits a numeric value at the decimal point into iWhole (the integer portion) and iFract (the fractional portion); two integers.  This is done by:
1. Creating a new variable that casts the passed in numeric to an integer
2. replacing a substring of the original value equal to our new integer (cast to string) & "." to "", to leave only the decimal portion behind, then casting that to integer
3. Returning those as subroutine parameters



# community scripts

**soapcerts.ps1

Have you ever had a webserice URL that simply won't play nice with the server hello from certtrustu.exe?  Here's a simple script to pull the certs from the URL with powershell and then format them as needed so you can move them into your SOAP or REST directory.

1.  You need to update the ssl_app-w32r-XX-X.exe in the script to the version on your server.  This application is in the D:\i3\ic\server directory
2.  You run the script with the URL as the first parameter:  certs.psl https://url.for.your.webservice
3.  The script then generates the hash.0 files from the PEM files needed for SOAP/REST webservices on your PureConnect environment.
