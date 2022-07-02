export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
export DIFFPROG="nvim -d"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
# export BROWSER=/usr/bin/google-chrome-stable
export GRB_LICENSE_FILE=/home/moritz/licenses/gurobi.lic
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export PATH=$JAVA_HOME/bin:$PATH 

# fixes anki being blank 
export QTWEBENGINE_CHROMIUM_FLAGS="--no-sandbox"


PATH="/home/moritz/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/moritz/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/moritz/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/moritz/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/moritz/perl5"; export PERL_MM_OPT;
