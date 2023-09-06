#!/bin/sh

terms=""" 
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
THE SOFTWARE IS PROVIDED ''AS IS'', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"""
dna_ascii=$(cat /usr/lib/floflis/layers/dna/dna_ascii)

termsagreement () {
   echo "${dna_ascii}"
   echo "Terms (applies to The Floflis Platform, The Floflis OS and its set of applications such as this script - rmv):"
   echo "${terms}"
   echo "Scroll up to read. PLEASE READ/WRITE CAREFULLY!"
   echo "Do you agree with the terms and the disclaimer? [Y/n]"
   read terms_input
   case $terms_input in
      [nN])
         exit ;;
      [yY])
         echo "Ok"
esac
}

#if [ ! -e /usr/lib/01 ]; then sudo mkdir /usr/lib/01; fi

# Check if trash-cli is installed, and install it if necessary
if ! command -v trash &> /dev/null
then
    echo "trash-cli is not installed. Installing it now..."
    sudo apt install trash-cli #Need to get 24,2 kB of archives. After this operation, 111 kB of additional disk space will be used.
fi

echo "Installing rmv..." && echo "- Installing rmv command in /usr/bin..."
sudo cp -f rmv /usr/bin
echo "- Turning rmv into an executable..."
sudo chmod +x /usr/bin/rmv

if [ -f /usr/bin/rmoriginal ]; then
sudo cp -f rm /usr/bin
fi
#programming tip from an inspired aspirant newbie: if you expect a condition to happen/be used more frequently than others, put it on front/prioritize it!
if [ ! -f /usr/bin/rmoriginal ]; then
#echo "Do you want to install our git replacement? 🧚‍♀️ [Y/n]"
#read wrapgit
#case $wrapgit in
#   [nN])
#      echo "Ok."
#      break ;;
#   [yY])
      sudo cp -rf /usr/bin/rm /usr/bin/rmoriginal && sudo chmod +x /usr/bin/rmoriginal
      echo "Done."
      echo "- Installing rm wrapper in /usr/bin..."
      sudo cp -f rm /usr/bin
      echo "- Turning rm wrapper into an executable..."
      sudo chmod 755 /usr/bin/rm && sudo chmod +x /usr/bin/rm
#      break ;;
#   *)
#      echo "${invalid}" ;;
#esac
fi

#echo "Installing app icon for 01..."
#cp -f icon.svg /usr/share/icons/hicolor/scalable/apps/01.svg
#ln -sf 01.svg /usr/share/icons/hicolor/scalable/apps/z1.svg
#ln -sf 01.svg /usr/share/icons/hicolor/scalable/apps/01vcs.svg
#sudo gtk-update-icon-cache /usr/share/icons/gnome/ -f

echo "Done! Run 'rmv' command anytime you need to use it." && exit
