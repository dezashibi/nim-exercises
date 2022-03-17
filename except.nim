import strutils except split
import unicode

echo "Hello Woبrld!".split("ب".toRunes)

#[
#in here we chose that a proc with same name not to cause conflicts
#but in case we need both we could do this
#echo unicode.split(.....)
#]#
