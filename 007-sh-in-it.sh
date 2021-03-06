#### Why:  Initiate variable settings in Unix/Linux environments via definitions in YAML, fi. for default $MODULEPATH, LMOD_*, EASYBUILD_* etc
#### Who:  Fotis Georgatos, 2017, MIT license
__PARSEFILES=$(ls -f /etc/profile.definitions/{global*,site/*,sitelocal/*,nodecategory/*,groups/`id -gn`,user/`id -un`}.yml 2>/dev/null)

if [ -z "$__Init_Default_Profile" ]; then
  eval `for i in $__PARSEFILES; do [[ -s $i ]] && python /etc/profile.d/007-sh-in-it.xyzzy.py $i;done`
  export __Init_Default_Profile=1;
fi

unset __PARSEFILES
