<sub>[moatorres/zshrc](https://github.com/moatorres/zshrc)</sub>

## ⚡️ ZSH Config

#### A collection of `~/.zshrc` configs I've been using over the past few months.

Below there's a [quick reference guide](https://www.shellscript.sh/quickref.html) to the meaning of some of the less easily guessed commands and codes of shell scripts. By their nature, they are also quite difficult to find using search engines. These examples include process management, shell scripts arguments, and shell script test conditions.

<details><summary>Shell Script Quick Reference</summary>
  
| CHAR | DESCRIPTION | EXAMPLE |
|:---:|-|:-|
| `&` | Run the previous command in the background | `ls &` |
|`&&`| Logical AND	                                                                        |`if [ "$foo" -ge "0" ] && [ "$foo" -le "9"]`|
|`\|\|`| Logical OR	                                                                         |`if [ "$foo" -lt "0" ] \|\| [ "$foo" -gt "9" ]`|
|`^`| Start of line	                                                                      |`grep "^foo"`|
|`$`| End of line	                                                                        |`grep "foo$"`|
|`=`| String equality (cf. -eq)	                                                          |`if [ "$foo" = "bar" ]`|
|`!`|	Logical NOT	                                                                        |`if [ "$foo" != "bar" ]`|
|`$$`| PID of current shell	                                                               |`echo "my PID = $$"`|
|`$!`| PID of last background command	                                                     |`ls & echo "PID of ls = $!"`|
|`$?`| exit status of last command	                                                        |`ls ; echo "ls returned code $?"`|
|`$0`| Name of current command (as called)	                                                |`echo "I am $0"`|
|`$1`| Name of current command's first parameter	                                           |`echo "My first argument is $1"`|
|`$9`| Name of current command's ninth parameter	                                           |`echo "My ninth argument is $9"`|
|`$@`| All of current command's parameters (with whitespaces and quoting)	             |`echo "My arguments are $@"`|
|`$*`| All of current command's parameters (no whitespaces or quoting)	         |`echo "My arguments are $*"`|
|`-eq`| Numeric Equality	                                                                   |`if [ "$foo" -eq "9" ]`|
|`-ne`| Numeric Inquality	                                                                  |`if [ "$foo" -ne "9" ]`|
|`-lt`| Less Than	                                                                          |`if [ "$foo" -lt "9" ]`|
|`-le`| Less Than or Equal	                                                                 |`if [ "$foo" -le "9" ]`|
|`-gt`| Greater Than	                                                                       |`if [ "$foo" -gt "9" ]`|
|`-ge`| Greater Than or Equal	                                                              |`if [ "$foo" -ge "9" ]`|
|`-z`| String is zero length	                                                              |`if [ -z "$foo" ]`|
|`-n`| String is not zero length	                                                          |`if [ -n "$foo" ]`|
|`-nt`| Newer Than	                                                                         |`if [ "$file1" -nt "$file2" ]`|
|`-d`| Is a Directory	                                                                     |`if [ -d /bin ]`|
|`-f`| Is a File	                                                                          |`if [ -f /bin/ls ]`|
|`-r`| Is a readable file	                                                                 |`if [ -r /bin/ls ]`|
|`-w`| Is a writable file	                                                                 |`if [ -w /bin/ls ]`|
|`-x`| Is an executable file	                                                              |`if [ -x /bin/ls ]`|
|`()`| Function definition	                                                                |`function myfunc() { echo hello }`|

</details>

<sub><sup>Made with ❤️ by [Moa](https://github.com/moatorres)</sup></sub>
