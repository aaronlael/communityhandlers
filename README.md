# communityhandlers
Handlers for the Genesys PureConnect Community

This is a place for me to share handlers that I reference on the community forum, since we can't upload handlers directly.

**DivModNumOne.ihd

This handler splits a numeric value at the decimal point into iWhole (the integer portion) and iFract (the fractional portion); two integers.  This is done by:
1. Creating a new variable that casts the passed in numeric to an integer
2. replacing a substring of the original value equal to our new integer (cast to string) & "." to "", to leave only the decimal portion behind, then casting that to integer
3. Returning those as subroutine parameters
